import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinkinator/components/app.dart';

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
                labelText: 'Player Name',
              ),
            ),
          ),
          FilledButton(
            child: const Text('Add'),
            onPressed: () {
              ref.read(playerNamesProvider).add(nameController.text);
              nameController.clear();
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
                                ref.read(playerNamesProvider).removeAt(index);
                              },
                            ),
                            title: Text(players.elementAt(index))));
                  }))
        ]));
  }
}
