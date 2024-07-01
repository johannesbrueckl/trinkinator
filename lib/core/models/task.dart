import 'package:trinkinator/core/enums/setting.dart';

class Task {
  late String task;
  late Setting category;

  Task(this.task, {this.category = Setting.categoryNeutral});
}
