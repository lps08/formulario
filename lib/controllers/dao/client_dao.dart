import 'package:formulario/controllers/dao/dao.dart';
import 'package:formulario/models/client.dart';

class ClientDAO extends DAO<Client> {
  @override
  String table = 'cliente';
}
