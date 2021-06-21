import 'package:flutter/material.dart';
import 'package:formulario/models/client.dart';

class CardCliente extends StatelessWidget {
  final Client client;
  final void Function()? onEditing;
  final void Function()? onRemove;
  final void Function() onPress;

  CardCliente(
      {required this.client,
      required this.onPress,
      this.onEditing,
      this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onPress,
        child: Card(
          elevation: 5.0,
          child: Column(
            children: [
              Row(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  onEditing != null
                      ? TextButton(
                          onPressed: onEditing,
                          child: Text('Editar'),
                        )
                      : Text(''),
                  SizedBox(
                    width: 10.0,
                  ),
                  onRemove != null
                      ? TextButton(
                          onPressed: onRemove,
                          child: Text('Excluir'),
                        )
                      : Text(''),
                ],
              )
            ],
          ),
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
