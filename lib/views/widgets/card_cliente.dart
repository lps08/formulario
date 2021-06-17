import 'package:flutter/material.dart';

class CardCliente extends StatelessWidget {
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
              children: [
                TextCardTitle(title: 'Nome: ', name: 'Nome do Usuario'),
                TextCardTitle(title: 'Nascimento: ', name: 'nascimento')
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
