import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:formulario/controllers/dao/client_dao.dart';
import 'package:formulario/controllers/validate.dart';
import 'package:formulario/models/client.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Map<String, dynamic>? cliente = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro cliente'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
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
                      validator: (value) => Validate.onlyString(value!),
                      onEditing: (value) => cliente!['nome'] = value,
                    ),
                    SizedBox(height: 20),
                    CheckBoxCard(
                      onPressed: (result) =>
                          cliente!['sexo'] = result.toLowerCase(),
                    ),
                    SizedBox(height: 20),
                    InputDateRegister(
                      hintText: 'Data de nascimento',
                      dateSelected: (date) => cliente!['nascimento'] =
                          date.toUtc().toString().split(' ')[0],
                    ),
                    SizedBox(height: 20),
                    InputTextFieldRegister(
                      hintText: 'Raça',
                      inputKeyboradType: TextInputType.name,
                      validator: (value) => Validate.onlyString(value!),
                      onEditing: (value) => cliente!['raca'] = value,
                    ),
                    SizedBox(height: 20),
                    InputTextFieldRegister(
                      hintText: 'Telefone',
                      inputKeyboradType: TextInputType.phone,
                      validator: (value) => Validate.onlyNumber(value!),
                      onEditing: (value) => cliente!['telefone'] = value,
                    ),
                    SizedBox(height: 20),
                    InputTextFieldRegister(
                      hintText: 'Endereço',
                      inputKeyboradType: TextInputType.streetAddress,
                      validator: (value) => Validate.onlyString(value!),
                      onEditing: (value) => cliente!['endereco'] = value,
                    ),
                    SizedBox(height: 20),
                    InputTextFieldRegister(
                      hintText: 'Bairro',
                      inputKeyboradType: TextInputType.name,
                      validator: (value) => Validate.onlyString(value!),
                      onEditing: (value) => cliente!['bairro'] = value,
                    ),
                    SizedBox(height: 20),
                    InputTextFieldRegister(
                      hintText: 'Município',
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
              ElevatedButton(
                child: Text('Confirmar'),
                onPressed: () async {
                  Client clinet = Client.fromMap(cliente!);
                  print(clinet.toMap());
                  ClientDAO clientDAO = ClientDAO();
                  String res = await clientDAO.insert(clinet);

                  if (res == 'success')
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Usuario adicionado')));
                  else
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Erro!')));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckBoxCard extends StatefulWidget {
  final void Function(String result)? onPressed;

  CheckBoxCard({this.onPressed});

  @override
  _CheckBoxCardState createState() => _CheckBoxCardState(onPressed: onPressed);
}

class _CheckBoxCardState extends State<CheckBoxCard> {
  bool? _checkedFem = false;
  bool? _checkedMasc = false;
  bool? _checkedOutro = false;
  void Function(String result)? onPressed;

  _CheckBoxCardState({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: _checkedMasc! ? Colors.blue : Colors.grey,
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
                      value: _checkedMasc!,
                      onChanged: (value) {
                        setState(() {
                          _checkedMasc = value;
                          if (value == true) {
                            onPressed!('Masculino');
                            _checkedFem = false;
                            _checkedOutro = false;
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
              color: _checkedFem! ? Colors.blue : Colors.grey,
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
                      value: _checkedFem!,
                      onChanged: (value) {
                        setState(() {
                          _checkedFem = value;
                          if (value == true) {
                            onPressed!('Feminino');
                            _checkedMasc = false;
                            _checkedOutro = false;
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
              color: _checkedOutro! ? Colors.blue : Colors.grey,
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
                      value: _checkedOutro!,
                      onChanged: (value) {
                        setState(() {
                          _checkedOutro = value;
                          if (value == true) {
                            onPressed!('Outro');
                            _checkedFem = false;
                            _checkedMasc = false;
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

  InputTextFieldRegister({
    required this.hintText,
    this.validator,
    required this.inputKeyboradType,
    this.onEditing,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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

  InputDateRegister({required this.hintText, this.dateSelected});
  @override
  _InputDateRegisterState createState() =>
      _InputDateRegisterState(hintText: hintText, dateSelected: dateSelected);
}

class _InputDateRegisterState extends State<InputDateRegister> {
  final String hintText;
  final void Function(DateTime date)? dateSelected;
  TextEditingController _controller = TextEditingController();

  _InputDateRegisterState({required this.hintText, this.dateSelected});

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
            _controller.text = '${time.day}/${time.month}/${time.year}';
          },
        );
      },
      controller: _controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
      ),
    );
  }
}
