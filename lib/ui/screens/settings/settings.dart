import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:trinkinator/app/providers.dart';
import 'package:trinkinator/core/enums/setting.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SettingsState();
}

class SettingsState extends ConsumerState {
  final log = Logger();

  @override
  Widget build(BuildContext context) {
    var settings = ref.watch(settingsProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0,
                top: 10.0,
                right: 20.0,
                bottom: 25.0), // Custom padding
            child: Material(
              elevation: 7.0,
              color: const Color.fromARGB(255, 237, 244, 247),
              borderRadius: BorderRadius.circular(12.0),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                child: Text(
                  'Wählt aus dieser Liste welche Spielmodi ihr zusätzlich zum Standardmodus spielen möchtet.',
                  style: TextStyle(fontSize: 22), // Text styling
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
            child: Material(
              elevation: 5.0,
              color: const Color.fromARGB(255, 222, 241, 249),
              borderRadius: BorderRadius.circular(12.0),
              child: CheckboxListTile(
                title: const Text('Ich hab noch nie..'),
                value: settings.contains(Setting.categoryNeverEver),
                onChanged: (bool? value) {
                  _toggleSetting(Setting.categoryNeverEver);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
            child: Material(
              elevation: 5.0,
              color: const Color.fromARGB(255, 222, 241, 249),
              borderRadius: BorderRadius.circular(12.0),
              child: CheckboxListTile(
                title: const Text('Extrem'),
                value: settings.contains(Setting.categoryExtreme),
                onChanged: (bool? value) {
                  _toggleSetting(Setting.categoryExtreme);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
            child: Material(
              elevation: 5.0,
              color: const Color.fromARGB(255, 222, 241, 249),
              borderRadius: BorderRadius.circular(12.0),
              child: CheckboxListTile(
                title: const Text('NSFW'),
                value: settings.contains(Setting.categoryNSFW),
                onChanged: (bool? value) {
                  _toggleSetting(Setting.categoryNSFW);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
            child: Material(
              elevation: 5.0,
              color: const Color.fromARGB(255, 222, 241, 249),
              borderRadius: BorderRadius.circular(12.0),
              child: CheckboxListTile(
                title: const Text('Abstimmung'),
                value: settings.contains(Setting.categoryVote),
                onChanged: (bool? value) {
                  _toggleSetting(Setting.categoryVote);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
            child: Material(
              elevation: 5.0,
              color: const Color.fromARGB(255, 222, 241, 249),
              borderRadius: BorderRadius.circular(12.0),
              child: CheckboxListTile(
                title: const Text('Wahrheit'),
                value: settings.contains(Setting.categoryTruth),
                onChanged: (bool? value) {
                  _toggleSetting(Setting.categoryTruth);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
            child: Material(
              elevation: 5.0,
              color: const Color.fromARGB(255, 222, 241, 249),
              borderRadius: BorderRadius.circular(12.0),
              child: CheckboxListTile(
                title: const Text('Eigene Aufgaben'),
                value: settings.contains(Setting.categoryCustom),
                onChanged: (bool? value) {
                  _toggleSetting(Setting.categoryCustom);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0,
                top: 50.0,
                right: 20.0,
                bottom: 25.0), // Custom padding
            child: SizedBox(
              height: 90,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addTask');
                },
                child: const Text('Eigene Aufgaben hinzufügen',
                    style: TextStyle(fontSize: 22.0, color: Colors.black),
                    textAlign: TextAlign.center),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _toggleSetting(Setting setting) {
    var settings = ref.watch(settingsProvider);

    if (settings.contains(setting)) {
      log.d('removing $setting');
      settings.remove(setting);
      ref.read(settingsProvider.notifier).state = [...settings];
    } else {
      log.d('adding $setting');
      settings.add(setting);
      ref.read(settingsProvider.notifier).state = [...settings];
    }
  }
}
