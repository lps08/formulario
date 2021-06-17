import 'package:flutter/material.dart';
import 'package:formulario/controllers/dao/client_dao.dart';
import 'package:formulario/views/widgets/card_cliente.dart';

//TODO: implment cards list

class ListCardsPage extends StatefulWidget {
  const ListCardsPage({Key? key}) : super(key: key);

  @override
  _ListCardsPageState createState() => _ListCardsPageState();
}

ClientDAO _clientDAO = ClientDAO();

void _getWidgetsCards() async {
  List<Widget> containers = [];

  var listClients = await _clientDAO.getAll();
  print(listClients.length());
}

class _ListCardsPageState extends State<ListCardsPage> {
  @override
  Widget build(BuildContext context) {
    _getWidgetsCards();
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista clientes'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          CardCliente(),
        ],
      )),
    );
  }
}
