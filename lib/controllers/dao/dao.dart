//TODO: implement abastract class
import 'package:formulario/controllers/helpers/database_helper.dart';
import 'package:formulario/models/model.dart';
import 'package:mysql1/mysql1.dart';

abstract class DAO<T extends Model> {
  late String table;

  Future<bool> insert(T) async {
    // INSERT INTO Cliente (nome, sexo, nascimento, raca, telefone, endereco, bairro, municipio) VALUES ('Cliente 1', 'masculino', '2021-06-04', 'branca', 086999948302, 'Rua meclanche', 'cria', 'Piaui');
    MySqlConnection connection = await DatabaseHelper.connectDatabase();
    String query =
        'INSERT INTO $table (${T.toMap().keys.join(',')}) VALUES (${T.toMap().values.join(',')});';

    Results res = await connection.query(query);

    if (res.insertId!.isNaN) return false;
    return true;
  }

  Future<bool> delete(
      {required String where, required dynamic whereArgs}) async {
    MySqlConnection connection = await DatabaseHelper.connectDatabase();
    String query = 'DELETE FROM $table WHERE $where = $whereArgs;';

    Results res = await connection.query(query);

    if (res.insertId!.isNaN) return false;
    return true;
  }

  Future<void> update(T) async {}

  Future<List<T>> get(int codebars);
  Future<List<T>> getAll();
}

main(List<String> args) {
  Map<String, dynamic> teste = {
    'nome': 'nome',
    'numero': 10,
  };

  String where = 'cod';
  dynamic whereArgs = '1';

  String query = 'DELETE FROM tabela WHERE $where = $whereArgs;';

  print(query);
}
