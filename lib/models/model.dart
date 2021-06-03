// Abstract class for each model
abstract class Model {
  Model.fromMap(Map<String, dynamic> json);
  Map<String, dynamic> toMap();
}
