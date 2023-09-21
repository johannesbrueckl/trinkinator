import 'package:flutter/material.dart';
import 'package:trinkinator/components/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:trinkinator/components/logger.dart';

void main() {
  Logger.level = Level.debug;
  runApp(const ProviderScope(child: MaterialApp(home: App())));
}
