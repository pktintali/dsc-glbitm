import 'package:android_intent/android_intent.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io' show Platform;
import '../constants.dart';

final _firestore = Firestore.instance;

class EventsStream extends StatelessWidget {
  final String type;
  EventsStream(this.type);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection(type).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final events = snapshot.data.documents;
          List<EventsBubble> membersWidgets = [];
          for (var event in events) {
            final poster = event.data['poster'];
            final title = event.data['title'];
            final date = event.data['date'];
            final id = event.data['id'];
            final place = event.data['place'];
            final description = event.data['description'];
            final onClickData = event.data['onClickData'];
            final timing = event.data['timing'];

            final messageWidget = EventsBubble(
              title: title,
              date: date,
              description: description,
              onClickData: onClickData,
              place: place,
              poster: poster,
              id: id,
              timing: timing,
            );
            membersWidgets.add(messageWidget);
          }
          membersWidgets.sort((a, b) {
            return a.id.compareTo(b.id);
          });

          return ListView(
            children: membersWidgets,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class EventsBubble extends StatelessWidget {
  final String poster;
  final String title;
  final String date;
  final String place;
  final String description;
  final String onClickData;
  final int id;
  final String timing;
  EventsBubble(
      {this.title,
      this.date,
      this.description,
      this.onClickData,
      this.place,
      this.id,
      this.timing,
      this.poster});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.0),
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: poster,
            placeholder: (context, url) => Image.asset(
              'images/dsc_google.png',
              height: 200,
            ),
            errorWidget: (context, url, error) => Image.network(poster == null
                ? 'https://carepharmaceuticals.com.au/wp-content/uploads/sites/19/2018/02/placeholder-600x400.png'
                : poster),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              title == null ? 'Title' : title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          Constants.flexCard('Timings: ', timing),
          Constants.flexCard('Date: ', date),
          Constants.flexCard('Venue: ', place),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Description: ',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    description,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: RaisedButton(
              elevation: 5,
              hoverColor: Colors.deepPurple,
              highlightColor: Colors.white,
              color: Colors.lightGreen,
              splashColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              onPressed: () async {
                if (Platform.isAndroid) {
                  AndroidIntent intent = AndroidIntent(
                    action: 'action_view',
                    data: onClickData == null ? '' : onClickData,
                  );
                  await intent.launch();
                }
              },
              child: Text('Register Now'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 2.0,
            color: Color(0xFF453CC0),
          ),
        ],
      ),
    );
  }
}
