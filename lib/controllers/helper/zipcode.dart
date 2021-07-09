import 'dart:convert';
import 'package:http/http.dart' as http;

class ZipCode {
  static Future<Map<String, dynamic>> getLocate(int cep) async {
    var res = await http.get(
      Uri.parse('https://viacep.com.br/ws/$cep/json/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return jsonDecode(res.body);
  }
}
