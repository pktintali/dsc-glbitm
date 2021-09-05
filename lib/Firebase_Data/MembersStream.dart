import 'package:android_intent/android_intent.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io' show Platform;

final _firestore = Firestore.instance;

class MembersStream extends StatelessWidget {
  final String type;
  MembersStream(this.type);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection(type).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final members = snapshot.data.documents;
          List<MembersProfile> membersWidgets = [];
          for (var member in members) {
            final name = member.data['name'];
            final logo = member.data['logo'];
            final insta = member.data['insta'];
            final fb = member.data['fb'];
            final linked = member.data['linked'];
            final id = member.data['id'];

            final messageWidget = MembersProfile(
              name: name,
              logo: logo,
              insta: insta,
              fb: fb,
              linkedin: linked,
              id: id,
            );
            membersWidgets.add(messageWidget);
          }
          membersWidgets.sort((a, b) {
            return a.id.compareTo(b.id);
          });
          return GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
            shrinkWrap: true,
            childAspectRatio: 1 / 1.42,
            children: membersWidgets,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class MembersProfile extends StatelessWidget {
  final String name;
  final String logo;
  final String insta;
  final String fb;
  final String linkedin;
  final int id;
  MembersProfile(
      {this.id, this.name, this.logo, this.fb, this.insta, this.linkedin});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.0),
      child: Card(
        elevation: 3.5,
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(top: 15, bottom: 8, left: 8, right: 8),
              child: Container(
                child: CachedNetworkImage(
                  imageUrl: logo == null ? '' : logo,
                  imageBuilder: (context, imageProvider) {
                    return CircleAvatar(
                      radius: 70,
                      backgroundImage: imageProvider,
                    );
                  },
                  placeholder: (context, url) =>
                      Image.asset('images/dsc_google.png', height: 140),
                  errorWidget: (context, url, error) => Image.asset(
                    'images/dsc_blueLogo.png',
                    height: 140,
                  ),
                ),
              ),
            ),
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: null,
                  tooltip: 'Follow on Facebook',
                  onPressed: () async {
                    if (Platform.isAndroid) {
                      AndroidIntent intent = AndroidIntent(
                        action: 'action_view',
                        data: Uri.encodeFull(
                          'fb://facewebmodal/f?href=$fb',
                        ),
                      );
                      await intent.launch();
                    }
                  },
                  mini: true,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'images/fb3d.png',
                    height: 30,
                    width: 30,
                  ),
                ),
                FloatingActionButton(
                  tooltip: 'Follow on Instagram',
                  heroTag: null,
                  onPressed: () async {
                    if (Platform.isAndroid) {
                      AndroidIntent intent = AndroidIntent(
                          action: 'action_view',
                          data: 'https://www.instagram.com/'
                              '$insta',
                          package: 'com.instagram.android');
                      await intent.launch();
                    }
                  },
                  mini: true,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'images/insta3d.png',
                    height: 30,
                    width: 30,
                  ),
                ),
                FloatingActionButton(
                  tooltip: 'Follow on linkedin',
                  heroTag: null,
                  onPressed: () async {
                    if (Platform.isAndroid) {
                      AndroidIntent intent = AndroidIntent(
                          action: 'action_view',
                          data: 'http://www.linkedin.com/profile/view?id='
                              '${linkedin == null ? 'http://www.linkedin.com/' : linkedin}',
                          package: 'com.android.chrome');
                      await intent.launch();
                    }
                  },
                  mini: true,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'images/linked_in3d.png',
                    height: 35,
                    width: 35,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
