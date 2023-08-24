import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinkinator/components/app.dart';

class ListTileSelectExample extends StatefulWidget {
  const ListTileSelectExample({super.key});

  @override
  ListTileSelectExampleState createState() => ListTileSelectExampleState();
}

class ListTileSelectExampleState extends State<ListTileSelectExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListBuilder(),
      /*
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          extendedPadding: EdgeInsets.all(30),
          label: const Text('Add Player'),
          icon: const Icon(Icons.add),
        )*/
    );
  }
}

class ListBuilder extends ConsumerWidget {
  ListBuilder({super.key});
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var players = ref.watch(playerNamesProvider);
    return Scaffold(
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
          ref.watch(playerNamesProvider).add(nameController.text);
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
                            ref.watch(playerNamesProvider).removeAt(index);
                          },
                        ),
                        title: Text(players.elementAt(index))));
              }))
    ]));
  }
}
