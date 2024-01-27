import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  TodoItem(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(253, 230, 68, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(left: 15, right: 15),
        height: 70,
        alignment: Alignment.center,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Checkbox(
              activeColor: Colors.black,
              value: taskCompleted,
              onChanged: onChanged),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(taskName,
                style: TextStyle(
                    color: Colors.black,
                    decoration:
                        taskCompleted ? TextDecoration.lineThrough : null)),
          ),
        ]),
      ),
    );
  }
}
