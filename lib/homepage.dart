import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:slipsystem/New folder (2)/appdrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:slipsystem/New%20folder%20(2)/appdrawer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:slipsystem/New folder (2)/live.dart';

int correctans = 0;
int wrongans = 0;
int notans = 0;
int i = 1;
int _page = 0;
var _scaffoldKey = new GlobalKey<ScaffoldState>();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names

  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: AppDrawer(),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 46.0,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.home_outlined, size: 30),
          Icon(Icons.call_split, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.deepPurple[800],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final databaseReference = FirebaseFirestore.instance;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          height: 50,
          margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blue,
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(12, 0, 8, 0),
                child: GestureDetector(
                  child: Icon(
                    Icons.menu_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  onTap: () => _scaffoldKey.currentState.openDrawer(),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.68, 0, 8, 0),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.fromLTRB(20, 0, 15, 10),
          child: Row(
            children: [
              Text(
                'Live Class',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          height: 210,
          width: MediaQuery.of(context).size.width * 1,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: databaseReference.collection('liveclass').snapshots(),
                  // ignore: missing_return
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? Text('PLease Wait')
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot course =
                                  snapshot.data.docs[index];
                              return CoursesItem(
                                subject: course.data()['subject'],
                                timing: course.data()['timing'],
                                imgurl: course.data()['imgurl'],
                                channel: course.data()['channel'],
                              );
                            },
                          );
                  }),
            ],
          ),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.fromLTRB(20, 0, 15, 10),
          child: Row(
            children: [
              Text(
                'Upcoming Classes',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                'See All',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Container(
          height: 120,
          width: MediaQuery.of(context).size.width * 1,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream:
                      databaseReference.collection('upcomingclass').snapshots(),
                  // ignore: missing_return
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? Text('PLease Wait')
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot course =
                                  snapshot.data.docs[index];
                              return UpcomingClass(
                                subject: course.data()['subject'],
                                timing: course.data()['timing'],
                                iconurl: course.data()['iconurl'],
                              );
                            },
                          );
                  }),
            ],
          ),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.fromLTRB(20, 0, 15, 10),
          child: Row(
            children: [
              Text(
                'Upcoming Classes',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                'See All',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        Container(
          height: 270,
          width: MediaQuery.of(context).size.width * 1,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: databaseReference
                      .collection('upcomingclasssecond')
                      .snapshots(),
                  // ignore: missing_return
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? Text('PLease Wait')
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot course =
                                  snapshot.data.docs[index];
                              return UpcomingClasssecond(
                                iconurl: course.data()['iconurl'],
                                subject: course.data()['subject'],
                              );
                            },
                          );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}

class CoursesItem extends StatelessWidget {
  final String subject;
  final String timing;
  final String imgurl;
  final String channel;
  CoursesItem(
      {this.imgurl, this.timing, this.subject, this.channel, this.role});
  final String role;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: MediaQuery.of(context).size.width * 1 - 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage('$imgurl'),
            fit: BoxFit.fill,
          )),
      child: GestureDetector(
        child: Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Column(
            children: [
              Container(
                height: 160,
              ),
              Text(
                '$subject',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                '$timing',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        onTap: () {
          onJoin();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LivePage()));
        },
      ),
    );
  }
}

class UpcomingClass extends StatelessWidget {
  final String subject;
  final String timing;
  final String iconurl;
  UpcomingClass({this.subject, this.timing, this.iconurl});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        width: 260,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.lightBlueAccent),
        child: Row(
          children: [
            Container(
              width: 70,
              margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: Image.network(
                '$iconurl',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(3, 27.5, 10, 10),
                  child: AutoSizeText(
                    '$subject',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    maxLines: 2,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(3, 0, 10, 0),
                  child: AutoSizeText(
                    '$timing',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

class UpcomingClasssecond extends StatelessWidget {
  final String iconurl;
  final String subject;
  UpcomingClasssecond({
    this.iconurl,
    this.subject,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.pink,
      ),
      child: Column(
        children: [
          Container(
              height: 190,
              width: MediaQuery.of(context).size.width * 0.5,
              padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.network(
                  '$iconurl',
                  fit: BoxFit.fill,
                ),
              )),
          Text(
            '$subject',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

Future<void> onJoin() async {
  // update input validation

  if (i == 1) {
    // await for camera and mic permissions before pushing video page
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);
    // push video page with given channel name

  }
}

Future<void> _handleCameraAndMic(Permission permission) async {
  final status = await permission.request();
  print(status);
}
