import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_glbajaj/constants.dart';

final databaseReference = Firestore.instance;

class PassedEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          newColumn(
            img: 'https://avatars2.githubusercontent.com/u/21183283?s=460&v=4',
            title: '#GCPCrashCourse',
            date: '9 October 2019 - 15 October 2019',
            timing: '02:00 PM - 05:00 PM',
            venue: 'Room No 218',
            description: Constants.event4,
            context: context,
          ),
          newColumn(
            img:
                'https://hitconsultant.net/wp-content/uploads/2018/09/CareCloud-Google.png',
            title: 'Cloud Career Readiness Program',
            timing: '09:30 AM - 01:30 PM 02:00 PM - 05:00 PM',
            date: '6 August 2019',
            venue: 'PC Lab',
            description: Constants.event3,
            context: context,
          ),
          newColumn(
            img:
                'https://firebase.google.com/images/brand-guidelines/logo-standard.png',
            title: 'Web Development using Firebase',
            date: '6 April 2019',
            timing: '02:00 PM - 05:00 PM',
            venue: 'IT Seminar Hall',
            description: Constants.event2,
            context: context,
          ),
          newColumn(
            img: 'https://bit.ly/2S2lq0k',
            title: 'Version Control Git and GitHub',
            timing: '11:00 AM - 02:00 PM',
            date: '11 February 2019',
            venue: 'Auditorium 1',
            description: Constants.event1,
            context: context,
          ),
        ],
      ),
    );
  }

  Widget newColumn({
    String img,
    String title,
    String timing,
    String date,
    String venue,
    String description,
    BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 3, right: 3),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        elevation: 3.0,
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: img,
              placeholder: (context, url) =>
                  Image.asset('images/dsc_google.png', height: 200),
            ),
            Padding(
              padding: EdgeInsets.only(top: 6, left: 5, right: 5),
              child: Text(
                title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            Constants.flexCard('Timings: ', timing),
            Constants.flexCard('Date: ', date),
            Constants.flexCard('Venue: ', venue),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(description, style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
