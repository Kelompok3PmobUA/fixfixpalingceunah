import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../utilities/todo.dart';

class AllList with ChangeNotifier {
  List<ToDo> _allList = [];

  List<ToDo> get allList => _allList;

  void toggleDones(ToDo todo) {
    todo.isDone = !todo.isDone;
  }

  void addList(ToDo todo) {
    _allList.add(todo);
    notifyListeners();
  }

  void changeStatus(ToDo todo) {
    _allList.where((element) => element.id == todo.id).first.toggleDone();
    notifyListeners();
  }

  void deleteTask(ToDo todo) {
    _allList.removeWhere((element) => element.id == todo.id);
    notifyListeners();
  }
}
