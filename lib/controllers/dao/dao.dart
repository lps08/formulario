import 'package:formulario/controllers/helpers/database_helper.dart';
import 'package:formulario/models/model.dart';
import 'package:mysql1/mysql1.dart';

abstract class DAO<T extends Model> {
  late String table;

  Future<bool> insert(T) async {
    // INSERT INTO Cliente (nome, sexo, nascimento, raca, telefone, endereco, bairro, municipio) VALUES ('Cliente 1', 'masculino', '2021-06-04', 'branca', 086999948302, 'Rua meclanche', 'cria', 'Piaui');
    MySqlConnection connection = await DatabaseHelper.connectDatabase();
    //TODO: fix the values to list to use (?, [])
    String query =
        'INSERT INTO $table (${T.toMap().keys.join(',')}) VALUES (${T.toMap().values.join(',')});';

    Results res = await connection.query(query);

    return _queryResult(res);
  }

  Future<bool> delete(
      {required String where, required dynamic whereArgs}) async {
    MySqlConnection connection = await DatabaseHelper.connectDatabase();
    String query = 'DELETE FROM $table WHERE $where = $whereArgs;';

    Results res = await connection.query(query);

    return _queryResult(res);
  }

  Future<bool> update(T) async {
    MySqlConnection connection = await DatabaseHelper.connectDatabase();
    String query =
        'UPDATE tabela SET ${T.toMap().toString().substring(1, T.toMap().toString().length - 1).replaceAll(':', '=')} WHERE id = T.id;';

    Results res = await connection.query(query);

    return _queryResult(res);
  }

  Future<List<T>> get(String value);
  Future<List<T>> getAll();

  List<String> _preprocessValues(List<String> inputValues) {
    print(inputValues);
    List<String> values = [];
    inputValues.forEach((value) {
      if (value is String)
        values.add("'$value'");
      else
        values.add(value);
    });
    return values;
  }

  bool _queryResult(Results res) {
    if (res.insertId!.isNaN) return false;
    return true;
  }
}
