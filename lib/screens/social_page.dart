import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project/screens/editprofilepage.dart';
import 'package:project/screens/home.dart';
import 'package:project/screens/calenderpage.dart';
import 'package:project/utilities/postSocial.dart/addPost.dart';
import 'package:project/utilities/postSocial.dart/postCard.dart';
import 'package:project/utilities/publicAppBar.dart';
import 'package:project/utilities/search.dart';
import 'package:intl/intl.dart';

class SocialPage extends StatefulWidget {
  const SocialPage({Key? key}) : super(key: key);

  @override
  _SocialPage createState() => _SocialPage();
}

class _SocialPage extends State<SocialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // Adding task
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => addScreenPosts()),
          );
        },
        child: Icon(Icons.post_add_rounded),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            AppBars(elevation: 0, flexibleSpace: Container()),
            // Search Bar
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                child: Container(
                    margin: EdgeInsets.only(top: (20)),
                    padding: EdgeInsets.all(10),
                    height: 40,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromARGB(255, 36, 23, 23).withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text("What do you want to search?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF2585DE)))),
              ),
            ]),

            // Post 1
            PostCard(),
            PostCard()
          ],
        ),
      ),
    );
  }
}
