import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinkinator/app/providers.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class StartGame extends ConsumerStatefulWidget {
  const StartGame({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StartGameState();
}

class _StartGameState extends ConsumerState {
  var roundCounter = 1;
  var playerCounter = 0;
  static const _gap = SizedBox(height: 20);

  @override
  void initState() {
    super.initState();
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
      ]);
    }
  }

  @override
  void dispose() {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var players = ref.read(playerNamesProvider);
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding:
              const EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 20),
          children: [
            Material(
              elevation: 5.0,
              color: const Color.fromARGB(255, 222, 241, 249),
              borderRadius: BorderRadius.circular(12.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: displayAufgabe(),
              ),
            ),
            _gap,
            TextButton(
              onPressed: () {
                if (playerCounter == players.length - 1) {
                  setState(() {
                    playerCounter = 0;
                    ++roundCounter;
                  });
                } else {
                  setState(() {
                    ++playerCounter;
                    ++roundCounter;
                  });
                }
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                disabledForegroundColor: Colors.grey.withOpacity(0.38),
                textStyle: const TextStyle(fontSize: 40),
                minimumSize: const Size(80, 80),
              ),
              child: const Text('Nächste Runde'),
            ),
          ],
        ),
      ),
    );
  }

  Text displayAufgabe() {
    Random random = Random();
    var players = ref.read(playerNamesProvider);
    var settings = ref.read(settingsProvider);
    var tasks = ref
        .read(tasksListProvider)
        .where((element) => settings.contains(element.category));
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${players[playerCounter]}\n',
            style: const TextStyle(
                fontSize: 35.0,
                color: Color.fromARGB(255, 227, 70, 22),
                fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: '${tasks.elementAt(random.nextInt(tasks.length)).task}\n',
            style: const TextStyle(fontSize: 30.0, color: Colors.black),
          ),
        ],
      ),
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 20.0, fontFamily: 'Karla'),
    );
  }
}
