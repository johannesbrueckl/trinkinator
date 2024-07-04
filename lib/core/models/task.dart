import 'package:trinkinator/core/enums/setting.dart';

class Task {
  late String task;
  late int taskId;
  late Setting category;

  Task(this.task, this.taskId, {this.category = Setting.categoryNeutral});
}
