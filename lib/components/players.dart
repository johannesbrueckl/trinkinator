import 'package:flutter/material.dart';

class Players extends StatefulWidget {
  List namen;
  var spieleranzahl;

  Players({super.key, required this.namen, this.spieleranzahl});

  @override
  State<Players> createState() => _playersState();
}

class _playersState extends State<Players> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Spieler wählen'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
          itemCount: widget.namen.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: ListTile(
                  onTap: () => {
                    Navigator.pop(context, index + 1),
                    widget.spieleranzahl = index + 1,
                    //_spielerAlertDialog(context)
                  },
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  tileColor: Colors.blue,
                  title: Text(widget.namen[index], textAlign: TextAlign.center),
                  titleTextStyle: const TextStyle(fontSize: 30),
                  minVerticalPadding: 30,
                ));
          },
        ));
  }
}
