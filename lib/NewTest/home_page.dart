import 'package:android_intent/android_intent.dart';
import 'package:dsc_glbajaj/screen/about.dart';
import 'package:dsc_glbajaj/screen/contact.dart';
import 'package:dsc_glbajaj/screen/event.dart';
import 'package:dsc_glbajaj/screen/gallery.dart';
import 'package:dsc_glbajaj/screen/team.dart';
import 'package:flutter/material.dart';
import 'package:dsc_glbajaj/NewTest/auth.dart';
import 'package:dsc_glbajaj/NewTest/auth_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_glbajaj/screen/updates.dart';
import 'package:flutter/services.dart';
import 'dart:io' show Platform;

class HomePage extends StatefulWidget {
  const HomePage({this.onSignedOut});
  final VoidCallback onSignedOut;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                          tooltip: 'Announcements',
                          icon: Icon(
                            Icons.notifications_active,
                            color: Colors.pink,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, Updates.id);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: IconButton(
                          tooltip: 'Sign OUT',
                          icon: Image.asset(
                            'images/logout.png',
                          ),
                          onPressed: () => _signOut(context),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 50, top: 20, right: 50),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://www.sumanastech.com/wp-content/uploads/2018/10/app-development-illustration.png',
                        height: 210,
                        placeholder: (context, url) =>
                            Image.asset('images/dsc_blueLogo.png', height: 200),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  'Welcome To DSC GLBajaj',
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
              ),
              GridView.count(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                shrinkWrap: true,
                crossAxisCount: 3,
                children: <Widget>[
                  _cardButton(title: 'Events'),
                  _cardButton(title: 'Team'),
                  _cardButton(title: 'Gallery'),
                  _cardButton(title: 'About'),
                  _cardButton(title: 'Contact'),
                  _cardButton(title: 'Website'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardButton({String title}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: RaisedButton(
        elevation: 8,
        splashColor: Colors.grey,
        highlightColor: Colors.yellowAccent,
        onPressed: () async {
          if (title == 'Events') {
            Navigator.pushNamed(context, Events.id);
          }
          if (title == 'Team') {
            Navigator.pushNamed(context, TeamMembers.id);
          }
          if (title == 'About') {
            Navigator.pushNamed(context, About.id);
          }
          if (title == 'Gallery') {
            Navigator.pushNamed(context, Stories.id);
          }
          if (title == 'Contact') {
            Navigator.pushNamed(context, Contact.id);
          }
          if (title == 'Website') {
            if (Platform.isAndroid) {
              AndroidIntent intent = AndroidIntent(
                  action: 'action_view',
                  data: Uri.encodeFull(
                      'https://devangsaxena.github.io/dscglbajaj/'),
                  package: 'com.android.chrome');
              await intent.launch();
            }
          }
        },
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Color(0xFF453CD7), width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
