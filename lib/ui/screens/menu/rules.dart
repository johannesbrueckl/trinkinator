import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class RulesRefactor extends StatefulWidget {
  const RulesRefactor({
    super.key,
  });

  @override
  _RulesRefactor createState() => _RulesRefactor();
}

class _RulesRefactor extends State<RulesRefactor> {
  static const Color _senderBubbleColor = Color(0xFF1B97F3);
  static const Color _notSenderBubbleColor = Color.fromARGB(255, 106, 162, 135);
  //Color.fromARGB(255, 145, 145, 173);

  @override
  Widget build(BuildContext context) => Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 45, right: 8, bottom: 8, left: 8),
        children: [
          const BubbleSpecialThree(
            color: _senderBubbleColor,
            tail: true,
            text: 'Können wir jetzt endlich anfangen? 🧐',
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const BubbleSpecialThree(
            color: _notSenderBubbleColor,
            tail: true,
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
            isSender: false,
            text: 'Moment, ein paar Spielregeln gibt es da schon noch 🐶☝️',
          ),
          const BubbleSpecialThree(
            color: _senderBubbleColor,
            tail: true,
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
            text: 'okay, dann schieß mal los 🙄',
          ),
          const BubbleSpecialThree(
            color: _notSenderBubbleColor,
            tail: false,
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
            isSender: false,
            text:
                'Regel Nr. 1:\nDie Anweisungen des Trinkinators sind IMMER strikt zu befolgen. Der Trinkinator hat IMMER recht. Der Trinkinator ist vollkommen und perfekt. Wenn er das einmal nicht ist, dann nur, weil er dies so will!\nJegliches Diskutieren, Brechen und Anfechten der hier niedergeschriebenen Regeln oder dem Inhalt des Spieles führt automatisch zu 3 Strafschlücken! ',
          ),
          const BubbleSpecialThree(
            color: _notSenderBubbleColor,
            tail: true,
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
            isSender: false,
            text:
                'Regel Nr. 2:\nJede Aufgabe muss bis zum Ende durchgeführt werden, auch wenn schon ein Verlierer feststeht.\nEs müssen ALLE Verlierer trinken. 🍾',
          ),
          const BubbleSpecialThree(
            color: _senderBubbleColor,
            tail: true,
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
            text: 'Ich gewinne immer 💪',
          ),
          const BubbleSpecialThree(
            color: _notSenderBubbleColor,
            tail: false,
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
            isSender: false,
            text:
                'Regel Nr. 3:\nAlle Spieler müssen entweder Getränke mit demselben Alkoholgehalt trinken ODER die Anzahl der Schlücke bis zu einem äquivalenten Alkoholgehalt hochrechnen. Dabei wird mathematisch korrekt gerundet (bis 0,5 abrunden, ab 0,5 aufrunden).',
          ),
          const BubbleSpecialThree(
            color: _notSenderBubbleColor,
            tail: true,
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
            isSender: false,
            text:
                'Beispiel: Tom 👨 trinkt Bier 🍺 (5 Prozent Alk.) Laura 👩 trinkt Wein 🍷 (12 Prozent Alk.) 12/5 = 2,4 --> gerundet 2 --> Tom 👨 muss also immer die doppelte Anzahl an Schlücken nehmen oder VOR Spielbeginn Laura 👩 davon überzeugen, auch Bier 🍺 zu trinken. 🧑‍🔬🧪',
          ),
          const BubbleSpecialThree(
            color: _senderBubbleColor,
            tail: true,
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
            text: 'Puh, ganz schön kompliziert 🤔',
          ),
          const BubbleSpecialThree(
            color: _notSenderBubbleColor,
            tail: false,
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
            isSender: false,
            text:
                'Regel Nr. 4:\nJeder Spieler verpflichtet sich dazu, stets ehrenhaft und nach bestem Wissen und Gewissen zu handeln und zu antworten.\nLügen, die im Laufe der Partie aufgedeckt werden, führen zum sofortigen Ausschluss von allen Partien für mindestens 24 Stunden. 👮‍♂️',
          ),
          const BubbleSpecialThree(
            color: _notSenderBubbleColor,
            tail: true,
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
            isSender: false,
            text:
                'Regel Nr. 5:\nDas frühzeitige Austreten aus dem Spiel ist nur mit der Zustimmung ALLER Mitspieler möglich.\nDer Ersteller dieses Spiels, der allmächtige Don B, appelliert an diesem Punkt an die Fairness der Spieler in Bezug auf gesundheitliche Spätfolgen. Trinkt immer verantwortungsvoll! 😇',
          ),
          const BubbleSpecialThree(
            color: _senderBubbleColor,
            tail: true,
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
            text: 'Wie viele denn noch? 🤬',
          ),
          const BubbleSpecialThree(
            color: _notSenderBubbleColor,
            tail: true,
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
            isSender: false,
            text:
                'Regel Nr. 6:\nBei Ich \'habe noch nie...!\' Aufgaben werden immer 3 Schlücke genommen.\nAlternativ kann man sich VOR jeder Partie auf eine andere Anzahl der Schlücke mit allen Spielern einigen, die dann für alle gilt.',
          ),
          const BubbleSpecialThree(
            color: _senderBubbleColor,
            tail: true,
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
            text:
                'Kann ich mir eh nicht alles merken. Darf ich jetzt ENDLICH loslegen? 😎',
          ),
          const BubbleSpecialThree(
            color: _notSenderBubbleColor,
            tail: true,
            textStyle: TextStyle(color: Colors.white, fontSize: 16),
            isSender: false,
            text: 'Und am allerwichtigsten: Habt Spaß! 🎉🍻❤️',
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              right: 50,
              bottom: 30,
            ),
            alignment: Alignment.topRight,
            child: ElevatedButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('ja, ja, los jetzt!'),
            ),
          )
        ],
      ));
}
