import 'package:formulario/models/model.dart';

class Atendimento implements Model {
  late int? id;
  final int idClient;
  final String entrada;
  final String motivo;
  final String fila;
  final String queixa;

  Atendimento({
    this.id,
    required this.idClient,
    required this.entrada,
    required this.motivo,
    required this.fila,
    required this.queixa,
  });

  factory Atendimento.fromMap(Map<String, dynamic> json) => Atendimento(
        id: json['id'],
        idClient: json['id_cliente'],
        entrada: json['entrada'],
        motivo: json['motivo'],
        fila: json['fila'],
        queixa: json['queixa'],
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "id_cliente": idClient,
        "entrada": entrada,
        "motivo": motivo,
        "fila": fila,
        "queixa": queixa,
      };
}
