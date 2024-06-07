import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_flutter_application/data/task.dart';
import 'package:note_flutter_application/screens/add_task_screen.dart';
import 'package:note_flutter_application/widget/task_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputText = "";
  var controller = TextEditingController();
  var taskBox = Hive.box<Task>("taskBox");

  bool isFabVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: taskBox.listenable(),
          builder: (context, value, child) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (myNotification) {
                setState(() {
                  if (myNotification.direction == ScrollDirection.forward) {
                    isFabVisible = true;
                  }
                  if (myNotification.direction == ScrollDirection.reverse) {
                    isFabVisible = false;
                  }
                  if (myNotification.direction == ScrollDirection.idle) {
                    isFabVisible = true;
                  }
                });

                /// function needs to return a bool so we return a true for that
                /// this true just for we don't have error and it has not a logic
                return true;
              },
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: taskBox.values.length,
                itemBuilder: (context, index) {
                  var task = taskBox.values.toList()[index];
                  return _getListItem(task);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: isFabVisible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddTaskScreen(),
              ),
            );
          },
          backgroundColor: Color(0xff18DAA3),
          child: Image.asset("assets/images/icon_add.png"),
        ),
      ),
    );
  }

  Widget _getListItem(Task task) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        task.delete();
      },
      child: TaskWidget(task: task),
    );
  }
}
