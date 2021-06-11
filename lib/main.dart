import 'package:flutter/material.dart';
import 'package:formulario/views/screens/home_screen.dart';
import 'package:formulario/views/screens/register_screen.dart';

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
        '/': (context) => RegisterPage(),
      },
      initialRoute: '/',
    );
  }
}
