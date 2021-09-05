import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:dsc_glbajaj/Firebase_Data/UpdatesStream.dart';

class Updates extends StatefulWidget {
  static String id = 'Updates';
  @override
  _UpdatesState createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF9C1),
      appBar: AppBar(
        title: Text('Announcements'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://devangsaxena.github.io/dscglbajaj/images/resource/topic-girl.png',
                    placeholder: (context, url) => Image.asset(
                      'images/dsc_google.png',
                      height: 200,
                    ),
                    errorWidget: (context, url, error) =>
                        Image.asset('images/dsc_google.png'),
                  ),
                ),
              ),
            ],
          ),
          UpdatesStream('dscUpdates'),
        ],
      ),
    );
  }
}
