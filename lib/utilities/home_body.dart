import 'package:flutter/material.dart';
//import 'package:flutter_application_1/to-do use/to-do-list.dart';
import 'package:project/utilities/todo.dart';
import 'addTaskBox.dart';
import 'appBar.dart';

class BodyHome extends StatelessWidget {
  int index = 0;
  BodyHome({super.key});

  final toDosList = ToDo.todoList();

  // void createTask() {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [
              // AppBar
              FullAppBar(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     // Welcome text
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           "Halo Wahyu",
              //           style: TextStyle(
              //             fontSize: 30,
              //             fontFamily: 'Nunito',
              //             color: Color(0xFF2585DE),
              //             fontWeight: FontWeight.w700,
              //           ),
              //         ),
              //         Text(
              //           "Saat ini kamu punya x tugas",
              //           style: TextStyle(
              //               fontSize: 15,
              //               fontFamily: 'Nunito',
              //               color: Color(0xFF2585DE),
              //               fontWeight: FontWeight.w400),
              //         ),
              //       ],
              //     ),

              //     // Proflie Pict
              //     Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         color: Color(0xFF2585DE),
              //       ),
              //       child: Image(
              //           image: ResizeImage(AssetImage('image/bayu skak.jpg'),
              //               width: 50, height: 50)),
              //     ),

              //     SizedBox(
              //       height: 75,
              //     )
              //   ],
              // ),

              // Body Page
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: Text(
                        "Hari ini",
                        style: TextStyle(
                          color: Color(0xFF6C9BC8),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),

                    // // Contain all task available
                    // for (ToDo todo in toDosList) ToDoList(todo: todo),
                  ],
                ),
              )
            ]),
          ),

          // Add-task Button
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(
                right: 20,
                bottom: 75,
              ),
              child: FloatingActionButton(
                // Adding task
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AddTaskBox();
                    }),
                child: Icon(Icons.post_add_rounded),
                mini: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
