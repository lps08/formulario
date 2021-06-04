//TODO: implement abastract class
import 'package:formulario/controllers/helpers/database_helper.dart';
import 'package:formulario/models/model.dart';
import 'package:mysql1/mysql1.dart';

abstract class DAO<T extends Model> {
  late String table;

  Future<void> insert(T) async {
    // INSERT INTO Cliente (nome, sexo, nascimento, raca, telefone, endereco, bairro, municipio) VALUES ('Cliente 1', 'masculino', '2021-06-04', 'branca', 086999948302, 'Rua meclanche', 'cria', 'Piaui');
    MySqlConnection connection = await DatabaseHelper.connectDatabase();
  }

  Future<void> delete(int codebars) async {}

  Future<void> update(T) async {}

  Future<List<T>> get(int codebars);
  Future<List<T>> getAll();
}
