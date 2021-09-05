import 'package:dsc_glbajaj/Firebase_Data/MembersStream.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeamMembers extends StatefulWidget {
  static String id = 'team';

  @override
  _TeamMembersState createState() => _TeamMembersState();
}

class _TeamMembersState extends State<TeamMembers> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Team Members'),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: 'Technical Coordinator',
              ),
              Tab(
                text: 'Content Writer',
              ),
              Tab(
                text: 'Photo & Videography',
              ),
              Tab(
                text: 'Event Management',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MembersStream('dscTechCo'),
            MembersStream('dscContentWriter'),
            MembersStream('media'),
            MembersStream('eventManagement'),
          ],
        ),
      ),
    );
  }
}
