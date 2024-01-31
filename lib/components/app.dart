import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:trinkinator/components/main_menu.dart';
import 'package:trinkinator/components/game.dart';
import 'package:trinkinator/components/add_players.dart';

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
        '/players': (context) => const AddPlayers()
        /*
        Players(
              namen: const [],
            )
            */
      },
    );
  }
}

//class AppState extends ChangeNotifier {}

final playerNamesProvider = StateProvider<List<String>>((ref) => []);

final tasksProvider = StateProvider<List<String>>((ref) => [
      //33 Aufgaben.
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
      "Musikunterricht! Singe feestyle fuer mindestens 10 Sekunden was dir gerade in den Sinn kommt oder trinke 5 Schluecke.",
      "Why so Serious? Joker Time! Jeder Spieler darf eine beaufsichtigte Anzahl an Schluecken nehmen. Diese stehen ihm bis zum Ende dieser Partie zum verteilen zur Verfuegung. (Notieren empfohlen, bitte ehrenvoll auf ausgeglichenen Alkoholgehalt achten! siehe Regel Nr 3).",
      "Trinke 3 Schluecke, Du wirst es schon verdient haben.",
      "Beim Spannen erwischt! Trinke 1 Schluck fuer jeden Spieler des anderen Geschlechts.",
      "Arbeitest du noch an mindestens einem Traum den du als Kind hattest? Wenn die Antwort nein ist dann trinke 2 Kurze zur Strafe!",
      "Kampfjet! Wirf mit einem kleinen Papierkuegelchen nach dem Glas von einem Mitspieler. Wenn du triffst muss er Exen! (Mindestabstand zwei Armlaengen des Opfers).",
      "Drinks unter der Dusche! Trinke 2 Schluecke und tu fuer 10 Sekunden so als wurdest du unter der Dusche stehen. Schampoo nicht vergessen.",
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
    ]);
