import 'package:flutter/material.dart';

class ListCardsPage extends StatefulWidget {
  final List<Widget> containers;

  ListCardsPage({required this.containers});

  @override
  _ListCardsPageState createState() =>
      _ListCardsPageState(containers: containers);
}

class _ListCardsPageState extends State<ListCardsPage> {
  List<Widget> containers;

  _ListCardsPageState({required this.containers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de clientes'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: containers,
        )),
      ),
    );
  }
}
