import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const Trinkinator());

class Trinkinator extends StatefulWidget {
  const Trinkinator({super.key});

  @override
  _TrinkinatorState createState() => _TrinkinatorState();
}

class _TrinkinatorState extends State<Trinkinator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trinkinator',
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: const Game(),
    );
  }
}

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  _GameState createState() => _GameState();
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.greenAccent[400],
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(18)),
      side: BorderSide(color: Colors.blueGrey)),
);

class _GameState extends State<Game> {
  final List<String> aufgaben = [
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
  final List<String> namen = [
    'Spieler 1',
    'Spieler 2',
    'Spieler 3',
    'Spieler 4',
    'Spieler 5',
    'Spieler 6',
    'Spieler 7',
    'Spieler 8'
  ];
  int spieleranzahl = 7;
  int spielerGesetzt = 0;
  Random random = Random();
  @override
  Widget build(BuildContext context) {
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
                  if (spielerGesetzt == 0) {
                    _gameAlertDialog(context);
                  } else {
                    int i = 0, j = -1;
                    _blankScreen(context);
                    _startGame(context, j, i);
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
                  return _spielerzahl(context);
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
                  return _regeln(context);
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

  void _startGame(BuildContext context, int j, int i) {
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
                return _startGame(context, j, i);
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

  void _blankScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return const Scaffold();
    }));
  }

  void _spielerzahl(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
          body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
        itemCount: namen.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              child: ListTile(
                onTap: () => {
                  Navigator.pop(context),
                  spieleranzahl = index + 1,
                  ++spielerGesetzt,
                  _spielerAlertDialog(context)
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                tileColor: Colors.blue,
                title: Text(namen[index], textAlign: TextAlign.center),
                titleTextStyle: const TextStyle(fontSize: 30),
                minVerticalPadding: 30,
              ));
        },
      ));
/*
      return Scaffold(
        body: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(40.0),
            children: <Widget>[
              const Text(
                '\nSpieleranzahl',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35.0),
              ),
              const Text(
                '\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 7.0),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    spieleranzahl = 2;
                    ++spielerGesetzt;
                    _spielerAlertDialog(context);
                  },
                  style: raisedButtonStyle,
                  child: const Text(
                    '2 Spieler',
                    style: TextStyle(fontSize: 30.0),
                  )),
              const Text(
                '\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 7.0),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    spieleranzahl = 3;
                    ++spielerGesetzt;
                    _spielerAlertDialog(context);
                  },
                  style: raisedButtonStyle,
                  child: const Text(
                    '3 Spieler',
                    style: TextStyle(fontSize: 30.0),
                  )),
              const Text(
                '\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 7.0),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    spieleranzahl = 4;
                    ++spielerGesetzt;
                    _spielerAlertDialog(context);
                  },
                  style: raisedButtonStyle,
                  child: const Text(
                    '4 Spieler',
                    style: TextStyle(fontSize: 30.0),
                  )),
              const Text(
                '\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 7.0),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    spieleranzahl = 5;
                    ++spielerGesetzt;
                    _spielerAlertDialog(context);
                  },
                  style: raisedButtonStyle,
                  child: const Text(
                    '5 Spieler',
                    style: TextStyle(fontSize: 30.0),
                  )),
              const Text(
                '\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 7.0),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    spieleranzahl = 6;
                    ++spielerGesetzt;
                    _spielerAlertDialog(context);
                  },
                  style: raisedButtonStyle,
                  child: const Text(
                    '6 Spieler',
                    style: TextStyle(fontSize: 30.0),
                  )),
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    spieleranzahl = 7;
                    ++spielerGesetzt;
                    _spielerAlertDialog(context);
                  },
                  style: raisedButtonStyle,
                  child: const Text(
                    '7 Spieler',
                    style: TextStyle(fontSize: 30.0),
                  )),
              const Text(
                '\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 7.0),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    spieleranzahl = 8;
                    ++spielerGesetzt;
                    _spielerAlertDialog(context);
                  },
                  style: raisedButtonStyle,
                  child: const Text(
                    '8 Spieler',
                    style: TextStyle(fontSize: 30.0),
                  )),
              const Text(
                '\n',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 7.0),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    spieleranzahl = 1;
                    ++spielerGesetzt;
                    _spielerAlertDialog(context);
                  },
                  style: raisedButtonStyle,
                  child: const Text(
                    'Fuer die Harten',
                    style: TextStyle(fontSize: 30.0),
                  )),
            ]),
      );
      */
    }));
  }

  void _beschwerde(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Regelwerk'),
          ),
          body: Center(
              child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: [
              const Text(
                'Du Opfer, wir haben dich doch sowieso nur mitgenommen damit wir auf den Behindertenparkplatz koennen.\nKritik wird nicht geduldet, siehe Regel Nr1!\nTrinke 3 Strafschluecke!\n',
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

  void _regeln(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Regelwerk'),
          ),
          body: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: [
              const Text.rich(TextSpan(children: <TextSpan>[
                TextSpan(
                    text: 'Regelwerk\n\n',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        'Dies sind die heiligen Regeln des Trinkinators, welche von auserwaehlten besonders trinkfesten Mitgliedern des Stammes der Alkitonen seit Jahrtausenden muendlich weitergegeben werden, seitdem sie im Jahre 80.085 vor Christus das erste Mal destiliertes Schlangengift aus Mammutstosszaehnen getrunken haben.\n\n',
                    style: TextStyle(fontSize: 25.0)),
                TextSpan(
                    text: 'Regel Nr 1:\n\n',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        'Die Anweisungen des Trinkinators sind IMMER strikt zu befolgen. Der Trinkinator hat IMMER recht.\nDer Trinkinator ist vollkommen und perfekt. Wenn er das einmal nicht ist, dann nur weil er dies so will!\nJegliches Diskutieren, Brechen und Anfechten der hier niedergeschrieben Regeln oder dem Inhalt des Spieles fuehrt automatisch zu 3 Strafschluecken!\n\n',
                    style: TextStyle(fontSize: 25.0)),
                TextSpan(
                    text: 'Regel Nr 2:\n\n',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        'Jede Aufgabe muss bis zum Ende durchgefuehrt werden, auch wenn schon ein Verlierer feststeht.\nEs muessen ALLE Verlierer Trinken.\n\n',
                    style: TextStyle(fontSize: 25.0)),
                TextSpan(
                    text: 'Regel Nr 3:\n\n',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        'Alle Spieler muessen entweder Getraenke mit dem selben Alkoholgehalt trinken ODER die Anzahl der Schluecke bis zu einem aequivalenten Alkoholgehalt hochrechnen. Dabei wird mathematisch korrekt gerundet (bis 0,4 abrunden, ab 0,5 aufrunden).\n\n',
                    style: TextStyle(fontSize: 25.0)),
                TextSpan(
                    text:
                        'Beispiel: Ein Spieler1 trinkt Bier (5 Prozent Alk.) ein Spieler2 trinkt Wein (12 Prozent Alk.) 12/5 = 2,4 --> gerundet 2 --> Spieler1 muss also immer die doppelte Anzahl an Schluecken nehmen oder VOR Spielbeginn Spieler2 davon ueberzeugen auch Bier zu trinken.\n\n',
                    style:
                        TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic)),
                TextSpan(
                    text: 'Regel Nr 4:\n\n',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        'Jeder Spieler verpflichtet sich dazu stehts ehrenhaft und nach bestem Wissen und Gewissen zu handeln und zu Antworten.\nLuegen die im Laufe der Partie aufgedeckt werden fuehren zum sofortigen Ausschluss von allen Partien fuer mindestens 24 Stunden.\n\n',
                    style: TextStyle(fontSize: 25.0)),
                TextSpan(
                    text: 'Regel Nr 5:\n\n',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        'Das fruehzeitige Austreten aus dem Spiel ist nur mit der Zustimmung ALLER Mitspieler moeglich.\nDer Ersteller dieses Spiels, der allmaechtige Don B, appelliert an diesem Punkt an die Fairness der Spieler in bezug auf Gesundheitliche spaetfolgen. Trinkt immer verantwortungsvoll!\n\n',
                    style: TextStyle(fontSize: 25.0)),
                TextSpan(
                    text: 'Regel Nr 6:\n\n',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        'Bei Ich \'habe noch nie...!\' Aufgaben werden immer 3 Schluecke genommen.\nAlternativ kann man sich VOR jeder Partie auf eine andere Anzahl der Schluecke mit allen Spielern einigen die dann fuer alle gilt.\n\n',
                    style: TextStyle(fontSize: 25.0)),
                TextSpan(
                    text: 'Regel Nr 7:\n\n',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        'Zivilpolizisten und verdeckte Ermittler sind auf Lebenszeit von der Teilname an diesem Spiel ausgeschlossen.\nAlle Ermittler haben kleine Schwaenze!\n\n',
                    style: TextStyle(fontSize: 25.0)),
                TextSpan(
                    text: 'Regel Nr 8:\n\n',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        'Wenn du dich mit dem Teufel einlaesst, veraendert sich nicht der Teufel. Der Teufel veraendert dich.\n',
                    style: TextStyle(fontSize: 25.0)),
              ])),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: raisedButtonStyle,
                  child: const Text('Verstanden!',
                      style: TextStyle(fontSize: 30.0))),
            ],
          ));
    }));
  }
}
