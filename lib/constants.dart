import 'package:android_intent/android_intent.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class Constants {
  static String event1 =
      'This workshop introduced the basics of using version control by focusing on a particular version control system called Git and a collaboration platform called GitHub.It was a hands-on workshop where students learned about Version control Sytems and performed various Git commands and learned how to share their code on GitHub and work parallelly in teams.';
  static String event2 =
      'This was a Hands-on workshop on web development where a Codelab was followed to develop a Friendly Chat application using Firebase and at last, this application was made live using Firebase Hosting service.';
  static String event3 =
      'It was a program launched by Google Cloud Edu Team to make students career-ready in Cloud technology. This included a Study Jam in which Basic Cloud Labs were performed by students under the mentorship of Google Cloud Facilitators.';
  static String event4 =
      'In the month of October, Google Cloud Team launched a campaign called #GCPCrashCourse in collaboration with Developers Student Clubs. It was a Crash Course on Google Cloud Platform which included 3 Tracks'
      '\n(i) Application Development Track\n'
      '(ii) Machine Learning Track\n'
      '(iii) Data Science Track';
  static String aboutDsc =
      'Developer Student Club GL Bajaj is inspired by Google Developers Family. We started our journey in Feb 2019. We try to engage student developers through our hack events, codelabs and meetups. The motive is to bring designers and managers come together under one roof to create a local ecosystem of programmers & hackers in and around the Campus. The technology awareness is main goal for first few years of the group.';

  static List<String> fireBaseWebDay = [
    'http://bit.ly/2tmIPl3',
    'https://bit.ly/36QRhq8',
    'https://bit.ly/2UhGoLF',
    'http://bit.ly/3b3Q8PB',
    'http://bit.ly/2UjFCxO',
  ];
  static List<String> gcpCarrier = [
    'http://bit.ly/37P90zS',
    'http://bit.ly/382j8FD',
    'http://bit.ly/31hcmsO',
    'http://bit.ly/3b786jZ',
    'http://bit.ly/36UR7y1',
  ];
  static List<String> gcpCrashCourse = [
    'http://bit.ly/2Okv1yM',
    'http://bit.ly/37P9gik',
    'http://bit.ly/36R8vni',
    'http://bit.ly/3b0HKQZ',
    'http://bit.ly/2tldu1Z',
  ];
  static Widget flexCard(String txt, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: <Widget>[
            Text(
              txt,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple),
            ),
            Flexible(
              child: Text(
                value,
                softWrap: true,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget expendedCard(
      {String img,
      String txt,
      String detail,
      BuildContext context,
      bool largeRadius}) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(largeRadius ? 40 : 10),
          ),
        ),
        elevation: 3,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl: img,
                height: 100,
                placeholder: (context, url) =>
                    Image.asset('images/dsc_google.png', height: 100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                txt,
                style: TextStyle(
                  fontSize: largeRadius ? 17 : 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(detail == null ? '' : detail),
            ),
          ],
        ),
      ),
    );
  }

  static Widget socialRow({String img, String txt, String onPress}) {
    return Row(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: CachedNetworkImage(
              imageUrl: img,
              height: 100,
              placeholder: (context, url) =>
                  Image.asset('images/dsc_google.png', height: 100),
            )),
        Expanded(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: RawMaterialButton(
              padding: EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              onPressed: () async {
                if (Platform.isAndroid) {
                  AndroidIntent intent = AndroidIntent(
                    action: 'action_view',
                    data: onPress,
                  );
                  await intent.launch();
                }
              },
              child: Text(txt),
            ),
          ),
        ),
      ],
    );
  }
}
