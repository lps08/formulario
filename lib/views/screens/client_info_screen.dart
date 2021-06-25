import 'package:flutter/material.dart';
import 'package:formulario/controllers/dao/client_dao.dart';
import 'package:formulario/models/client.dart';
import 'package:formulario/views/screens/update_screen.dart';

import 'loading_cards_screen.dart';

class ClientPage extends StatefulWidget {
  final Client client;

  ClientPage({required this.client});

  @override
  _ClientPageState createState() => _ClientPageState(client: client);
}

class _ClientPageState extends State<ClientPage> {
  final Client client;
  ClientDAO _dao = ClientDAO();

  _ClientPageState({required this.client});

  Future<void> _removingClientDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Atenção'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Deseja realmente excluir?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () async {
                String res =
                    await _dao.delete(where: 'nome', whereArgs: client.nome);
                if (res == 'success') {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Usuario excluido.')));

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoadingCardsPage(),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações do cliente'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: FittedBox(
                      child: Icon(Icons.account_circle_rounded),
                    ),
                  ),
                ),
                TextInfoFields(
                  title: 'Nome: ',
                  value: client.nome,
                ),
                TextInfoFields(
                  title: 'Sexo: ',
                  value: client.sexo,
                ),
                TextInfoFields(
                  title: 'Nascimento: ',
                  value: client.nascimento,
                ),
                TextInfoFields(
                  title: 'Raça: ',
                  value: client.raca!,
                ),
                TextInfoFields(
                  title: 'Telefone: ',
                  value: client.telefone,
                ),
                TextInfoFields(
                  title: 'Endereço: ',
                  value: client.endereco!,
                ),
                TextInfoFields(
                  title: 'Bairro: ',
                  value: client.bairro!,
                ),
                TextInfoFields(
                  title: 'Município: ',
                  value: client.municipio!,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text(
                          'Editar',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdatePage(client: client),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        child: Text(
                          'Remover',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: _removingClientDialog,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextInfoFields extends StatelessWidget {
  final double font = 18;
  final String title;
  final String value;

  TextInfoFields({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Colors.blue)),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: font),
            ),
            Container(
              child: Text(
                value,
                style: TextStyle(fontSize: font),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
