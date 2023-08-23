import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:trinkinator/components/old_code.dart';
import 'package:trinkinator/components/game.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Trinkinator',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: const Game(),
        routes: {
          '/play': (context) => StartGame(),
        },
      ),
    );
  }
}

class AppState extends ChangeNotifier {}
