import 'package:flutter/material.dart';
import 'package:formulario/models/client.dart';
import 'package:formulario/views/screens/client_screen.dart';
import 'package:formulario/views/widgets/card_cliente.dart';

class CustomSearchDelegate extends SearchDelegate {
  final List<Client> clients;
  final context;

  CustomSearchDelegate({required this.clients, required this.context});

  List<Client> _getResultQuery() {
    List<Client> result = [];

    clients.forEach((cli) {
      if (cli.nome.contains(query)) result.add(cli);
    });
    return result;
  }

  List<Widget> _getContainersResults() {
    List<CardCliente> resultCards = [];

    _getResultQuery().forEach((cli) {
      resultCards.add(CardCliente(
        onPress: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClientPage(client: cli),
            )),
        client: cli,
      ));
    });

    return resultCards;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: _getContainersResults(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty)
      return Column(
        children: _getContainersResults(),
      );
    return Column();
  }
}
