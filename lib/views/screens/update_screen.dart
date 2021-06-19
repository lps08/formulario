import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:formulario/controllers/dao/client_dao.dart';
import 'package:formulario/controllers/validate.dart';
import 'package:formulario/models/client.dart';
import 'package:formulario/views/screens/loading_cards_screen.dart';

class UpdatePage extends StatefulWidget {
  final Client client;

  UpdatePage({required this.client});

  @override
  _UpdatePageState createState() => _UpdatePageState(client: client);
}

class _UpdatePageState extends State<UpdatePage> {
  final Client client;
  Map<String, dynamic>? cliente = {};

  _UpdatePageState({required this.client}) {
    this.cliente = {
      'id': client.id,
      'nome': client.nome,
      'sexo': client.sexo,
      'nascimento': client.nascimento,
      'raca': client.raca,
      'telefone': client.telefone,
      'endereco': client.endereco,
      'bairro': client.bairro,
      'municipio': client.municipio,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atualizar cliente'),
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
                InputTextFieldRegister(
                  inputKeyboradType: TextInputType.name,
                  hintText: 'Nome',
                  controller: TextEditingController(text: client.nome),
                  validator: (value) => Validate.onlyString(value!),
                  onEditing: (value) => cliente!['nome'] = value,
                ),
                SizedBox(height: 20),
                CheckBoxCard(
                  checkedFem:
                      client.sexo.toLowerCase() == 'feminino' ? true : false,
                  checkedMasc:
                      client.sexo.toLowerCase() == 'masculino' ? true : false,
                  checkedOutro:
                      client.sexo.toLowerCase() == 'outro' ? true : false,
                  onPressed: (result) {
                    print('result $result');
                    cliente!['sexo'] = result.toLowerCase();
                  },
                ),
                SizedBox(height: 20),
                InputDateRegister(
                  hintText: 'Data de nascimento',
                  controller: TextEditingController(
                      text:
                          "${DateTime.parse(client.nascimento).day}/${DateTime.parse(client.nascimento).month}/${DateTime.parse(client.nascimento).year}"),
                  dateSelected: (date) => cliente!['nascimento'] =
                      date.toUtc().toString().split(' ')[0],
                ),
                SizedBox(height: 20),
                InputTextFieldRegister(
                  hintText: 'Raça',
                  controller: TextEditingController(text: client.raca),
                  inputKeyboradType: TextInputType.name,
                  validator: (value) => Validate.onlyString(value!),
                  onEditing: (value) => cliente!['raca'] = value,
                ),
                SizedBox(height: 20),
                InputTextFieldRegister(
                  hintText: 'Telefone',
                  controller: TextEditingController(text: client.telefone),
                  inputKeyboradType: TextInputType.phone,
                  validator: (value) => Validate.onlyNumber(value!),
                  onEditing: (value) => cliente!['telefone'] = value,
                ),
                SizedBox(height: 20),
                InputTextFieldRegister(
                  hintText: 'Endereço',
                  controller: TextEditingController(text: client.endereco),
                  inputKeyboradType: TextInputType.streetAddress,
                  validator: (value) => Validate.onlyString(value!),
                  onEditing: (value) => cliente!['endereco'] = value,
                ),
                SizedBox(height: 20),
                InputTextFieldRegister(
                  hintText: 'Bairro',
                  controller: TextEditingController(text: client.bairro),
                  inputKeyboradType: TextInputType.name,
                  validator: (value) => Validate.onlyString(value!),
                  onEditing: (value) => cliente!['bairro'] = value,
                ),
                SizedBox(height: 20),
                InputTextFieldRegister(
                  hintText: 'Município',
                  controller: TextEditingController(text: client.municipio),
                  inputKeyboradType: TextInputType.name,
                  validator: (value) => Validate.onlyString(value!),
                  onEditing: (value) => cliente!['municipio'] = value,
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ButtonConfirmarBottom(cliente: cliente),
    );
  }
}

class ButtonConfirmarBottom extends StatelessWidget {
  ButtonConfirmarBottom({required this.cliente});

  final Map<String, dynamic>? cliente;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Client clinet = Client.fromMap(cliente!);
        ClientDAO clientDAO = ClientDAO();
        String res = await clientDAO.update(clinet);

        if (res == 'success')
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Usuario atualizado')));
        else
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Erro!')));

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoadingCardsPage(),
            ));
      },
      child: Container(
        width: double.infinity,
        color: Theme.of(context).primaryColor,
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Atualizar',
              style: TextStyle(
                  color: Theme.of(context).accentTextTheme.bodyText1!.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckBoxCard extends StatefulWidget {
  final void Function(String result)? onPressed;
  final bool? checkedFem;
  final bool? checkedMasc;
  final bool? checkedOutro;

  CheckBoxCard(
      {this.onPressed, this.checkedFem, this.checkedOutro, this.checkedMasc});

  @override
  _CheckBoxCardState createState() => _CheckBoxCardState(
      onPressed: onPressed,
      checkedFem: checkedFem,
      checkedMasc: checkedMasc,
      checkedOutro: checkedOutro);
}

class _CheckBoxCardState extends State<CheckBoxCard> {
  bool? checkedFem = false;
  bool? checkedMasc = false;
  bool? checkedOutro = false;
  void Function(String result)? onPressed;

  _CheckBoxCardState(
      {this.onPressed, this.checkedFem, this.checkedMasc, this.checkedOutro});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: checkedMasc! ? Colors.blue : Colors.grey,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 18.0, 8.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: checkedMasc!,
                      onChanged: (value) {
                        setState(() {
                          checkedMasc = value;
                          if (value == true) {
                            onPressed!('Masculino');
                            checkedFem = false;
                            checkedOutro = false;
                          }
                        });
                      },
                    ),
                    Text(
                      'Masculino',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: checkedFem! ? Colors.blue : Colors.grey,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 18.0, 8.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: checkedFem!,
                      onChanged: (value) {
                        setState(() {
                          checkedFem = value;
                          if (value == true) {
                            onPressed!('Feminino');
                            checkedMasc = false;
                            checkedOutro = false;
                          }
                        });
                      },
                    ),
                    Text(
                      'Feminino',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: checkedOutro! ? Colors.blue : Colors.grey,
              width: 1.5,
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 18.0, 8.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: checkedOutro!,
                      onChanged: (value) {
                        setState(() {
                          checkedOutro = value;
                          if (value == true) {
                            onPressed!('Outro');
                            checkedFem = false;
                            checkedMasc = false;
                          }
                        });
                      },
                    ),
                    Text(
                      'Outro',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class InputTextFieldRegister extends StatelessWidget {
  final String hintText;
  final String? Function(String? value)? validator;
  final TextInputType inputKeyboradType;
  final void Function(dynamic value)? onEditing;
  final TextEditingController? controller;

  InputTextFieldRegister({
    required this.hintText,
    this.validator,
    required this.inputKeyboradType,
    this.onEditing,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: inputKeyboradType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) => onEditing!(value),
      validator: (value) => validator!(value),
    );
  }
}

class InputDateRegister extends StatefulWidget {
  final String hintText;
  final void Function(DateTime date)? dateSelected;
  final TextEditingController? controller;

  InputDateRegister(
      {required this.hintText, this.dateSelected, this.controller});
  @override
  _InputDateRegisterState createState() => _InputDateRegisterState(
      hintText: hintText, dateSelected: dateSelected, controller: controller);
}

class _InputDateRegisterState extends State<InputDateRegister> {
  final String hintText;
  final void Function(DateTime date)? dateSelected;
  TextEditingController? controller;

  _InputDateRegisterState(
      {required this.hintText, this.dateSelected, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: () {
        DatePicker.showDatePicker(
          context,
          locale: LocaleType.pt,
          onConfirm: (time) {
            dateSelected!(time);
            controller!.text = '${time.day}/${time.month}/${time.year}';
          },
        );
      },
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
      ),
    );
  }
}
