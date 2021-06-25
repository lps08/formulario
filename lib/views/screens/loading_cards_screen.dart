import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:formulario/controllers/dao/client_dao.dart';
import 'package:formulario/models/client.dart';
import 'package:formulario/views/screens/list_cards_screen.dart';

class LoadingCardsPage extends StatefulWidget {
  const LoadingCardsPage({Key? key}) : super(key: key);

  @override
  _LoadingCardsPageState createState() => _LoadingCardsPageState();
}

class _LoadingCardsPageState extends State<LoadingCardsPage> {
  List<Client> _clients = [];
  ClientDAO _dao = ClientDAO();

  void _getClienteList() async {
    try {
      var clientList = await _dao.getAll();
      clientList.forEach((element) {
        _clients.add(Client.fromMap(element));
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ListCardsPage(
            clients: _clients,
          ),
        ),
      );
    } catch (e) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                      'Não foi possível buscar registro no banco de dados. Verifique sua conexão com a internet.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _getClienteList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitRipple(
        color: Theme.of(context).accentColor,
        size: 300.0,
      ),
    );
  }
}
