import 'package:flutter/material.dart';

//TODO: implment cards list

class ListCardsPage extends StatefulWidget {
  const ListCardsPage({Key? key}) : super(key: key);

  @override
  _ListCardsPageState createState() => _ListCardsPageState();
}

class _ListCardsPageState extends State<ListCardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista clientes'),
      ),
      body: Container(),
    );
  }
}
