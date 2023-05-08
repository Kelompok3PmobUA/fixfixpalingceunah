import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../provider/all_list.dart';
import '../utilities/to-do-list.dart';
import '../utilities/homeAppBar.dart';
import '../utilities/todo.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  TimeOfDay timeSelected = TimeOfDay.now();

  late List<ToDo> todos;

  void initState() {
    this.todos = todoList();
  }

  // Pop - Up to Add Task
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
              const SizedBox(height: 35),

              // Input Activity
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Kegiatan',
                    fillColor: Color(0xFF2585DE)),
              ),
              const SizedBox(height: 15),

              // Input Keterangan Tambahan
              TextField(
                controller: subtitleController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Keterangan',
                ),
              ),
              const SizedBox(height: 15),

              // Input Tanggal
              MaterialButton(
                minWidth: double.infinity,
                height: 50,
                onPressed: pickDate,
                color: Color(0xFF2585DE),
                child: Text(
                  'Pilih tanggal',
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    fontFamily: 'Nunito',
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Input Jam
              MaterialButton(
                minWidth: double.infinity,
                elevation: 3,
                height: 50,
                onPressed: pickTime,
                color: Color(0xFF2585DE),
                child: const Text(
                  'Pilih jam',
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    fontFamily: 'Nunito',
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Tombol save & cancel
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    minWidth: 102,
                    height: 40,
                    onPressed: () {
                      Provider.of<AllList>(context, listen: false).addList(
                        ToDo(
                          id: const Uuid().v4(),
                          toDoAct: titleController.text,
                          toDoNote: subtitleController.text,
                          toDoTime: timeSelected.format(context).toString(),
                          isDone: false,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    color: Color(0xFF2585DE),
                    child: const Text(
                      'Simpan',
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                  ),
                  MaterialButton(
                    minWidth: 102,
                    height: 40,
                    onPressed: () => Navigator.of(context).pop(),
                    color: Color(0xFF2585DE),
                    child: const Text(
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
      },
    );
  }

  // Pick the Date
  void pickDate() {
    showDatePicker(
      helpText: 'Pilih Tanggal',
      initialEntryMode: DatePickerEntryMode.calendar,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
  }

  // Pick the Time
  void pickTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then(
      (value) {
        setState(
          () {
            timeSelected = value!;
          },
        );
      },
    );
  }

  // // Show Task Selected
  // showTask(int index) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Text(
  //               toDoList[index][0],
  //               style: TextStyle(
  //                   fontFamily: 'Nunito',
  //                   fontSize: 30,
  //                   fontWeight: FontWeight.w700,
  //                   color: Color(0xFF2585DE)),
  //             ),
  //             const SizedBox(height: 20),
  //             Text(
  //               'Keterangan:',
  //               style: TextStyle(
  //                   fontFamily: 'Nunito',
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.w500,
  //                   color: Color(0xFF2585DE)),
  //             ),
  //             Text(
  //               toDoList[index][1],
  //               style: TextStyle(
  //                   fontFamily: 'Nunito',
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.w400,
  //                   color: Colors.black),
  //             ),
  //             const SizedBox(height: 20),
  //             Text(
  //               'Waktu:',
  //               style: TextStyle(
  //                   fontFamily: 'Nunito',
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.w500,
  //                   color: Color(0xFF2585DE)),
  //             ),
  //             Text(
  //               toDoList[index][2],
  //               style: TextStyle(
  //                   fontFamily: 'Nunito',
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.w400,
  //                   color: Colors.black),
  //             ),
  //             const SizedBox(height: 20),

  // Change Task Status
  void changeTaskStatus(ToDo todo) {
    setState(() {
      todos.where((element) => element.id == todo.id).first.toggleDone();
    });
  }

  // Delete Task
  void onDeleteTask(String id) {
    setState(() {
      todos.removeWhere((item) => item.id == id);
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
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.all(20),
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
          Expanded(
            child: Consumer<AllList>(
              builder: (context, todolist, child) {
                return ListView(
                  children: todolist.allList.isNotEmpty
                      ? todolist.allList
                          .map(
                            (e) => ToDoListTile(
                              todo: e,
                              taskChange: () =>
                                  Provider.of<AllList>(context, listen: false)
                                      .changeStatus(e),
                              deleteButton: (context) =>
                                  Provider.of<AllList>(context, listen: false)
                                      .deleteTask(e),
                            ),
                          )
                          .toList()
                      : [
                          SizedBox(
                            child: Center(
                              child: Text(
                                "Tidak ada daftar",
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ),
                          ),
                        ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
