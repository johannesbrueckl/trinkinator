import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinkinator/core/enums/setting.dart';
import 'package:trinkinator/core/models/task.dart';
import 'package:trinkinator/data/tasks.dart';

final tasksProvider = StateProvider<Tasks>((ref) {
  return Tasks();
});

final tasksListRawProvider = StateProvider<List<Task>>((ref) {
  return Tasks().tasks;
});

final tasksListProvider = StateProvider<List<Task>>((ref) {
  final taskProvider = ref.watch(tasksProvider);
  return taskProvider.fetchTasks();
});

final customTaskCounter = StateProvider<int>((ref) => 0);

final playerNamesProvider = StateProvider<List<String>>((ref) => []);

final settingsProvider = StateProvider<List<Setting>>((ref) => [
      Setting.categoryNeutral,
    ]);
