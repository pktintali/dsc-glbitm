import 'package:android_intent/android_intent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import '../constants.dart';

class Contact extends StatefulWidget {
  static String id = 'Contact';
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get In Touch With Us'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'E-Mail:',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  FlatButton(
                    padding: EdgeInsets.symmetric(horizontal: 2.0),
                    onPressed: () async {
                      if (Platform.isAndroid) {
                        AndroidIntent intent = AndroidIntent(
                          action: 'action_view',
                          data: 'mailto:dscglbajaj@gmail.com',
                        );
                        await intent.launch();
                      }
                    },
                    child: Text(
                      'dscglbajaj@gmail.com',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Constants.socialRow(
              img:
                  'https://pluspng.com/img-png/instagram-png-instagram-png-logo-1455.png',
              txt: 'Instagram',
              onPress: 'https://www.instagram.com/dscglbajaj/',
            ),
            Constants.socialRow(
              img: 'https://www.facebook.com/images/fb_icon_325x325.png',
              txt: 'Facebook',
              onPress: 'https://www.facebook.com/dscgjbajaj',
            ),
            Constants.socialRow(
              img:
                  'https://1000logos.net/wp-content/uploads/2017/03/LinkedIn-Logo.png',
              txt: 'Linkedin',
              onPress: 'https://in.linkedin.com/company/dscglbajaj',
            ),
            Constants.socialRow(
              img: 'https://pngimg.com/uploads/twitter/twitter_PNG9.png',
              txt: 'Twitter',
              onPress: 'https://twitter.com/dscglbajaj',
            ),
            //Constants.socialRow(),
          ],
        ),
      ),
    );
  }
}
