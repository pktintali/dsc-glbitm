import 'package:dsc_glbajaj/screen/about.dart';
import 'package:dsc_glbajaj/screen/contact.dart';
import 'package:dsc_glbajaj/screen/event.dart';
import 'package:dsc_glbajaj/screen/gallery.dart';
import 'package:dsc_glbajaj/screen/team.dart';
import 'package:flutter/material.dart';
import 'package:dsc_glbajaj/NewTest/root_page.dart';
import 'package:dsc_glbajaj/NewTest/auth.dart';
import 'package:dsc_glbajaj/NewTest/auth_provider.dart';
import 'package:dsc_glbajaj/screen/updates.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        routes: {
          Stories.id: (context) => Stories(),
          Events.id: (context) => Events(),
          TeamMembers.id: (context) => TeamMembers(),
          About.id: (context) => About(),
          Contact.id: (context) => Contact(),
          Updates.id: (context) => Updates(),
        },
        title: 'DSC GLBajaj',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme().copyWith(
            color: Color(0xFF453CC0),
          ),
        ),
        home: RootPage(),
      ),
    );
  }
}
