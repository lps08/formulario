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
    var clientList = await _dao.getAll();
    if (clientList.isNotEmpty) {
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
