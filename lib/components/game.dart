import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinkinator/components/app.dart';

class StartGame extends ConsumerStatefulWidget {
  const StartGame({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StartGameState();
}

class _StartGameState extends ConsumerState {
  var roundCounter = 0;
  @override
  Widget build(BuildContext context) {
    var players = ref.read(playerNamesProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: [
              displayAufgabe(),
              TextButton(
                onPressed: () {
                  if (roundCounter == players.length - 1) {
                    setState(() {
                      roundCounter = 0;
                    });
                  } else {
                    setState(() {
                      ++roundCounter;
                    });
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  disabledForegroundColor: Colors.grey.withOpacity(0.38),
                  textStyle: const TextStyle(fontSize: 40),
                ),
                child: const Text('Nächste Runde'),
              )
            ]),
      ),
    );
  }

  Text displayAufgabe() {
    Random random = Random();
    var players = ref.read(playerNamesProvider);
    var tasks = ref.read(tasksProvider);
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: '${players[roundCounter]}\n\n',
            style: const TextStyle(
                fontSize: 35.0,
                color: Color.fromARGB(255, 227, 70, 22),
                fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: '${tasks[random.nextInt(tasks.length)]}\n',
            style: const TextStyle(fontSize: 30.0, color: Colors.black),
          ),
        ],
      ),
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 20.0, fontFamily: 'Karla'),
    );
  }
}
