import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io' show Platform;

final _firestore = Firestore.instance;

class UpdatesStream extends StatelessWidget {
  final String type;
  UpdatesStream(this.type);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection(type).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final updates = snapshot.data.documents;
          List<UpdatesBubble> updatesWidgets = [];
          for (var update in updates) {
            final id = update.data['id'];
            final date = update.data['date'];
            final time = update.data['time'];
            final message = update.data['message'];
            final action = update.data['action'];
            final img = update.data['image'];

            final messageWidget = UpdatesBubble(
              id: id,
              date: date,
              action: action,
              message: message,
              time: time,
              img: img,
            );
            updatesWidgets.add(messageWidget);
          }
          updatesWidgets.sort((a, b) {
            return a.id.compareTo(b.id);
          });

          return ListView(
            children: updatesWidgets,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class UpdatesBubble extends StatelessWidget {
  final int id;
  final String message;
  final String time;
  final String date;
  final String action;
  final String img;
  UpdatesBubble({
    this.id,
    this.date,
    this.img,
    this.message,
    this.action,
    this.time,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              bottomLeft:
                  img == null ? Radius.circular(40.0) : Radius.circular(10.0),
              topLeft:
                  img == null ? Radius.circular(0.0) : Radius.circular(10.0),
            )),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        date,
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        time,
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                img == null ? Container() : Image.network(img),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 12, left: 20, right: 15),
                  child: Text(
                    message,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                action == null
                    ? Container()
                    : FlatButton(
                        splashColor: Colors.grey,
                        highlightColor: Colors.yellowAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            side: BorderSide(
                                color: Colors.deepPurple, width: 1.0)),
                        child: Text(
                          'See More',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () async {
                          if (Platform.isAndroid) {
                            AndroidIntent intent = AndroidIntent(
                                action: 'action_view',
                                data: Uri.encodeFull(action),
                                package: 'com.android.chrome');
                            await intent.launch();
                          }
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
