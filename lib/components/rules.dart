import 'package:flutter/material.dart';

void rules(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute<void>(builder: (BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: [
            const Text.rich(
                TextSpan(style: TextStyle(fontSize: 25.0), children: [
              TextSpan(
                  text: 'Regelwerk\n\n',
                  style:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      'Dies sind die heiligen Regeln des Trinkinators, welche von auserwaehlten besonders trinkfesten Mitgliedern des Stammes der Alkitonen seit Jahrtausenden muendlich weitergegeben werden, seitdem sie im Jahre 80.085 vor Christus das erste Mal destiliertes Schlangengift aus Mammutstosszaehnen getrunken haben.\n\n'),
              TextSpan(
                  text: 'Regel Nr 1:\n\n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      'Die Anweisungen des Trinkinators sind IMMER strikt zu befolgen. Der Trinkinator hat IMMER recht.\nDer Trinkinator ist vollkommen und perfekt. Wenn er das einmal nicht ist, dann nur weil er dies so will!\nJegliches Diskutieren, Brechen und Anfechten der hier niedergeschrieben Regeln oder dem Inhalt des Spieles fuehrt automatisch zu 3 Strafschluecken!\n\n'),
              TextSpan(
                  text: 'Regel Nr 2:\n\n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      'Jede Aufgabe muss bis zum Ende durchgefuehrt werden, auch wenn schon ein Verlierer feststeht.\nEs muessen ALLE Verlierer Trinken.\n\n'),
              TextSpan(
                  text: 'Regel Nr 3:\n\n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      'Alle Spieler muessen entweder Getraenke mit dem selben Alkoholgehalt trinken ODER die Anzahl der Schluecke bis zu einem aequivalenten Alkoholgehalt hochrechnen. Dabei wird mathematisch korrekt gerundet (bis 0,4 abrunden, ab 0,5 aufrunden).\n\n'),
              TextSpan(
                  text:
                      'Beispiel: Ein Spieler1 trinkt Bier (5 Prozent Alk.) ein Spieler2 trinkt Wein (12 Prozent Alk.) 12/5 = 2,4 --> gerundet 2 --> Spieler1 muss also immer die doppelte Anzahl an Schluecken nehmen oder VOR Spielbeginn Spieler2 davon ueberzeugen auch Bier zu trinken.\n\n',
                  style: TextStyle(fontStyle: FontStyle.italic)),
              TextSpan(
                  text: 'Regel Nr 4:\n\n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      'Jeder Spieler verpflichtet sich dazu stehts ehrenhaft und nach bestem Wissen und Gewissen zu handeln und zu Antworten.\nLuegen die im Laufe der Partie aufgedeckt werden fuehren zum sofortigen Ausschluss von allen Partien fuer mindestens 24 Stunden.\n\n'),
              TextSpan(
                  text: 'Regel Nr 5:\n\n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      'Das fruehzeitige Austreten aus dem Spiel ist nur mit der Zustimmung ALLER Mitspieler moeglich.\nDer Ersteller dieses Spiels, der allmaechtige Don B, appelliert an diesem Punkt an die Fairness der Spieler in bezug auf Gesundheitliche spaetfolgen. Trinkt immer verantwortungsvoll!\n\n'),
              TextSpan(
                  text: 'Regel Nr 6:\n\n',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      'Bei Ich \'habe noch nie...!\' Aufgaben werden immer 3 Schluecke genommen.\nAlternativ kann man sich VOR jeder Partie auf eine andere Anzahl der Schluecke mit allen Spielern einigen die dann fuer alle gilt.\n\n'),
            ])),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Verstanden!',
                    style: TextStyle(fontSize: 30.0))),
          ],
        ));
  }));
}
