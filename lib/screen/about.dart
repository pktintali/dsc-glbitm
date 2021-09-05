import 'package:android_intent/android_intent.dart';
import 'package:dsc_glbajaj/constants.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class About extends StatefulWidget {
  static String id = 'about';
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About DSC GLBajaj'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                    right: 4,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[],
                  ),
                ),
                Image.asset('images/dsc_glbajaj1.jpeg'),
                FlatButton(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      side: BorderSide(width: 1.0, color: Colors.green)),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Our Features',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.purple),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Constants.expendedCard(
                      img:
                          'https://cdn0.iconfinder.com/data/icons/sport-achievment-badges/128/sport_badges-05-512.png',
                      txt: 'Experience',
                      detail:
                          'Meet the experts from the tech and design world you follow online.',
                      largeRadius: false,
                      context: context,
                    ),
                    Constants.expendedCard(
                      img:
                          'https://d33wubrfki0l68.cloudfront.net/6b5ae40221480563a4d397012ab9b192d371b731/71a4d/img/logos/networkservicemesh-icon-color.png',
                      txt: 'Networking',
                      detail:
                          'Connect with and exchange ideas with designers from all over the country.',
                      largeRadius: false,
                      context: context,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Constants.expendedCard(
                      img:
                          'https://freeiconshop.com/wp-content/uploads/edd/code-flat.png',
                      txt: 'Code Labs',
                      detail:
                          'Get hands-on experience and guidance from the community members.',
                      context: context,
                      largeRadius: false,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 15),
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        Constants.aboutDsc,
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      side: BorderSide(width: 1.0, color: Colors.green)),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(
                      'DOMAINS',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.purple),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Constants.expendedCard(
                        img:
                            'https://devangsaxena.github.io/dscglbajaj/images/icons/android1.jpg',
                        txt: 'Android',
                        context: context,
                        largeRadius: true,
                      ),
                      Constants.expendedCard(
                        img:
                            'https://devangsaxena.github.io/dscglbajaj/images/icons/flutter1.jpg',
                        txt: 'Flutter',
                        largeRadius: true,
                        context: context,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Constants.expendedCard(
                      img:
                          'https://devangsaxena.github.io/dscglbajaj/images/icons/machine1.jpg',
                      txt: 'Machine Learning',
                      context: context,
                      largeRadius: true,
                    ),
                    Constants.expendedCard(
                      img:
                          'https://devangsaxena.github.io/dscglbajaj/images/icons/web1.jpg',
                      txt: 'Web Development',
                      largeRadius: true,
                      context: context,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Constants.expendedCard(
                      img:
                          'https://devangsaxena.github.io/dscglbajaj/images/icons/voice.jpg',
                      txt: 'Voice Developer',
                      largeRadius: true,
                      context: context,
                    ),
                    Constants.expendedCard(
                      img:
                          'https://devangsaxena.github.io/dscglbajaj/images/icons/gcloud1.jpg',
                      largeRadius: true,
                      txt: 'Google Cloud',
                      context: context,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Constants.expendedCard(
                      img:
                          'https://devangsaxena.github.io/dscglbajaj/images/icons/photo3.jpg',
                      txt: 'Photography',
                      largeRadius: true,
                      context: context,
                    ),
                    Constants.expendedCard(
                      img:
                          'https://devangsaxena.github.io/dscglbajaj/images/icons/tech.png',
                      largeRadius: true,
                      txt: 'Technical Writing',
                      context: context,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Constants.expendedCard(
                      img:
                          'https://devangsaxena.github.io/dscglbajaj/images/icons/event.jpg',
                      largeRadius: true,
                      txt: 'Event Management',
                      context: context,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Designed and Developed By:'),
                    FlatButton(
                      padding: EdgeInsets.all(3.0),
                      onPressed: () async {
                        if (Platform.isAndroid) {
                          AndroidIntent intent = AndroidIntent(
                              action: 'action_view',
                              data: 'https://www.instagram.com/'
                                  'pradeeptintali',
                              package: 'com.instagram.android');
                          await intent.launch();
                        }
                      },
                      child: Text(
                        '@Pradeep Tintali',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
