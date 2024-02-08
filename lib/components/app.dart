import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trinkinator/components/index.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trinkinator',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFf5b7b1),
          tertiary: Color(0xFFf8f8f8),
          background: Color(0xFFaed6f1),
          onPrimary: Color(0xFF000000),
          outline: Color(0xFFf8f8f8),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFaed6f1),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: const Color(0xFFfff1ee),
              backgroundColor: const Color(0xFFf5b7b1),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  side: BorderSide(color: Color(0xFFf8f8f8))),
              elevation: 5,
              textStyle: const TextStyle(
                //this is bugged, color needs setting manual.
                color: Colors.black,
                fontSize: 20.0,
              )),
        ),
      ),
      home: const MainMenu(),
      routes: {
        '/play': (context) => const StartGame(),
        '/players': (context) => const AddPlayers(),
        '/settings': (context) => const Settings(),
        '/rules': (context) => const RulesRefactor(),
      },
    );
  }
}

final playerNamesProvider = StateProvider<List<String>>((ref) => []);

final settingsProvider = StateProvider<List<Setting>>((ref) => [
      Setting.categoryNeutral,
    ]);

final tasksProvider = StateProvider<List<Task>>((ref) => [
      //33 Aufgaben.
      Task('Trinke selbst 1 Schluck.'),
      Task('Trinke selbst 2 Schlücke.'),
      Task('Trinke selbst 3 Schlücke.'),
      Task('Verteile 3 Schlücke an die anderen Spieler.'),
      Task('Du holst dem Spieler rechts neben Dir sein neues Getränk.'),
      Task('Auf Ex! Du musst Dein Getränk austrinken!',
          category: Setting.categoryExtreme),
      Task('Shots! Shots! Shots! Eine Runde Kurze für ALLE!'),
      Task(
          'Wasserbombe! Du darfst einem Deiner Mitspieler einen Kurzen ins Getränk mischen.'),
      Task(
          "Deutschstunde! Alle Spieler müssen schnellstmöglich das 'ABC' aufsagen. Stoppt die Zeit. Der langsamste Spieler muss 3 Schlücke trinken. ACHTUNG: Fehler führen zur sofortigen Niederlage!"),
      Task(
          'Trinke gemeinsam mit dem jüngsten Spieler! Wenn Du selbst der jüngste Spieler bist, trinke 2 Mal auf die Jugend!'),
      Task(
          'Geschichtsstunde! Nenne US-Präsidenten. Für jeden richtig genannten darfst Du einen Schluck verteilen!'),
      Task(
          'Deutschstunde! Rezitiere ein ganzes literarisches Werk (z.B. ein Gedicht, Reim). Du darfst maximal zwei Zeilen auslassen. Schaffst Du es, darfst Du 10 Schlücke verteilen. Schaffst Du es nicht, musst Du selbst 5 Schlücke trinken.'),
      Task(
          'Musikunterricht! Singe Freestyle für mindestens 10 Sekunden, was Dir gerade in den Sinn kommt oder trinke 5 Schlücke.'),
      Task(
          'Why so Serious? Joker Time! Jeder Spieler darf eine beaufsichtigte Anzahl an Schlücken nehmen. Diese stehen ihm bis zum Ende dieser Partie zum Verteilen zur Verfügung. (Notieren empfohlen, bitte ehrenvoll auf ausgeglichenen Alkoholgehalt achten! Siehe Regel Nr. 3).',
          category: Setting.categoryExtreme),
      Task('Trinke 3 Schlücke, Du wirst es schon verdient haben.'),
      Task(
          'Beim Spannen erwischt! Trinke 1 Schluck für jeden Spieler des anderen Geschlechts.'),
      Task(
          'Arbeitest Du noch an mindestens einem Traum, den Du als Kind hattest? Wenn die Antwort nein ist, dann trinke 2 Kurze als Strafe!'),
      Task(
          'Kampfjet! Wirf mit einem kleinen Papierkügelchen nach dem Glas eines Mitspielers. Wenn Du triffst, muss er Exen! (Mindestabstand zwei Armlängen des Opfers).'),
      Task(
          'Drinks unter der Dusche! Trinke 2 Schlücke und tu für 10 Sekunden so, als würdest Du unter der Dusche stehen. Shampoo nicht vergessen.'),
      Task(
          'Sportstunde! Mache so viele Liegestütze, wie Du kannst. Männer: 1 Schluck verteilen pro 10 geschafften. Frauen: 1 Schluck verteilen pro 5 geschafften.'),
      Task(
          'Mega Mind! Du darfst Dir eine Regel ausdenken, musst dafür aber 7 Schlücke trinken. Die Entscheidung liegt bei Dir!',
          category: Setting.categoryExtreme),
      Task(
          'Türsteher! Ihr dürft nur noch aufs Klo gehen, nachdem ihr einen Shot getrunken habt.'),
      Task(
          'Ich habe noch nie...! Ich habe noch nie meine Nachbarn ausspioniert.',
          category: Setting.categoryNeverEver),
      Task(
          'Ich habe noch nie...! Ich habe noch nie einen Freund angelogen, um Schlimmeres zu verhindern.',
          category: Setting.categoryNeverEver),
      Task('Ich habe noch nie...! Ich habe noch nie einen Kuss abgelehnt.',
          category: Setting.categoryNeverEver),
      Task(
          'Ich habe noch nie...! Ich habe noch nie jemanden geküsst, den/die ich nicht kannte.',
          category: Setting.categoryNeverEver),
      Task('Ich habe noch nie...! Ich habe noch nie Handschellen getragen.',
          category: Setting.categoryNeverEver),
      Task('Trinke 2 Schlücke, wenn Du keinen MSN Account hast.'),
      Task(
          'Der Gönner! Verteile 5 Schlücke an Deine Mitspieler, wenn Du innerhalb des letzten Jahres aktiv gespendet hast.'),
      Task(
          'Shuffle Mode! Alle Getränke wandern im Uhrzeigersinn um einen Besitzer weiter. KANN übersprungen werden, wenn alle dasselbe Getränk haben, dann trinken alle 3 Schlücke.'),
      Task(
          'Fred Fred Manfred! Ab jetzt musst Du in jedem Satz einbauen, wie schwer beschäftigt Du heute nicht warst. Bei vergessen Trinken.'),
      Task(
          'Kondom gerissen! Dir ist beim Liebesspiel das Kondom gerissen. Trinke auf Ex und einen Kurzen um die Pille danach zu kaufen, ODER trinke ab nächster Runde jedes Mal wenn Du an der Reihe bist einen Kurzen bis zum Ende des Spieles, um Deine Alimente zu begleichen.',
          category: Setting.categoryNSFW),
    ]);
