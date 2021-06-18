import 'package:flutter/material.dart';
import 'package:formulario/controllers/dao/client_dao.dart';
import 'package:formulario/models/client.dart';
import 'package:formulario/views/screens/loading_cards_screen.dart';
import 'package:formulario/views/widgets/card_cliente.dart';

class ListCardsPage extends StatefulWidget {
  final List<Client> clients;

  ListCardsPage({required this.clients});

  @override
  _ListCardsPageState createState() => _ListCardsPageState(clients: clients);
}

class _ListCardsPageState extends State<ListCardsPage> {
  List<Client> clients;
  ClientDAO _dao = ClientDAO();

  _ListCardsPageState({required this.clients});

  List<Widget> _getContainers() {
    List<Widget> containers = [];
    if (clients.isNotEmpty) {
      clients.forEach((element) {
        containers.add(CardCliente(
          client: element,
          onEditing: () => print(element.nome),
          onRemove: () async {
            String res =
                await _dao.delete(where: 'nome', whereArgs: element.nome);
            if (res == 'success') {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Usuario excluido.')));

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoadingCardsPage(),
                ),
              );
            }
          },
        ));
      });
    }
    return containers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de clientes'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: _getContainers(),
        )),
      ),
    );
  }
}
