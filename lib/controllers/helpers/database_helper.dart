import 'package:mysql1/mysql1.dart';

class DatabaseHelper {
  static final _host = 'bddados.amsolution.net.br';
  static final _port = 10001;
  static final _user = 'app';
  static final _databaseName = 'form_med';
  static final _passwd = 'apppr@8308';

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

main(List<String> args) async {
  DatabaseHelper.connectDatabase().then((value) => print('foi'));
}
