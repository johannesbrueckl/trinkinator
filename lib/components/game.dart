import 'package:flutter/material.dart';
import 'dart:math';

class StartGame extends StatelessWidget {
  var j;
  var i;
  var aufgaben;
  var namen;
  var spieleranzahl;

  StartGame(
      {super.key,
      this.j,
      this.i,
      this.aufgaben,
      this.namen,
      this.spieleranzahl});

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return Scaffold(
        body: Center(
            child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: [
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: '${namen[j]}\n\n',
                    style: const TextStyle(
                        fontSize: 35.0,
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        '${aufgaben[random.nextInt(34)]}\n', //Anzahl der Aufgaben.
                    style:
                        const TextStyle(fontSize: 30.0, color: Colors.black)),
              ],
            ),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20.0, fontFamily: 'Karla'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              //return StartGame(context, j, i, aufgaben, namen, spieleranzahl);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
              disabledForegroundColor: Colors.grey.withOpacity(0.38),
              textStyle: const TextStyle(fontSize: 40),
            ),
            child: const Text('Naechste Runde'),
          )
        ])));
  }
}

/*
void startGame(BuildContext context, int j, int i, List aufgaben, List namen,
    int spieleranzahl) {
  Random random = Random();
  Navigator.of(context)
      .push(MaterialPageRoute<void>(builder: (BuildContext context) {
    if (j < spieleranzahl - 1) {
      ++j;
    } else {
      j = 0;
    }
    return Scaffold(
        body: Center(
            child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: [
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: '${namen[j]}\n\n',
                    style: const TextStyle(
                        fontSize: 35.0,
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        '${aufgaben[random.nextInt(34)]}\n', //Anzahl der Aufgaben.
                    style:
                        const TextStyle(fontSize: 30.0, color: Colors.black)),
              ],
            ),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20.0, fontFamily: 'Karla'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              return startGame(context, j, i, aufgaben, namen, spieleranzahl);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
              disabledForegroundColor: Colors.grey.withOpacity(0.38),
              textStyle: const TextStyle(fontSize: 40),
            ),
            child: const Text('Naechste Runde'),
          )
        ])));
  }));

}
*/
