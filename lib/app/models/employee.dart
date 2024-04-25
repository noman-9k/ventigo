import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/config/app_enums.dart';

import '../db/drift_db.dart';

class Employee {
  String name;
  String lastName;
  String? login;
  String? password;
  List<DbCategory>? categories;
  double? percentage;
  List<VisibilityFilter>? visibility;

  Employee({
    required this.name,
    required this.lastName,
    this.login,
    this.password,
    this.categories,
    this.percentage,
    this.visibility,
  });
}
