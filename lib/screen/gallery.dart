import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_glbajaj/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Stories extends StatefulWidget {
  static String id = 'Gallery';
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  int p = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '#GCPCrashCourse',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            slider(Constants.gcpCrashCourse),
            selectorRow(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Cloud Jam 2019',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            slider(Constants.gcpCarrier),
            selectorRow(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Web Development With Firebase',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            slider(Constants.fireBaseWebDay),
            selectorRow(),
          ],
        ),
      ),
    );
  }

  Widget slider(List photosList) {
    return CarouselSlider(
      onPageChanged: (i) {
        setState(() {
          p = i;
        });
      },
      autoPlay: true,
      enlargeCenterPage: true,
      height: 160.0,
      items: photosList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              //decoration: BoxDecoration(color: Colors.amber),
              child: CachedNetworkImage(
                imageUrl: i,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget selectorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        selectedImg(0),
        selectedImg(1),
        selectedImg(2),
        selectedImg(3),
        selectedImg(4),
      ],
    );
  }

  Widget selectedImg(int j) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color: j == p ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
      ),
    );
  }
}
