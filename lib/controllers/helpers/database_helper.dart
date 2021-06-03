//TODO: implement database helper
import 'package:mysql1/mysql1.dart';

class DatabaseHelper {
  static final _host = '';
  static final _port = 0;
  static final _user = '';
  static final _databaseName = '';
  static final _passwd = '';

  //connect to mysql database
  static Future<MySqlConnection> connectDatabase() async {
    return await MySqlConnection.connect(ConnectionSettings(
        host: _host,
        port: _port,
        user: _user,
        db: _databaseName,
        password: _passwd));
  }
}
