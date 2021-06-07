import 'package:formulario/controllers/dao/dao.dart';
import 'package:formulario/controllers/helpers/database_helper.dart';
import 'package:formulario/models/client.dart';
import 'package:mysql1/mysql1.dart';

class ClientDAO extends DAO<Client> {
  @override
  String table = 'Cliente';

  @override
  Future<List<Client>> get(String value) async {
    // get db connection
    MySqlConnection connection = await DatabaseHelper.connectDatabase();
    // query to mysql database
    String query = "SELECT * FROM $table WHERE nome = '$value'";
    // return clients list
    List<Client> clients = [];

    Results res = await connection.query(query);

    res.forEach((element) {
      clients.add(Client.fromMap(element.fields));
    });

    return clients;
  }

  @override
  Future<List<Client>> getAll() async {
    // get db connection
    MySqlConnection connection = await DatabaseHelper.connectDatabase();
    // query to mysql db
    String query = 'SELECT * FROM $table';
    // return clients list
    List<Client> clients = [];

    Results res = await connection.query(query);

    res.forEach((element) {
      clients.add(Client.fromMap(element.fields));
    });

    return clients;
  }
}
