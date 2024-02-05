import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:trinkinator/components/index.dart';

class MainMenu extends ConsumerWidget {
  const MainMenu({super.key});

  static const _gap = SizedBox(height: 20);
  static const Color buttonTextColor = Color(0xFF000000);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var players = ref.watch(playerNamesProvider);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFaed6f1),
                Color(0xFFaed6f1),
              ],
            ),
          ),
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(40.0),
              children: <Widget>[
                SizedBox(
                  height: height * 0.375,
                  //width: width * 0.8,
                  child: Image.asset(
                    'assets/images/trinkinator-logo-oval-schaum.png',
                  ),
                ),
                Visibility(
                  replacement: const ElevatedButton(
                    onPressed: null,
                    child: Text('\nKeine Spieler hinzugefügt\n',
                        style: TextStyle(fontSize: 30.0),
                        textAlign: TextAlign.center),
                  ),
                  visible: players.isNotEmpty,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StartGame(),
                        ),
                      );
                    },
                    child: const Text('\nAlkohol fliessen lassen\n',
                        style:
                            TextStyle(fontSize: 30.0, color: buttonTextColor),
                        textAlign: TextAlign.center),
                  ),
                ),
                _gap,
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddPlayers(),
                        ),
                      );
                    },
                    child: const Text('\nSpieler hinzufügen\n',
                        style:
                            TextStyle(fontSize: 30.0, color: buttonTextColor),
                        textAlign: TextAlign.center)),
                _gap,
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Settings(),
                      ),
                    );
                  },
                  child: const Text('\nEinstellungen\n',
                      style: TextStyle(fontSize: 30.0, color: buttonTextColor),
                      textAlign: TextAlign.center),
                ),
                _gap,
                ElevatedButton(
                  onPressed: () {
                    return rules(context);
                  },
                  child: const Text('\nRegeln einsehen\n',
                      style: TextStyle(fontSize: 30.0, color: buttonTextColor),
                      textAlign: TextAlign.center),
                ),
                _gap,
                ElevatedButton(
                  onPressed: () {
                    return _beschwerde(context);
                  },
                  child: const Text('\nBeschweren\n',
                      style: TextStyle(fontSize: 30.0, color: buttonTextColor),
                      textAlign: TextAlign.center),
                ),
                _gap,
                const Text(
                  'by Don B',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0),
                ),
              ]),
        ),
      ),
    );
  }

  void _beschwerde(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20.0),
                children: [
                  const Text(
                    'Kritik wird nicht geduldet, siehe Regel Nr.1!\nTrinke 3 Strafschlücke!\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Prost!',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Color(0xFF000000),
                        ),
                        textAlign: TextAlign.center),
                  ),
                ]),
          ),
        );
      }),
    );
  }
}
