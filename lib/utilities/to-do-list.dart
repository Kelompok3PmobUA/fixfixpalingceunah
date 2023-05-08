import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'todo.dart';

// ======================================== CREATE TO-DO LIST ========================================

class ToDoListTile extends StatelessWidget {
  final ToDo todo;
  final taskChange;
  Function(BuildContext)? deleteButton;

  ToDoListTile({
    super.key,
    required this.todo,
    required this.taskChange,
    required this.deleteButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, bottom: 15, left: 15),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deleteButton,
                icon: Icons.delete_forever_rounded,
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(15)),
          ],
        ),
        child: Container(
          child: Material(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              onTap: taskChange,
              // shape:
              //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              leading: Icon(
                todo.isDone
                    ? Icons.check_circle_rounded
                    : Icons.pending_actions_rounded,
                color: todo.isDone ? Colors.green : Color(0xFF2585DE),
              ),
              title: Text(
                todo.toDoAct,
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: todo.isDone ? Color(0xFF9AC8F4) : Color(0xFF2585DE)),
              ),
              subtitle: Text(
                todo.toDoNote,
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w500,
                    color: todo.isDone ? Color(0xFF9AC8F4) : Color(0xFF2585DE)),
              ),
              trailing: Text(
                todo.toDoTime,
                style: TextStyle(
                  color: Color(0xFF8C8C8C),
                  fontFamily: 'Nunito',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
