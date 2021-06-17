import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:formulario/controllers/dao/client_dao.dart';
import 'package:formulario/models/client.dart';
import 'package:formulario/views/screens/list_cards_screen.dart';
import 'package:formulario/views/widgets/card_cliente.dart';

class LoadingCardsPage extends StatefulWidget {
  const LoadingCardsPage({Key? key}) : super(key: key);

  @override
  _LoadingCardsPageState createState() => _LoadingCardsPageState();
}

class _LoadingCardsPageState extends State<LoadingCardsPage> {
  List<Widget> _clientsCards = [];
  ClientDAO _dao = ClientDAO();

  void _getClienteList() async {
    var clientList = await _dao.getAll();
    if (clientList.isNotEmpty) {
      clientList.forEach((element) {
        _clientsCards.add(CardCliente(client: Client.fromMap(element)));
      });

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ListCardsPage(containers: _clientsCards),
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
      body: SpinKitRotatingCircle(
        color: Colors.black,
        size: 150.0,
      ),
    );
  }
}
