import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:trinkinator/components/app.dart';

class AddPlayers extends ConsumerStatefulWidget {
  const AddPlayers({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AddPlayersState();
}

class AddPlayersState extends ConsumerState {
  final TextEditingController nameController = TextEditingController();
  final log = Logger();

  static const String playerNameEmptyAlertMessage =
      "Spielername darf nicht leer sein";
  static const String playerNameExistsAlertMessage =
      "Spielername ist bereits vergeben";

  @override
  Widget build(BuildContext context) {
    var players = ref.watch(playerNamesProvider);
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Spielername',
              ),
            ),
          ),
          ElevatedButton(
            child: const Text(
              'Hinzufügen',
              style: TextStyle(color: Color(0xFF000000)),
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              if (players.contains(nameController.text.trim())) {
                log.d(
                    "player name ${nameController.text.trim()} already exists.");
                playerNameEmptyAlert(context, playerNameExistsAlertMessage);
                nameController.clear();
              } else if (nameController.text.trim().isNotEmpty) {
                final oldPlayers = ref.read(playerNamesProvider);
                ref.read(playerNamesProvider.notifier).state = [
                  ...oldPlayers,
                  nameController.text.trim()
                ];
                log.d("player ${nameController.text} added.");
                nameController.clear();
              } else {
                log.d("player name is empty.");
                playerNameEmptyAlert(context, playerNameEmptyAlertMessage);
                nameController.clear();
              }
            },
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: players.length,
                  itemBuilder: (_, int index) {
                    return Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 50),
                        child: ListTile(
                            leading: const Icon(Icons.person_2_sharp),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                              iconSize: 30,
                              splashRadius: 20,
                              onPressed: () {
                                final trimedPlayers =
                                    ref.read(playerNamesProvider);
                                trimedPlayers.removeAt(index);
                                ref.read(playerNamesProvider.notifier).state = [
                                  ...trimedPlayers
                                ];
                                log.d("player removed.");
                              },
                            ),
                            title: Text(players.elementAt(index))));
                  }))
        ]));
  }
}

Future<void> playerNameEmptyAlert(BuildContext context, String reason) async {
  late Timer timer;
  showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      timer = Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pop();
      });
      return AlertDialog(
        title: Text(reason,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 25.0)),
        elevation: 24.0,
      );
    },
  ).then((val) {
    if (timer.isActive) {
      timer.cancel();
    }
  });
}
