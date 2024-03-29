import 'dart:convert';
import 'package:formulario/controllers/api/api.dart';
import 'package:formulario/models/model.dart';
import 'package:http/http.dart' as http;

abstract class DAO<T extends Model> {
  late String table;

  Future<String> insert(T) async {
    http.Response res = await API.post(
      table: table,
      operation: 'insert',
      json: json.encode(T.toMap()),
    );
    return res.body;
  }

  Future<String> delete(
      {required String where, required dynamic whereArgs}) async {
    http.Response res = await API.post(
      table: table,
      operation: 'delete',
      json: json.encode(<String, String>{
        "where": where,
        "whereArgs": whereArgs,
      }),
    );
    return res.body;
  }

  Future<String> update(T) async {
    http.Response res = await API.post(
      table: table,
      operation: 'update',
      json: json.encode(T.toMap()),
    );
    return res.body;
  }

  Future<List<dynamic>> get(
      {required String where, required dynamic whereArgs}) async {
    http.Response res = await API.post(
        table: table,
        operation: 'get',
        json: json.encode(<String, String>{
          "where": where,
          "whereArgs": whereArgs,
        }));
    if (res.statusCode == 201) {
      return json.decode(res.body);
    } else {
      throw Exception('Failed to get data.');
    }
  }

  Future<List<dynamic>> getAll() async {
    http.Response res = await API.get(
      table: table,
      operation: 'getAll',
    );

    if (res.statusCode == 200) {
      return json.decode(res.body);
    } else {
      throw Exception('Failed to get data.');
    }
  }
}
