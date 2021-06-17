import 'package:flutter/material.dart';
import 'package:formulario/models/client.dart';

class CardCliente extends StatelessWidget {
  final Client client;

  CardCliente({required this.client});

  //TODO: create delete, edit buttom
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5.0,
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              child: FittedBox(
                child: Icon(Icons.account_box),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCardTitle(title: 'Nome: ', name: client.nome),
                TextCardTitle(
                    title: 'Nascimento: ',
                    name: client.nascimento.split(' ')[0])
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TextCardTitle extends StatelessWidget {
  final String title;
  final String name;

  TextCardTitle({required this.title, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(name)
      ],
    );
  }
}
