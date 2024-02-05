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
              TextSpan(
                style: TextStyle(fontSize: 25.0),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Regelwerk\n\n',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text:
                          'Dies sind die heiligen Regeln des Trinkinators, welche von auserwählten besonders trinkfesten Mitgliedern des Stammes der Alkitonen seit Jahrtausenden mündlich weitergegeben werden, seitdem sie im Jahre 80.085 vor Christus das erste Mal destilliertes Schlangengift aus Mammutstoßzähnen getrunken haben.\n\n'),
                  TextSpan(
                    text: 'Regel Nr. 1:\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text:
                          'Die Anweisungen des Trinkinators sind IMMER strikt zu befolgen. Der Trinkinator hat IMMER recht.\nDer Trinkinator ist vollkommen und perfekt. Wenn er das einmal nicht ist, dann nur, weil er dies so will!\nJegliches Diskutieren, Brechen und Anfechten der hier niedergeschriebenen Regeln oder dem Inhalt des Spieles führt automatisch zu 3 Strafschlücken!\n\n'),
                  TextSpan(
                    text: 'Regel Nr. 2:\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text:
                          'Jede Aufgabe muss bis zum Ende durchgeführt werden, auch wenn schon ein Verlierer feststeht.\nEs müssen ALLE Verlierer trinken.\n\n'),
                  TextSpan(
                    text: 'Regel Nr. 3:\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text:
                          'Alle Spieler müssen entweder Getränke mit demselben Alkoholgehalt trinken ODER die Anzahl der Schlücke bis zu einem äquivalenten Alkoholgehalt hochrechnen. Dabei wird mathematisch korrekt gerundet (bis 0,4 abrunden, ab 0,5 aufrunden).\n\n'),
                  TextSpan(
                    text:
                        'Beispiel: Ein Spieler1 trinkt Bier (5 Prozent Alk.) ein Spieler2 trinkt Wein (12 Prozent Alk.) 12/5 = 2,4 --> gerundet 2 --> Spieler1 muss also immer die doppelte Anzahl an Schlücken nehmen oder VOR Spielbeginn Spieler2 davon überzeugen, auch Bier zu trinken.\n\n',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                    text: 'Regel Nr. 4:\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text:
                          'Jeder Spieler verpflichtet sich dazu, stets ehrenhaft und nach bestem Wissen und Gewissen zu handeln und zu antworten.\nLuegen, die im Laufe der Partie aufgedeckt werden, führen zum sofortigen Ausschluss von allen Partien für mindestens 24 Stunden.\n\n'),
                  TextSpan(
                    text: 'Regel Nr. 5:\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text:
                          'Das frühzeitige Austreten aus dem Spiel ist nur mit der Zustimmung ALLER Mitspieler möglich.\nDer Ersteller dieses Spiels, der allmächtige Don B, appelliert an diesem Punkt an die Fairness der Spieler in Bezug auf gesundheitliche Spätfolgen. Trinkt immer verantwortungsvoll!\n\n'),
                  TextSpan(
                    text: 'Regel Nr. 6:\n\n',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                      text:
                          'Bei Ich \'habe noch nie...!\' Aufgaben werden immer 3 Schlücke genommen.\nAlternativ kann man sich VOR jeder Partie auf eine andere Anzahl der Schlücke mit allen Spielern einigen, die dann für alle gilt.\n\n'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Verstanden!',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color(0xFF000000),
                  ),
                  textAlign: TextAlign.center),
            ),
          ]),
    );
  }));
}
