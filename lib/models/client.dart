import 'package:formulario/models/model.dart';

class Client implements Model {
  final int id;
  final String nome;
  final String sexo;
  final String nascimento;
  final String raca;
  final String telefone;
  final String endereco;
  final String bairro;
  final String municipio;

  Client({
    required this.id,
    required this.nome,
    required this.sexo,
    required this.nascimento,
    required this.raca,
    required this.telefone,
    required this.endereco,
    required this.bairro,
    required this.municipio,
  });

  factory Client.fromMap(Map<String, dynamic> json) => Client(
        id: json['id'],
        nome: json['nome'],
        sexo: json['sexo'],
        nascimento: json['nascimento'],
        raca: json['raca'],
        telefone: json['telefone'],
        endereco: json['endereco'],
        bairro: json['bairro'],
        municipio: json['municipio'],
      );

  @override
  Map<String, dynamic> toMap() => {
        'id': id,
        'nome': nome,
        'sexo': sexo,
        'nascimento': nascimento,
        'raca': raca,
        'telefone': telefone,
        'endereco': endereco,
        'bairro': bairro,
        'municipio': municipio,
      };
}
