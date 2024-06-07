import 'package:flutter/material.dart';
import 'package:note_flutter_application/data/task_type.dart';

class TaskTypeItemList extends StatelessWidget {
  TaskTypeItemList(
      {super.key,
      required this.taskType,
      required this.index,
      required this.selectedItemList});

  TaskType taskType;

  int index;
  int selectedItemList;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (selectedItemList == index) ? Color(0xff18DAA3) : Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: (selectedItemList == index) ? Color(0xff18DAA3) : Colors.grey,
          width: 3.0,
        ),
      ),
      width: 114,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset("${taskType.image}"),
          Text(
            "${taskType.title}",
            style: TextStyle(
              fontSize: 14.0,
              color: (selectedItemList == index) ? Colors.white : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
