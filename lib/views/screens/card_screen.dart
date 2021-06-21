import 'package:flutter/material.dart';
import 'package:formulario/models/client.dart';

class CardPage extends StatefulWidget {
  final Client client;

  CardPage({required this.client});

  @override
  _CardPageState createState() => _CardPageState(client: client);
}

class _CardPageState extends State<CardPage> {
  final Client client;

  _CardPageState({required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina do paciente'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
