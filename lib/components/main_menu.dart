import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinkinator/components/app.dart';

import 'package:trinkinator/components/game.dart';
import 'package:trinkinator/components/rules.dart';
import 'package:trinkinator/components/add_players.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.greenAccent[400],
  surfaceTintColor: Colors.amber,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(18)),
      side: BorderSide(color: Colors.blueGrey)),
);

class MainMenu extends ConsumerWidget {
  const MainMenu({super.key});

  static const _gap = SizedBox(height: 20);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var players = ref.watch(playerNamesProvider);
    //double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
            child: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.transparent,
          Colors.white,
        ],
      )),
      child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(40.0),
          children: <Widget>[
            SizedBox(
              height: height * 0.5,
              //width: width * 0.8,
              child: Image.asset('assets/images/trinkinator-logo-removebg.png'),
            ),
            Visibility(
              replacement: ElevatedButton(
                  onPressed: null,
                  style: raisedButtonStyle,
                  child: const Text('\nKeine Spieler hinzugefügt\n',
                      style: TextStyle(fontSize: 30.0),
                      textAlign: TextAlign.center)),
              visible: players.isNotEmpty,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StartGame()),
                    );
                  },
                  style: raisedButtonStyle,
                  child: const Text('\nAlkohol fliessen lassen\n',
                      style: TextStyle(fontSize: 30.0),
                      textAlign: TextAlign.center)),
            ),
            _gap,
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddPlayers()));
                },
                style: raisedButtonStyle,
                child: const Text('\nSpieler hinzufügen\n',
                    style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center)),
            _gap,
            ElevatedButton(
                onPressed: () {
                  return rules(context);
                },
                style: raisedButtonStyle,
                child: const Text('\nRegeln einsehen\n',
                    style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center)),
            _gap,
            ElevatedButton(
                onPressed: () {
                  return _beschwerde(context);
                },
                style: raisedButtonStyle,
                child: const Text('\nBeschweren\n',
                    style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center)),
            _gap,
            const Text(
              'by Don B',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.0),
            )
          ]),
    )));
  }

  void _beschwerde(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(),
          body: Center(
              child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: [
              const Text(
                'Kritik wird nicht geduldet, siehe Regel Nr1!\nTrinke 3 Strafschluecke!\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: raisedButtonStyle,
                  child:
                      const Text('Prost!', style: TextStyle(fontSize: 30.0))),
            ],
          )));
    }));
  }
}
