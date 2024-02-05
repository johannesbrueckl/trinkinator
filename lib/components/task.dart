import 'package:trinkinator/components/E_SETTING.dart';

class Task {
  late String task;
  late Setting category;

  Task(this.task, {this.category = Setting.categoryNeutral});
}
