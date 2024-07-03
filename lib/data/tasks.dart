import 'package:trinkinator/core/enums/setting.dart';
import 'package:trinkinator/core/models/task.dart';

class Tasks {
  List<Task> fetchTasks() {
    return [
      //42 Aufgaben.
      Task('Abstimmung (Alle)! Wer ist der Geizhals im Raum?',
          category: Setting.categoryVote),
      Task(
          'Abstimmung (Alle)! Mit wem würdest du dir am liebsten einen Schlaafsack teilen?',
          category: Setting.categoryVote),
      Task('Abstimmung (Alle)! Wer hat am öftersten Schule geschwänzt?',
          category: Setting.categoryVote),
      Task('Wahrheit (Alle)! Welchen Celebrity findest du am attraktivsten?',
          category: Setting.categoryTruth),
      Task('Du darfst 5 Minuten weder ja noch nein sagen.'),
      Task('Trinke selbst 1 Schluck.'),
      Task('Trinke selbst 2 Schlücke.'),
      Task('Trinke selbst 3 Schlücke.'),
      Task('Trinke 1 Schluck, wenn du ein Tattoo hast.'),
      Task('Trinke 2 Schlücke, wenn du heute zu spät gekommen bist.'),
      Task(
          'Trinke 2 Schlücke, wenn du schon mal in einem Krankenhaus übernachtet hast.'),
      Task('Trinke 1 Schluck, wenn du Single bist.'),
      Task('Trinke 2 Schlücke, wenn du jemals auf einem Roadtrip warst.'),
      Task('Verteile 3 Schlücke an die anderen Spieler.'),
      Task('Verteile 2 Schlücke an die anderen Spieler.'),
      Task('Verteile 1 Schluck an einen anderen Spieler.'),
      Task('Du holst dem Spieler rechts neben Dir sein neues Getränk.'),
      Task('Auf Ex! Du musst Dein Getränk austrinken!',
          category: Setting.categoryExtreme),
      Task('Shots! Shots! Shots! Eine Runde Kurze für ALLE!'),
      Task(
          'Wasserbombe! Du darfst einem Deiner Mitspieler einen Kurzen ins Getränk mischen.'),
      Task(
          "Deutschstunde! Alle Spieler müssen schnellstmöglich fehlerfrei das 'ABC' aufsagen. Stoppt die Zeit. Der langsamste Spieler muss 3 Schlücke trinken."),
      Task(
          'Trinke gemeinsam mit dem jüngsten Spieler! Wenn Du selbst der jüngste Spieler bist, trinke 2 Mal auf die Jugend!'),
      Task(
          'Geschichtsstunde! Nenne US-Präsidenten. Für jeden richtig genannten darfst Du einen Schluck verteilen!'),
      Task(
          'Why so Serious? Joker Time! Jeder Spieler darf eine beaufsichtigte Anzahl an Schlücken nehmen. Diese stehen ihm bis zum Ende dieser Partie zum Verteilen zur Verfügung. (Notieren empfohlen, bitte ehrenvoll auf ausgeglichenen Alkoholgehalt achten! Siehe Regel Nr. 3).',
          category: Setting.categoryExtreme),
      Task('Trinke 3 Schlücke, Du wirst es schon verdient haben.'),
      Task(
          'Beim Spannen erwischt! Trinke 1 Schluck für jeden Spieler des anderen Geschlechts.'),
      //Task(
      //    'Arbeitest Du noch an mindestens einem Traum, den Du als Kind hattest? Wenn die Antwort nein ist, dann trinke 2 Kurze als Strafe!'),
      Task(
          'Kampfjet! Wirf mit einem kleinen Papierkügelchen nach dem Glas eines Mitspielers. Wenn Du triffst, muss er Exen! (Mindestabstand zwei Armlängen des Opfers).',
          category: Setting.categoryExtreme),
      Task(
          'Drinks unter der Dusche! Trinke 2 Schlücke und tu für 10 Sekunden so, als würdest Du unter der Dusche stehen. Shampoo nicht vergessen.'),
      Task(
          'Sportstunde! Mache so viele Liegestütze, wie Du kannst. Männer: 1 Schluck verteilen pro 10 geschafften. Frauen: 1 Schluck verteilen pro 5 geschafften.'),
      Task(
          'Mega Mind! Du darfst Dir eine Regel ausdenken, musst dafür aber ein volles Getränk Exen. Die Entscheidung liegt bei Dir!',
          category: Setting.categoryExtreme),
      Task(
          'Türsteher! Ihr dürft nur noch aufs Klo gehen, nachdem ihr einen Shot getrunken habt.'),
      Task(
          'Ich habe noch nie...! Ich habe noch nie meine Nachbarn ausspioniert.',
          category: Setting.categoryNeverEver),
      Task('Ich habe noch nie...! Ich habe noch nie einen Kuss abgelehnt.',
          category: Setting.categoryNeverEver),
      Task(
          'Ich habe noch nie...! Ich habe noch nie jemanden geküsst, den/die ich nicht kannte.',
          category: Setting.categoryNeverEver),
      Task('Ich habe noch nie...! Ich habe noch nie Handschellen getragen.',
          category: Setting.categoryNeverEver),
      Task('Ich habe noch nie...! Ich hab noch nie bei einem Test geschummelt.',
          category: Setting.categoryNeverEver),
      Task('Ich habe noch nie...! Ich hab noch nie einen Ausweis gefälscht.',
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
    ];
  }
}
