import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:trinkinator/components/old_code.dart';
import 'package:trinkinator/components/game.dart';
import 'package:trinkinator/components/players.dart';
import 'package:trinkinator/components/add_players.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trinkinator',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: Game(),
      routes: {
        '/play': (context) => StartGame(),
        '/players': (context) => AddPlayers()
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
