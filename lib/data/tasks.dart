import 'package:trinkinator/core/enums/setting.dart';
import 'package:trinkinator/core/models/task.dart';

class Tasks {
  List<Task> tasks = [
    Task(
      'Ich habe noch nie...! Ich habe noch nie ein Tiktok-Tanzvideo gedreht.',
      0,
      category: Setting.categoryNeverEver,
    ),
    Task(
      'Abstimmung (Alle)! Wer ist der Geizhals im Raum?',
      1,
      category: Setting.categoryVote,
    ),
    Task(
      'Abstimmung (Alle)! Mit wem würdest du dir am liebsten einen Schlaafsack teilen?',
      2,
      category: Setting.categoryVote,
    ),
    Task(
      'Abstimmung (Alle)! Wer hat am öftersten Schule geschwänzt?',
      3,
      category: Setting.categoryVote,
    ),
    Task(
      'Wahrheit (Alle)! Welchen Celebrity findest du am attraktivsten?',
      4,
      category: Setting.categoryTruth,
    ),
    Task(
      'Du darfst 5 Minuten weder ja noch nein sagen.',
      5,
    ),
    Task(
      'Trinke selbst 1 Schluck.',
      6,
    ),
    Task(
      'Trinke selbst 2 Schlücke.',
      7,
    ),
    Task(
      'Trinke selbst 3 Schlücke.',
      8,
    ),
    Task(
      'Trinke 1 Schluck, wenn du ein Tattoo hast.',
      9,
    ),
    Task(
      'Trinke 2 Schlücke, wenn du heute zu spät gekommen bist.',
      10,
    ),
    Task(
      'Trinke 2 Schlücke, wenn du schon mal in einem Krankenhaus übernachtet hast.',
      11,
    ),
    Task(
      'Trinke 1 Schluck, wenn du Single bist.',
      12,
    ),
    Task(
      'Trinke 2 Schlücke, wenn du jemals auf einem Roadtrip warst.',
      13,
    ),
    Task(
      'Verteile 3 Schlücke an die anderen Spieler.',
      14,
    ),
    Task(
      'Verteile 2 Schlücke an die anderen Spieler.',
      15,
    ),
    Task(
      'Verteile 1 Schluck an einen anderen Spieler.',
      16,
    ),
    Task(
      'Du holst dem Spieler rechts neben Dir sein neues Getränk.',
      17,
    ),
    Task(
      'Auf Ex! Du musst Dein Getränk austrinken!',
      18,
      category: Setting.categoryExtreme,
    ),
    Task(
      'Shots! Shots! Shots! Eine Runde Kurze für ALLE!',
      19,
    ),
    Task(
      'Wasserbombe! Du darfst einem Deiner Mitspieler einen Kurzen ins Getränk mischen.',
      20,
    ),
    Task(
      "Deutschstunde! Alle Spieler müssen schnellstmöglich fehlerfrei das 'ABC' aufsagen. Stoppt die Zeit. Der langsamste Spieler muss 3 Schlücke trinken.",
      21,
    ),
    Task(
      'Trinke gemeinsam mit dem jüngsten Spieler! Wenn Du selbst der jüngste Spieler bist, trinke 2 Mal auf die Jugend!',
      22,
    ),
    Task(
      'Geschichtsstunde! Nenne US-Präsidenten. Für jeden richtig genannten darfst Du einen Schluck verteilen!',
      23,
    ),
    Task(
      'Why so Serious? Joker Time! Jeder Spieler darf eine beaufsichtigte Anzahl an Schlücken nehmen. Diese stehen ihm bis zum Ende dieser Partie zum Verteilen zur Verfügung. (Notieren empfohlen, bitte ehrenvoll auf ausgeglichenen Alkoholgehalt achten! Siehe Regel Nr. 3).',
      24,
      category: Setting.categoryExtreme,
    ),
    Task(
      'Trinke 3 Schlücke, Du wirst es schon verdient haben.',
      25,
    ),
    Task(
      'Beim Spannen erwischt! Trinke 1 Schluck für jeden Spieler des anderen Geschlechts.',
      26,
    ),
    //Task(
    //    'Arbeitest Du noch an mindestens einem Traum, den Du als Kind hattest? Wenn die Antwort nein ist, dann trinke 2 Kurze als Strafe!'),
    Task(
      'Kampfjet! Wirf mit einem kleinen Papierkügelchen nach dem Glas eines Mitspielers. Wenn Du triffst, muss er Exen! (Mindestabstand zwei Armlängen des Opfers).',
      27,
      category: Setting.categoryExtreme,
    ),
    Task(
      'Drinks unter der Dusche! Trinke 2 Schlücke und tu für 10 Sekunden so, als würdest Du unter der Dusche stehen. Shampoo nicht vergessen.',
      28,
    ),
    Task(
      'Sportstunde! Mache so viele Liegestütze, wie Du kannst. Männer: 1 Schluck verteilen pro 10 geschafften. Frauen: 1 Schluck verteilen pro 5 geschafften.',
      29,
    ),
    Task(
      'Mega Mind! Du darfst Dir eine Regel ausdenken, musst dafür aber ein volles Getränk Exen. Die Entscheidung liegt bei Dir!',
      30,
      category: Setting.categoryExtreme,
    ),
    Task(
      'Türsteher! Ihr dürft nur noch aufs Klo gehen, nachdem ihr einen Shot getrunken habt.',
      31,
    ),
    Task(
      'Ich habe noch nie...! Ich habe noch nie meine Nachbarn ausspioniert.',
      32,
      category: Setting.categoryNeverEver,
    ),
    Task(
      'Ich habe noch nie...! Ich habe noch nie einen Kuss abgelehnt.',
      33,
      category: Setting.categoryNeverEver,
    ),
    Task(
      'Ich habe noch nie...! Ich habe noch nie jemanden geküsst, den/die ich nicht kannte.',
      34,
      category: Setting.categoryNeverEver,
    ),
    Task(
      'Ich habe noch nie...! Ich habe noch nie Handschellen getragen.',
      35,
      category: Setting.categoryNeverEver,
    ),
    Task(
      'Ich habe noch nie...! Ich hab noch nie bei einem Test geschummelt.',
      36,
      category: Setting.categoryNeverEver,
    ),
    Task(
      'Ich habe noch nie...! Ich hab noch nie einen Ausweis gefälscht.',
      37,
      category: Setting.categoryNeverEver,
    ),
    Task(
      'Trinke 2 Schlücke, wenn Du keinen MSN Account hast.',
      38,
    ),
    Task(
      'Der Gönner! Verteile 5 Schlücke an Deine Mitspieler, wenn Du innerhalb des letzten Jahres aktiv gespendet hast.',
      39,
    ),
    Task(
      'Shuffle Mode! Alle Getränke wandern im Uhrzeigersinn um einen Besitzer weiter. KANN übersprungen werden, wenn alle dasselbe Getränk haben, dann trinken alle 3 Schlücke.',
      40,
    ),
    Task(
      'Fred Fred Manfred! Ab jetzt musst Du in jedem Satz einbauen, wie schwer beschäftigt Du heute nicht warst. Bei vergessen Trinken.',
      41,
    ),
    Task(
      'Kondom gerissen! Dir ist beim Liebesspiel das Kondom gerissen. Trinke auf Ex und einen Kurzen um die Pille danach zu kaufen, ODER trinke ab nächster Runde jedes Mal wenn Du an der Reihe bist einen Kurzen bis zum Ende des Spieles, um Deine Alimente zu begleichen.',
      42,
      category: Setting.categoryNSFW,
    ),
  ];

  List<Task> fetchTasks() {
    return tasks;
  }

  void addTask(String taskText, int id, Setting taskCategory) {
    var task = Task(taskText, id, category: taskCategory);
    tasks.add(task);
  }

  void removeTaskById(int id) {
    tasks.removeWhere((element) => element.taskId == id);
  }
}
