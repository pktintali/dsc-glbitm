import 'package:flutter/material.dart';
import 'package:dsc_glbajaj/Firebase_Data/EventsStream.dart';

import 'PassedEvent.dart';

class Events extends StatefulWidget {
  static String id = 'event';
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Events'),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: 'Upcoming Events',
              ),
              Tab(
                text: 'Past Events',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            EventsStream('events'),
            PassedEvents(),
          ],
        ),
      ),
    );
  }
}
