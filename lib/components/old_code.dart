import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinkinator/components/app.dart';

import 'package:trinkinator/components/game.dart';
import 'package:trinkinator/components/rules.dart';
import 'package:trinkinator/components/add_players.dart';

import 'logger.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.greenAccent[400],
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(18)),
      side: BorderSide(color: Colors.blueGrey)),
);

class Game extends ConsumerWidget {
  const Game({super.key});

  static const _gap = SizedBox(height: 20);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var players = ref.watch(playerNamesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trinkinator'),
      ),
      body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(40.0),
          children: <Widget>[
            const Text(
              'Game Menu',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 45.0),
            ),
            _gap,
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
                    if (players.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StartGame()),
                      );
                    } else {
                      _gameAlertDialog(context);
                    }
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
    );
  }

  Future<void> _gameAlertDialog(BuildContext context) async {
    final logger = getLogger();
    showDialog<String>(
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
          title: Text("Bitte zuerst Spieler hinzufügen",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0)),
          elevation: 24.0,
          //shape: CircleBorder(),
        );
      },
    );
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
