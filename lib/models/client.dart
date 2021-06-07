import 'package:formulario/models/model.dart';

class Client implements Model {
  late int? id;
  final String nome;
  final String sexo;
  final String nascimento;
  final String? raca;
  final String telefone;
  final String? endereco;
  final String? bairro;
  final String? municipio;

  Client({
    this.id,
    required this.nome,
    required this.sexo,
    required this.nascimento,
    this.raca,
    required this.telefone,
    this.endereco,
    this.bairro,
    this.municipio,
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
