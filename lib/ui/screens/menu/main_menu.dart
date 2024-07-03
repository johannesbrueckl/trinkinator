import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinkinator/app/providers.dart';

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
                    'assets/images/trinkinator-logo-new.png',
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: Visibility(
                    replacement: const ElevatedButton(
                      onPressed: null,
                      child: Text('Keine Spieler hinzugefügt',
                          style: TextStyle(fontSize: 30.0),
                          textAlign: TextAlign.center),
                    ),
                    visible: players.isNotEmpty,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/play');
                      },
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 196, 239, 191)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 137, 247, 135)),
                      ),
                      child: const Text('Alkohol fliessen lassen',
                          style:
                              TextStyle(fontSize: 30.0, color: buttonTextColor),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ),
                _gap,
                SizedBox(
                  height: 90,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/players');
                    },
                    child: const Text('Spieler hinzufügen',
                        style:
                            TextStyle(fontSize: 30.0, color: buttonTextColor),
                        textAlign: TextAlign.center),
                  ),
                ),
                _gap,
                SizedBox(
                  height: 90,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                    child: const Text('Einstellungen',
                        style:
                            TextStyle(fontSize: 30.0, color: buttonTextColor),
                        textAlign: TextAlign.center),
                  ),
                ),
                _gap,
                SizedBox(
                  height: 90,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/rules');
                    },
                    child: const Text('Regeln',
                        style:
                            TextStyle(fontSize: 30.0, color: buttonTextColor),
                        textAlign: TextAlign.center),
                  ),
                ),
                _gap,
                SizedBox(
                  height: 90,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/complain');
                    },
                    child: const Text('Beschweren',
                        style:
                            TextStyle(fontSize: 30.0, color: buttonTextColor),
                        textAlign: TextAlign.center),
                  ),
                ),
                _gap,
                const Text(
                  'Made with love in Vienna',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0),
                ),
              ]),
        ),
      ),
    );
  }
}
