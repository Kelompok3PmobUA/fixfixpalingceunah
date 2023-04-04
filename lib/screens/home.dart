import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project/screens/calenderpage.dart';
import 'package:project/screens/social_page.dart';
import 'package:project/utilities/homeappbar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ======================================== Create Model ========================================
class ToDo {
  String id;
  String toDoAct;
  String toDoNote;
  String toDoTime;
  bool isDone;

  ToDo({
    required this.id,
    required this.toDoAct,
    required this.toDoNote,
    required this.toDoTime,
    this.isDone = false,
  });

  static List<ToDo> toDoList() {
    return [
      ToDo(
          id: "1",
          toDoAct: "Contoh 1",
          toDoNote: "Keterangan Disini",
          toDoTime: "00.00",
          isDone: true),
      ToDo(
          id: "2",
          toDoAct: "Contoh 2",
          toDoNote: "Keterangan Disini (2)",
          toDoTime: "01.00",
          isDone: false),
    ];
  }
}

class ToDoListTile extends StatelessWidget {
  final ToDo toDo;
  Function(BuildContext)? deleteTask;

  ToDoListTile({super.key, required this.toDo, required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Material(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Slidable(
              endActionPane: ActionPane(motion: StretchMotion(), children: [
                SlidableAction(
                  onPressed: deleteTask,
                  icon: Icons.delete_forever_rounded,
                  foregroundColor: Colors.black,
                  autoClose: true,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  backgroundColor: Colors.red,
                ),
              ]),
              child: ListTile(
                // onTap: () => showDialog(
                //     context: context,
                //     builder: (context) {
                //       return ShowTask(todo: todo);
                //     }),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Icon(
                  toDo.isDone ? Icons.check_circle : Icons.pending_actions,
                  color: toDo.isDone ? Colors.green : Color(0xFF2585DE),
                ),
                title: Text(
                  toDo.toDoAct,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: toDo.isDone ? Color(0xFF9AC8F4) : Color(0xFF2585DE),
                  ),
                ),
                subtitle: Text(
                  toDo.toDoNote,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w500,
                    color: toDo.isDone ? Color(0xFF9AC8F4) : Color(0xFF2585DE),
                  ),
                ),
                trailing: Text(
                  toDo.toDoTime,
                  style: TextStyle(
                    color: Color(0xFF8C8C8C),
                    fontFamily: 'Nunito',
                  ),
                ),
              ))),
    );
  }
}

// ======================================== HOME PAGES ========================================
class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todotile = ToDo.toDoList();

  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final trailingController = TextEditingController();

  // Create Pop - Up to Add Task
  addNewtask() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Tambahkan Tugas',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Nunito',
                    color: Color(0xFF2585DE),
                  ),
                ),
                SizedBox(height: 35),

                // Input Activity
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Kegiatan',
                      fillColor: Color(0xFF2585DE)),
                ),
                SizedBox(height: 15),

                // Input Keterangan Tambahan
                TextField(
                  controller: subtitleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Keterangan',
                  ),
                ),
                SizedBox(height: 15),

                // Input Waktu
                TextField(
                  controller: trailingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Jam',
                  ),
                ),
                SizedBox(height: 20),

                // Tombol save
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      height: 40,
                      onPressed: saveNewTask,
                      color: Color(0xFF2585DE),
                      child: Text(
                        'Simpan',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                    MaterialButton(
                      height: 40,
                      onPressed: () => Navigator.of(context).pop(),
                      color: Color(0xFF2585DE),
                      child: Text(
                        'Kembali',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  // Save New Task
  void saveNewTask() {
    // Automically pop out the add box when save tapped
    Navigator.of(context).pop();

    // Rebuild the List<ToDo>
    setState(() {
      todotile.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          toDoAct: titleController.text,
          toDoNote: subtitleController.text,
          toDoTime: trailingController.text));
      titleController.clear();
      subtitleController.clear();
      trailingController.clear();
    });
  }

  // Delete Task
  void _onDeleteTask(String id) {
    setState(() {
      todotile.removeWhere((todotile) => todotile.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(185), child: HomeAppBar()),
      floatingActionButton: FloatingActionButton(
        // Adding task
        onPressed: () => addNewtask(),
        child: Icon(Icons.post_add_rounded),
      ),
      body: Column(
        children: <Widget>[
          // Body Page
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
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

                // Contain all task available
                for (ToDo toDo in todotile)
                  ToDoListTile(
                      toDo: toDo, deleteTask: (context) => _onDeleteTask),

                // Change the for above to this (soon):
                // ListView.builder(
                //   itemCount: todotile.length,
                //   itemBuilder: (context, index){
                //     return ToDoListTile(toDo: todo,
                //     deleteTask: (context) => _onDeleteTask)
                //   }
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
