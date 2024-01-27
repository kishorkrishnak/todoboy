import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:todoboy/util/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _openPopup(context) {
    Alert(
        style:
            const AlertStyle(backgroundColor: Color.fromRGBO(253, 236, 111, 1)),
        context: context,
        content: TextField(
          onChanged: (value) {
            setState(() {
              inputText = value;
            });
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintText: "Add a new task",
              hintStyle: TextStyle(fontSize: 15)),
        ),
        buttons: [
          DialogButton(
            color: const Color.fromRGBO(249, 227, 62, 1),
            onPressed: () {
              if (inputText != "") {
                setState(() {
                  todoItems.add([inputText, false]);
                  inputText = "";
                });
                Navigator.pop(context);
              }
            },
            child: const Text(
              "Save",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ),
          DialogButton(
            color: const Color.fromRGBO(249, 227, 62, 1),
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Cancel",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          )
        ]).show();
  }

  List todoItems = [];
  String inputText = "";
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoItems[index][1] = !todoItems[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(253, 240, 147, 1),
        appBar: appBar(),
        body: body(),
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          backgroundColor: const Color.fromRGBO(194, 180, 68, 1),
          child: const Icon(Icons.add),
          onPressed: () {
            _openPopup(context);
          },
        ));
  }

  Padding body() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.builder(
          itemCount: todoItems.isEmpty ? 1 : todoItems.length,
          itemBuilder: (context, index) {
            if (todoItems.isEmpty) {
              return Text(
                "No Todos Yet",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              );
            } else {
              return TodoItem(
                taskName: todoItems[index][0],
                taskCompleted: todoItems[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
              );
            }
          },
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(254, 231, 74, 1),
      title: title(),
    );
  }

  Text title() {
    return const Text(
      "TODOBOY",
      style: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal),
    );
  }
}
