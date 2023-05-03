import 'package:flutter/material.dart';

class ToDo {
  final String id;
  final String toDoAct;
  final String toDoNote;
  final String toDoTime;
  bool isDone;

  ToDo(
      {required this.id,
      required this.toDoAct,
      required this.toDoNote,
      required this.toDoTime,
      required this.isDone});

  void toggleDone() {
    this.isDone = !this.isDone;
  }
}

List<ToDo> todoList() {
  return [
    ToDo(
        id: '1',
        toDoAct: 'Contoh 1',
        toDoNote: 'Ket. disini',
        toDoTime: "10.00 AM",
        isDone: false),
    ToDo(
        id: '2',
        toDoAct: 'Contoh 2',
        toDoNote: 'Ket. disini',
        toDoTime: "12.00 AM",
        isDone: false),
  ];
}
