import 'package:flutter/material.dart';
import 'package:trinkinator/ui/screens/game/add_players.dart';
import 'package:trinkinator/ui/screens/game/game.dart';
import 'package:trinkinator/ui/screens/menu/complain.dart';
import 'package:trinkinator/ui/screens/menu/rules.dart';
import 'package:trinkinator/ui/screens/settings/add_task.dart';
import 'package:trinkinator/ui/screens/settings/settings.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/play': (context) => const StartGame(),
  '/players': (context) => const AddPlayers(),
  '/settings': (context) => const Settings(),
  '/rules': (context) => const RulesRefactor(),
  '/complain': (context) => const Complain(),
  '/addTask': (context) => const AddTaskScreen(),
};
