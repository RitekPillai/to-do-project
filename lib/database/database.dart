import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  final _mybox = Hive.box('mybox');
  List todolist = [];

  void defaultdata() {
    todolist = [
      ["Create a Task", false],
      ["Slide to delete ", false]
    ];
  }

//read
  void loaddata() {
    todolist = _mybox.get("TODOLIST"); // key
  }

//write
  void updatedata() {
    _mybox.put("TODOLIST", todolist);
  }
}
