import 'package:flutter/material.dart';
import 'package:trinkinator/app/routes.dart';
import 'package:trinkinator/ui/screens/menu/main_menu.dart';

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
      routes: appRoutes,
    );
  }
}
