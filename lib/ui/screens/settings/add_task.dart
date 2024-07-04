import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinkinator/app/providers.dart';
import 'package:logger/logger.dart';
import 'package:trinkinator/core/enums/setting.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState {
  final _formKey = GlobalKey<FormState>();
  var costomTasksNotEnabled = true;
  var _taskTextForm = '';
  final log = Logger();
  final TextEditingController textFieldController = TextEditingController();
  static const _gap = SizedBox(
    height: 20,
  );

  void _submitTask() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ref.read(tasksProvider).addTask(
            _taskTextForm.trim(),
            ref.watch(tasksListProvider).length,
            Setting.categoryCustom,
          );
      if (costomTasksNotEnabled) {
        var settings = ref.watch(settingsProvider);
        settings.add(Setting.categoryCustom);
        ref.read(settingsProvider.notifier).state = [...settings];
      }
      ref.read(customTaskCounter.notifier).state++;
      _formKey.currentState!.reset();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Aufgabe hinzugefügt!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //do not remove this, for rebuild purposes. TODO: get rid of this.
    var customTasksCounter = ref.watch(customTaskCounter);
    var tasksList = ref.watch(tasksListProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 120, 1, 1),
                    ),
                  ),
                  labelText: 'Aufgabe',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Color.fromARGB(255, 253, 101, 87),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Bitte Aufgabe eingeben';
                  }
                  return null;
                },
                onSaved: (value) {
                  _taskTextForm = value!;
                },
              ),
              const SizedBox(height: 24.0),
              FloatingActionButton.extended(
                onPressed: () {
                  _submitTask();
                },
                label: const Text(
                  'Hinzufügen',
                  style: TextStyle(fontSize: 20.0),
                ),
                icon: const Icon(Icons.add),
              ),
              _gap,
              Expanded(
                child: ListView.builder(
                    itemCount: ref
                        .read(tasksListProvider)
                        .where((element) =>
                            element.category == Setting.categoryCustom)
                        .length,
                    itemBuilder: (_, int index) {
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 50),
                        child: ListTile(
                          leading: const Icon(Icons.abc_rounded),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                            iconSize: 30,
                            splashRadius: 20,
                            onPressed: () {
                              var targetTaskId = tasksList
                                  .where((element) =>
                                      element.category ==
                                      Setting.categoryCustom)
                                  .elementAt(index)
                                  .taskId;
                              ref
                                  .read(tasksProvider)
                                  .removeTaskById(targetTaskId);
                              ref.read(customTaskCounter.notifier).state--;
                              log.d('$customTasksCounter');
                              if (customTasksCounter < 1) {
                                var settings = ref.watch(settingsProvider);
                                settings.remove(Setting.categoryCustom);
                                ref.read(settingsProvider.notifier).state = [
                                  ...settings
                                ];
                                costomTasksNotEnabled = true;
                              }
                              log.d("player removed.");
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Aufgabe entfernt!'),
                                  backgroundColor: Colors.red,
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                          ),
                          title: Text(
                            tasksList
                                .where((element) =>
                                    element.category == Setting.categoryCustom)
                                .elementAt(index)
                                .task
                                .toString(),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
