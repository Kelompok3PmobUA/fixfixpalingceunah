import 'package:flutter/material.dart';

class ToDo {
  // String id;
  String toDoAct;
  String toDoTime;
  String toDoNote;
  bool isDone;

  ToDo({
    // required this.id,
    required this.toDoAct,
    required this.toDoTime,
    required this.toDoNote,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(
          // id: '1',
          toDoAct: "Kelas PDB",
          toDoNote: 'Ruang 410, Presentasi Project',
          toDoTime: "10.00",
          isDone: true),
      ToDo(
          // id: '2',
          toDoAct: "Makan siang",
          toDoNote: 'Eatery',
          toDoTime: "12.00",
          isDone: true),
      ToDo(
          // id: '3',
          toDoAct: "Presentasi PWeb",
          toDoNote: 'Finishing Laravel',
          toDoTime: "14.00"),
      ToDo(
          // id: '4',
          toDoAct: "Futsal",
          toDoNote: 'Puri with SMA bois',
          toDoTime: "16.00"),
      ToDo(
          // id: '6',
          toDoAct: "Netflix",
          toDoNote: 'n Chill',
          toDoTime: "22.00"),
    ];
  }
}
