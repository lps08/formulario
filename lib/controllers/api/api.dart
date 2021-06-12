import 'package:http/http.dart' as http;

class API {
  static final String _uri = 'http://198.24.156.114';

  static Future<http.Response> post(
      {required String table,
      required String operation,
      required String json}) async {
    return await http.post(
      Uri.parse('$_uri/$table/$operation'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json,
    );
  }

  static Future<http.Response> get(
      {required String table, required String operation}) async {
    return await http
        .get(Uri.parse('$_uri/$table/$operation'), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
  }
}
