import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice/Constants/alertdialog.dart';
import 'package:practice/Constants/app_colors.dart';
import 'package:practice/Constants/todo_tile.dart';
import 'package:practice/database/database.dart';

class TodoHomepage extends StatefulWidget {
  const TodoHomepage({super.key});

  @override
  State<TodoHomepage> createState() => _TodoHomepageState();
}

class _TodoHomepageState extends State<TodoHomepage> {
  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.defaultdata();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  //Referencing the box=--------
  final _mybox = Hive.box('mybox');
  String taskname = "";
  final _textController = TextEditingController();
  final db = TodoDatabase();

  void checkboxchanged(bool? value, index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updatedata();
  }

  void showdilog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertdialogPage(
          Controller: _textController,
          onchanged: () {
            setState(
              () {
                taskname = _textController.text;

                db.todolist.add([taskname, false]);
                _textController.clear();
                Navigator.pop(context);
              },
            );
            db.updatedata();
          },
        );
      },
    );
  }
//deleting a Task

  void deletingTask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updatedata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor.black,
      appBar: AppBar(
        title: const Text("Todo List"),
        leading: IconButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: PrimaryColor.org,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (context, index) {
          return TodoTile(
            data: db.todolist[index][0],
            checkbox: db.todolist[index][1],
            Sliadble_change: (p0) => deletingTask(index),
            onchanged: (value) => checkboxchanged(value, index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: PrimaryColor.org,
        onPressed: () => showdilog(),
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
