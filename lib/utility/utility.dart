import 'package:note_flutter_application/data/task_type.dart';
import 'package:note_flutter_application/data/type_enum.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
      image: "assets/images/meditate.png",
      title: "تمرکز",
      taskTypeEnum: TaskTypeEnum.focus,
    ),
    TaskType(
      image: "assets/images/social_frends.png",
      title: "میتینگ",
      taskTypeEnum: TaskTypeEnum.date,
    ),
    TaskType(
      image: "assets/images/hard_working.png",
      title: "کار زیاد",
      taskTypeEnum: TaskTypeEnum.working,
    ),
  ];

  return list;
}
