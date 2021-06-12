import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formulario/controllers/validate.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro cliente'),
      ),
      body: SafeArea(
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
              validator: (value) => Validate.onlyString(value!),
            ),
            SizedBox(height: 20),
            CheckBoxCard(
              onPressed: (result) => print(result),
            ),
          ],
        ),
      )),
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

  InputTextFieldRegister(
      {required this.hintText,
      this.validator,
      required this.inputKeyboradType});

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
      validator: (value) => validator!(value),
    );
  }
}
