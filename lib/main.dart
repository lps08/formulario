import 'package:flutter/material.dart';
import 'package:formulario/views/screens/list_cards_screen.dart';
import 'package:formulario/views/screens/loading_cards_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => LoadingCardsPage(),
      },
      initialRoute: '/',
    );
  }
}
