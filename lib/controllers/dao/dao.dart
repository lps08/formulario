import 'dart:convert';
import 'package:formulario/controllers/helpers/api.dart';
import 'package:formulario/models/model.dart';
import 'package:http/http.dart' as http;

abstract class DAO<T extends Model> {
  late String table;

  Future<int> insert(T) async {
    http.Response res = await API.post(
      table: table,
      operation: 'insert',
      json: T.toMap(),
    );
    return res.statusCode;
  }

  Future<int> delete(
      {required String where, required dynamic whereArgs}) async {
    http.Response res = await API.post(
      table: table,
      operation: 'delete',
      json: json.encode(<String, String>{
        "where": where,
        "whereArgs": whereArgs,
      }),
    );
    return res.statusCode;
  }

  Future<int> update(T) async {
    http.Response res = await API.post(
      table: table,
      operation: 'update',
      json: T.toMap(),
    );
    return res.statusCode;
  }

  Future<dynamic> get(
      {required String where, required dynamic whereArgs}) async {
    http.Response res = await API.post(
        table: table,
        operation: 'get',
        json: json.encode(<String, String>{
          "where": where,
          "whereArgs": whereArgs,
        }));
    if (res.statusCode == 201) {
      return jsonDecode(res.body);
    } else {
      throw Exception('Failed to get data.');
    }
  }

  Future<dynamic> getAll() async {
    http.Response res = await API.get(
      table: table,
      operation: 'getAll',
    );
    return res.statusCode;
  }
}
