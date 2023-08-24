import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinkinator/components/app.dart';
import 'dart:math';

import 'package:trinkinator/components/game.dart';
import 'package:trinkinator/components/players.dart';
import 'package:trinkinator/components/rules.dart';
import 'package:trinkinator/components/temp.dart';

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.greenAccent[400],
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(18)),
      side: BorderSide(color: Colors.blueGrey)),
);

class Game extends ConsumerWidget {
  static const List<String> aufgaben = [
    //34 Aufgaben.
    "Trinke selbst 1 Schluck.",
    "Trinke selbst 2 Schluecke.",
    "Trinke selbst 3 Schluecke.",
    "Verteile 3 Schluecke an die anderen Spieler.",
    "Du holst dem Spieler Rechts neben dir sein neues Getraenk.",
    "Auf Ex! Du musst deinen Getraenk austrinken!",
    "Shots! Shots! Shots! Eine Runde Kurze fuer ALLE!",
    "Wasserbombe! Du darfst einem deiner Mitspieler einen Kurzen ins Getraenk mischen.",
    "Deutschstunde! Alle Spieler muessen schnellstmoeglich das 'ABC' aufsagen. Stoppt die Zeit. Der langsamste Spieler muss 3 Schluecke trinken. ACHTUNG: Fehler fuehren zur sofortigen Niederlage!",
    "Trinke gemeinsam mit dem jüngsten Spieler! Wenn du selbst der jüngste Spieler bist trinke 2 Mal auf die Jugend!",
    "Geschichtestunde! Nenne US-Praesidenten. Fuer jeden richtig genannten darfst du einen Schluck verteilen!",
    "Deutschstunde! Rezitiere ein ganzes literarisches Werk (z.B. ein Gedicht, Reim). Du darfst maximal zwei Zeilen auslassen. Schaffst du es darfst du 10 Schluecke verteilen. Schaffst du es nicht musst du selbst 5 Schluecke trinken.",
    "Musikunterricht! Singe feestyle fuer mindestens 30 Sekunden was dir gerade in den Sinn kommt oder trinke 5 Schluecke.",
    "Why so Serious? Joker Time! Jeder Spieler darf eine beaufsichtigte Anzahl an Schluecken nehmen. Diese stehen ihm bis zum Ende dieser Partie zum verteilen zur Verfuegung. (Notieren empfohlen, bitte ehrenvoll auf ausgeglichenen Alkoholgehalt achten! siehe Regel Nr 3).",
    "Trinke 3 Schluecke, Du wirst es schon verdient haben.",
    "Beim Spannen erwischt! Trinke 1 Schluck fuer jeden Spieler des anderen Geschlechts.",
    "Arbeitest du noch an mindestens einem Traum den du als Kind hattest? Wenn die Antwort nein ist dann trinke 2 Kurze zur Strafe!",
    "Kampfjet! Wirf mit einem kleinen Papierkuegelchen nach dem Glas von einem Mitspieler. Wenn du triffst muss er Exen! (Mindestabstand zwei Armlaengen des Opfers).",
    "Beim Masturbieren erwischt! Ziehe ein Kleidungsstueck (bei Paaren beide) aus oder trinke 6 Schluecke. Selbst schuld du Lustmolch!",
    "Drinks unter der Dusche! Trinke 2 Schluecke und tu fuer 30 Sekunden so als wurdest du unter der Dusche stehen. Schampoo nicht vergessen.",
    "Sportstunde! Mache soviele Liegestuetze wie du kannst. Maenner: 1 Schluck verteilen pro 10 geschafften. Frauen: 1 Schluck verteilen pro 5 geschafften.",
    "Mega Mind! Du darfst dir eine Regel ausdenken, musst dafuer aber 7 Schluecke trinken. Die Entscheidung liegt bei dir!",
    "Tuersteher! Ihr dürft nurnoch aufs Klo gehen, nachdem ihr einen Shot getrunken habt.",
    "Ich habe noch nie...! Ich habe noch nie meine Nachbarn ausspioniert.",
    "Ich habe noch nie...! Ich habe noch nie einen Freund angelogen um schlimmeres zu verhindern.",
    "Ich habe noch nie...! Ich habe noch nie einen Kuss abgelehnt.",
    "Ich habe noch nie...! Ich habe noch nie jemanden gekuesst den/die ich nicht kannte.",
    "Ich habe noch nie...! Ich habe noch nie eine Sex Fantasie/Traum mit einem meiner Lehrer gehabt.",
    "Ich habe noch nie...! Ich habe noch nie Handschellen getragen.",
    "Trinke 2 Schluecke wenn du keinen MSN account hast.",
    "Der Goenner! Verteile 5 Schluecke an deine Mitspieler wenn du innerhalb des letzten Jahres aktiv gespendet hast.",
    "Shuffle Mode! Alle Getraenke wandern im Uhrzeigersinn um einen Besitzer weiter. KANN uebersprungen werden wenn alle das selbe Getraenk haben, dann trinken alle 3 Schluecke.",
    "Fred Fred Manfred! Ab jetzt musst du in jedem Satz einbauen wie schwer beschaeftigt du heute nicht warst. Bei vergessen Trinken.",
    "Kondom gerissen! Dir ist beim Liebesspiel das Kondom gerissen. Trinke auf Ex und einen Kurzen um die Pille danach zu kaufen ODER trinke ab naechster Runde jedes Mal wenn du an der Reihe bist einen Kurzen bis zum Ende des Spieles um deine Alimente zu begleichen."
  ];
  int spieleranzahl = 7;
  Random random = Random();

  Game({super.key});

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
            const Text(
              '\n',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 7.0),
            ),
            ElevatedButton(
                onPressed: () {
                  if (players.isEmpty) {
                    _gameAlertDialog(context);
                  } else {
                    int i = 0, j = 0;
                    //_blankScreen(context);
                    //StartGame(context, j, i, aufgaben, namen, spieleranzahl);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StartGame(
                                j: j,
                                i: i,
                                aufgaben: aufgaben,
                                namen: players,
                                spieleranzahl: players.length,
                              )),
                    );
                  }
                },
                style: raisedButtonStyle,
                child: const Text('\nAlkohol fliessen lassen\n',
                    style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center)),
            const Text(
              '\n',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 7.0),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListTileSelectExample()));
                },
                style: raisedButtonStyle,
                child: const Text('\nAnzahl der Spieler waehlen\n',
                    style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center)),
            const Text(
              '\n',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 7.0),
            ),
            ElevatedButton(
                onPressed: () {
                  return rules(context);
                },
                style: raisedButtonStyle,
                child: const Text('\nRegeln einsehen\n',
                    style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center)),
            const Text(
              '\n',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 7.0),
            ),
            ElevatedButton(
                onPressed: () {
                  return _beschwerde(context);
                },
                style: raisedButtonStyle,
                child: const Text('\nBeschweren\n',
                    style: TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center)),
            const Text(
              '\n\n\n',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 7.0),
            ),
            const Text(
              'by Don B',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.0),
            )
          ]),
    );
  }

  Future<void> _gameAlertDialog(BuildContext context) async {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 2));
        return const AlertDialog(
          title: Text("Bitte erst Spieleranzhal waehlen",
              textAlign: TextAlign.center, style: TextStyle(fontSize: 25.0)),
          elevation: 24.0,
          //shape: CircleBorder(),
        );
      },
    );
  }

  void _spielerAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 1));
        return AlertDialog(
          title: Text("$spieleranzahl Spieler gewählt",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25.0)),
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
