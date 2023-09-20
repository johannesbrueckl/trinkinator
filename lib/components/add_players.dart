import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinkinator/components/app.dart';
import 'package:trinkinator/components/logger.dart';

class AddPlayers extends ConsumerStatefulWidget {
  const AddPlayers({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AddPlayersState();
}

class AddPlayersState extends ConsumerState {
  final TextEditingController nameController = TextEditingController();

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
          FilledButton(
            child: const Text('Add'),
            onPressed: () {
              if (nameController.text.trim().isNotEmpty) {
                final oldPlayers = ref.read(playerNamesProvider);
                ref.read(playerNamesProvider.notifier).state = [
                  ...oldPlayers,
                  nameController.text.trim()
                ];
                nameController.clear();
              } else {
                playerNameEmptyAlert(context);
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
                              },
                            ),
                            title: Text(players.elementAt(index))));
                  }))
        ]));
  }
}

Future<void> playerNameEmptyAlert(BuildContext context) async {
  final logger = getLogger();
  showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      Future.delayed(const Duration(seconds: 2), () {
        try {
          //unsafe error thrown here, fine for now. needs fixing later.
          Navigator.of(context).pop();
        } catch (e) {
          logger.e(e);
        }
      });
      return const AlertDialog(
        title: Text("Spielername darf nicht leer sein",
            textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0)),
        elevation: 24.0,
      );
    },
  );
}
