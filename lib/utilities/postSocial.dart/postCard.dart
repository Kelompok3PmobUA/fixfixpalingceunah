import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 20, right: 30, bottom: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 36, 23, 23).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 10), // changes position of shadow
          ),
        ],
      ),
      child: Column(children: [
        // Header Section
        Container(
          width: 400,
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16)
              .copyWith(right: 0),
          child: Row(children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "username",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                              child: ListView(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shrinkWrap: true,
                            children: [
                              'Delete',
                            ]
                                .map((e) => InkWell(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 16),
                                      child: Text(e),
                                    )))
                                .toList(),
                          )));
                },
                icon: Icon(Icons.more_vert))
          ]),
        ),

        // Image Section
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: 400,
            child: Image(
              image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2015/11/16/16/28/bird-1045954_1280.jpg'),
              fit: BoxFit.cover,
            )),

        // LC Section
        Container(
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                IconButton(
                  icon: Icon(Icons.comment),
                  onPressed: () {},
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            )),

        // Caption section
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("10 Likes"),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 8),
                child: RichText(
                  text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'username',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: ' Hello there, It is a description')
                      ]),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    "View comment",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
    ;
  }
}
