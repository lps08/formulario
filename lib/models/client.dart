import 'package:formulario/models/atendiamento.dart';
import 'package:formulario/models/model.dart';

class Client implements Model {
  late int? id;
  final String nome;
  final String sexo;
  final String nascimento;
  final String? raca;
  final String telefone;
  final String? cep;
  final String? localidade;
  final String? uf;
  final String? endereco;
  final String? bairro;
  final Atendimento? atendimento;

  Client({
    this.id,
    required this.nome,
    required this.sexo,
    required this.nascimento,
    this.raca,
    required this.telefone,
    this.cep,
    this.localidade,
    this.uf,
    this.endereco,
    this.bairro,
    this.atendimento, //falta esse
  });

  factory Client.fromMap(Map<String, dynamic> json) {
    if (json['id'] != null) {
      return Client(
        id: int.parse(json['id'].toString()),
        nome: json['nome'],
        sexo: json['sexo'],
        nascimento: json['nascimento'],
        raca: json['raca'],
        telefone: json['telefone'],
        cep: json['cep'],
        localidade: json['localidade'],
        uf: json['uf'],
        endereco: json['endereco'],
        bairro: json['bairro'],
      );
    } else
      return Client(
        nome: json['nome'],
        sexo: json['sexo'],
        nascimento: json['nascimento'],
        raca: json['raca'],
        telefone: json['telefone'],
        cep: json['cep'],
        localidade: json['localidade'],
        uf: json['uf'],
        endereco: json['endereco'],
        bairro: json['bairro'],
      );
  }

  @override
  Map<String, dynamic> toMap() {
    if (id == null)
      return {
        'nome': nome,
        'sexo': sexo,
        'nascimento': nascimento,
        'raca': raca,
        'telefone': telefone,
        'cep': cep,
        'localidade': localidade,
        'uf': uf,
        'endereco': endereco,
        'bairro': bairro,
      };
    else
      return {
        'id': id,
        'nome': nome,
        'sexo': sexo,
        'nascimento': nascimento,
        'raca': raca,
        'telefone': telefone,
        'cep': cep,
        'localidade': localidade,
        'uf': uf,
        'endereco': endereco,
        'bairro': bairro,
      };
  }
}
