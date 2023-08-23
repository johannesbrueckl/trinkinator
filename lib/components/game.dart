import 'package:flutter/material.dart';
import 'dart:math';

class StartGame extends StatefulWidget {
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
  State<StartGame> createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  @override
  Widget build(BuildContext context) {
    Random random = Random();
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
                  if (widget.j == widget.spieleranzahl - 1) {
                    setState(() {
                      widget.j = 0;
                    });
                  } else {
                    setState(() {
                      ++widget.j;
                    });
                  }

                  //Navigator.pop(context);
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

  Text displayAufgabe() {
    Random random = Random();
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: '${widget.namen[widget.j]}\n\n',
              style: const TextStyle(
                  fontSize: 35.0,
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text:
                  '${widget.aufgaben[random.nextInt(34)]}\n', //Anzahl der Aufgaben.
              style: const TextStyle(fontSize: 30.0, color: Colors.black)),
        ],
      ),
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 20.0, fontFamily: 'Karla'),
    );
  }
}
