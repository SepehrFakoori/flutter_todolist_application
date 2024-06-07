import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_flutter_application/data/task_type.dart';
import 'package:note_flutter_application/data/type_enum.dart';
import 'package:note_flutter_application/screens/home_screen.dart';
import 'package:note_flutter_application/data/task.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("names");

  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TaskTypeAdapter());
  Hive.registerAdapter(TaskTypeEnumAdapter());

  await Hive.openBox<Task>("taskBox");

  runApp(Application());
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "SM",
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontFamily: "SM",
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
