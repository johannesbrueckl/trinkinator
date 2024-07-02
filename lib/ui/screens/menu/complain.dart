import 'package:flutter/material.dart';

class Complain extends StatefulWidget {
  const Complain({super.key});

  @override
  _Complain createState() => _Complain();
}

class _Complain extends State<Complain> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: [
                const Text(
                  'Kritik wird nicht geduldet, siehe Regel Nr.1!\nTrinke 3 Strafschlücke!\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Prost!',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Color(0xFF000000),
                      ),
                      textAlign: TextAlign.center),
                ),
              ]),
        ),
      );
}
