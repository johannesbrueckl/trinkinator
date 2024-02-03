import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:trinkinator/components/app.dart';
import 'package:trinkinator/components/e_setting.dart';

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
          CheckboxListTile(
              title: const Text('Never have I Ever'),
              value: settings.contains(Setting.categoryNeverEver),
              onChanged: (bool? value) {
                _toggleSetting(Setting.categoryNeverEver);
              }),
          CheckboxListTile(
              title: const Text('Extreme'),
              value: settings.contains(Setting.categoryExtreme),
              onChanged: (bool? value) {
                _toggleSetting(Setting.categoryExtreme);
              }),
          CheckboxListTile(
              title: const Text('NSFW'),
              value: settings.contains(Setting.categoryNSFW),
              onChanged: (bool? value) {
                _toggleSetting(Setting.categoryNSFW);
              }),
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
