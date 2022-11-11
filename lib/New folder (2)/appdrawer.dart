import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slipsystem/New folder (2)/test.dart';
import 'package:slipsystem/New folder (2)//setting.dart';
import 'package:slipsystem/New folder (2)/quizhome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:slipsystem/New folder (2)//profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final databaseReference = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(250)),
      child: new Drawer(
        child: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: FlatButton(
                  child: Icon(
                    Icons.home,
                    color: Colors.orangeAccent.shade400,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TestPage()));
                  },
                ),
              ),
              ListTile(
                title: Text(
                  "Profile",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: RaisedButton(
                  child: Icon(
                    Icons.book,
                    color: Colors.orangeAccent.shade400,
                  ),
                  onPressed: () {
                    final User user = _auth.currentUser;
                    final uid = user.uid;
                    // Similarly we can get email as well
                    final uemail = user.email;
                    final uname = user.displayName;
                    final uimg = user.photoURL;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilePage(
                                  uemail: uemail,
                                  uname: uname,
                                  uimg: uimg,
                                  first: uname,
                                )));
                  },
                ),
              ),
              ListTile(
                title: Text(
                  "Schedule",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: FlatButton(
                  child: Icon(
                    Icons.store,
                    color: Colors.orangeAccent.shade400,
                  ),
                  onPressed: () async {
                    final QuerySnapshot result = await FirebaseFirestore
                        .instance
                        .collection('myCollection')
                        .get();
                    final List<DocumentSnapshot> question = result.docs;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Quizzler()));
                  },
                ),
              ),
              ListTile(
                title: Text(
                  "My Purchases",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: FlatButton(
                  child: Icon(
                    Icons.work,
                    color: Colors.orangeAccent.shade400,
                  ),
                  onPressed: () {},
                ),
              ),
              ListTile(
                title: Text(
                  "Assignments",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.attach_money,
                  color: Colors.orangeAccent.shade400,
                ),
              ),
              ListTile(
                title: Text(
                  "Settings",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: FlatButton(
                  child: Icon(
                    Icons.settings,
                    color: Colors.orangeAccent.shade400,
                  ),
                  onPressed: () {
                    final User user = _auth.currentUser;
                    final uid = user.uid;
                    // Similarly we can get email as well
                    final uname = user.displayName;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsOnePage(
                                  uname: uname,
                                )));
                  },
                ),
              ),
              ListTile(
                title: Text(
                  "Account",
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Icon(
                  Icons.person,
                  color: Colors.orangeAccent.shade400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
