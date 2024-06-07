import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_flutter_application/screens/edit_task_screen.dart';
import 'package:note_flutter_application/data/task.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.task});

  Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isBoxChecked = false;

  @override
  void initState() {
    super.initState();
    isBoxChecked = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return _getTaskItem();
  }

  Widget _getTaskItem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBoxChecked = !isBoxChecked;
          widget.task.isDone = isBoxChecked;
          //Beacuse Task class in task.dart file extends HiveObject.
          widget.task.save();
          //
        });
      },
      child: Container(
        height: 132,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: _getMainContent(),
      ),
    );
  }

  Widget _getMainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // MSHCheckbox(
                  //   size: 32,
                  //   value: isBoxChecked,
                  //   checkedColor: Color(0xff18DAA3),
                  //   style: MSHCheckboxStyle.fillScaleCheck,
                  //   onChanged: (isChecked) {},
                  // ),
                  Transform.scale(
                    scale: 1.4,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      ),
                        value: isBoxChecked,
                        checkColor: Colors.white,
                        activeColor: Color(0xff18DAA3),
                        onChanged: (isChecked) {}),
                  ),
                  Text(
                    "${widget.task.title}",
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Text(
                "${widget.task.subTitle}",
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              _getTimeAndEditBadges()
            ],
          ),
        ),
        SizedBox(width: 18),
        Image.asset(widget.task.taskType.image),
      ],
    );
  }

  Widget _getTimeAndEditBadges() {
    return Row(
      children: [
        Container(
          width: 89,
          height: 28,
          padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: Color(0xff18DAA3),
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Row(
            children: [
              Text(
                "${widget.task.time.hour}:${getMinUnderTen(widget.task.time)}",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 8.0),
              Image.asset("assets/images/icon_time.png"),
            ],
          ),
        ),
        SizedBox(
          width: 15.0,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditTaskScreen(
                  task: widget.task,
                ),
              ),
            );
          },
          child: Container(
            width: 90,
            height: 28,
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: Color(0xffE2F6F1),
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "ویرایش",
                  style: TextStyle(
                    fontSize: 13.2,
                    color: Color(0xff18DAA3),
                  ),
                ),
                SizedBox(width: 8.0),
                Image.asset("assets/images/icon_edit.png"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String getMinUnderTen(DateTime time) {
    var min = time.minute;
    if (min < 10) {
      return "0$min";
    } else {
      return time.minute.toString();
    }
  }
}
