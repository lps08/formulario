import 'package:flutter/material.dart';
import 'package:formulario/controllers/delegate/custom_search_delegate.dart';
import 'package:formulario/models/client.dart';
import 'package:formulario/views/screens/client_info_screen.dart';
import 'package:formulario/views/screens/register_screen.dart';
import 'package:formulario/views/widgets/card_cliente.dart';

class ListCardsPage extends StatefulWidget {
  final List<Client> clients;

  ListCardsPage({required this.clients});

  @override
  _ListCardsPageState createState() => _ListCardsPageState(clients: clients);
}

class _ListCardsPageState extends State<ListCardsPage> {
  List<Client> clients;

  _ListCardsPageState({required this.clients});

  Column _getContainers() {
    List<Widget> containers = [];
    if (clients.isNotEmpty) {
      clients.forEach((element) {
        containers.add(CardCliente(
          onPress: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ClientPage(
                  client: element,
                ),
              )),
          client: element,
        ));
      });

      return Column(
        children: containers,
      );
    } else
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(child: Text('Nenhum registro encontrado.')),
          )
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 5.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 26,
                    color: Theme.of(context).accentIconTheme.color,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Adicionar paciente',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Lista de pacientes'),
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate:
                      CustomSearchDelegate(clients: clients, context: context));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: _getContainers(),
      ),
    );
  }
}
