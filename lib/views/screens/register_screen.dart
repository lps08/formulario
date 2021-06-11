import 'package:flutter/material.dart';

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
              hintText: 'Nome',
              validator: (value) {
                if (value!.contains(RegExp(r'[0-9]'))) {
                  return 'Valores numéricos não são permitidos';
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            GenderSelect(),
          ],
        ),
      )),
    );
  }
}

class GenderSelect extends StatefulWidget {
  @override
  _GenderSelectState createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  bool? masc = false;
  bool? fem = false;
  bool? outro = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Genero'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CheckBoxCard(
                title: 'Masculino',
                checked: masc!,
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      masc = value;
                      fem = false;
                      outro = false;
                    }
                  });
                },
              ),
              CheckBoxCard(
                title: 'Feminino',
                checked: fem!,
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      fem = value;
                      masc = false;
                      outro = false;
                    }
                  });
                },
              ),
              CheckBoxCard(
                title: 'Outro',
                checked: outro!,
                onChanged: (value) {
                  setState(() {
                    if (value == true) {
                      outro = value;
                      fem = false;
                      masc = false;
                    }
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CheckBoxCard extends StatefulWidget {
  final String title;
  final bool checked;
  final String? Function(bool? value)? onChanged;
  CheckBoxCard({required this.title, required this.checked, this.onChanged});

  @override
  _CheckBoxCardState createState() =>
      _CheckBoxCardState(title: title, checked: checked, onChanged: onChanged);
}

class _CheckBoxCardState extends State<CheckBoxCard> {
  final String title;
  final String? Function(bool? value)? onChanged;
  bool? checked;

  _CheckBoxCardState(
      {required this.title, required this.checked, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: checked! ? Colors.blue : Colors.grey,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 18.0, 8.0),
        child: Row(
          children: [
            Checkbox(
              value: checked,
              onChanged: (value) => onChanged!(value),
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class InputTextFieldRegister extends StatelessWidget {
  final String hintText;
  final String? Function(String? value)? validator;

  InputTextFieldRegister({required this.hintText, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
