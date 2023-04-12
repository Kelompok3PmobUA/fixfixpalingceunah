import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/utilities/homeAppBar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ======================================== CREATE TO-DO LIST ========================================

class ToDoListTile extends StatelessWidget {
  final String toDoAct;
  final String toDoNote;
  final String toDoTime;
  final bool isDone;
  final taskChange;
  Function(BuildContext)? deleteButton;

  ToDoListTile({
    super.key,
    // required this.deleteTask,
    required this.toDoAct,
    required this.toDoNote,
    required this.toDoTime,
    required this.isDone,
    required this.taskChange,
    required this.deleteButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 15, left: 15),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
              onPressed: deleteButton,
              icon: Icons.delete_forever_rounded,
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(15)),
        ]),
        child: Container(
          child: Material(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                onTap: taskChange,
                // shape:
                //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Icon(
                  isDone
                      ? Icons.check_circle_rounded
                      : Icons.pending_actions_rounded,
                  color: isDone ? Colors.green : Color(0xFF2585DE),
                ),
                title: Text(
                  toDoAct,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: isDone ? Color(0xFF9AC8F4) : Color(0xFF2585DE)),
                ),
                subtitle: Text(
                  toDoNote,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w500,
                      color: isDone ? Color(0xFF9AC8F4) : Color(0xFF2585DE)),
                ),
                trailing: Text(
                  toDoTime,
                  style: TextStyle(
                    color: Color(0xFF8C8C8C),
                    fontFamily: 'Nunito',
                  ),
                ),
              )),
        ),
      ),
    );
  }
}

// ======================================== HOME PAGES ========================================
class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePage> {
  List toDoList = [
    ['Contoh 1', 'Keterangan Disini', '10:00 AM', false],
    ['Contoh 2', 'Keterangan Disini', '12:00 AM', false],
  ];

  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  TimeOfDay timeSelected = TimeOfDay.now();

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
                  child: Text(
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
                      minWidth: 102,
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

  // Pick the Date
  void pickDate() {
    showDatePicker(
        helpText: 'Pilih Tanggal',
        initialEntryMode: DatePickerEntryMode.calendar,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
  }

  // Pick the Time
  void pickTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        timeSelected = value!;
      });
    });
  }

  // Save New Task
  void saveNewTask() {
    // Automically pop out the add box when save tapped
    Navigator.of(context).pop();

    // Rebuild the List
    setState(() {
      toDoList.add([
        titleController.text,
        subtitleController.text,
        timeSelected.format(context).toString(),
        false,
      ]);
      titleController.clear();
      subtitleController.clear();
    });
  }

  // Change Task Status
  void changeTaskStatus(int index) {
    setState(() {
      toDoList[index][3] = !toDoList[index][3];
    });
  }

  // Delete Task
  void onDeleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
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
            child: ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (context, index) {
                return ToDoListTile(
                  toDoAct: toDoList[index][0],
                  toDoNote: toDoList[index][1],
                  toDoTime: toDoList[index][2],
                  isDone: toDoList[index][3],
                  taskChange: () => changeTaskStatus(index),
                  deleteButton: (context) => onDeleteTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
