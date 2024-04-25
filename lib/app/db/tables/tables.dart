import 'package:drift/drift.dart';

class DbEmployees extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get lastName => text().nullable()();
  TextColumn get login => text().nullable()();
  TextColumn get password => text().nullable()();
  RealColumn get percentage => real().nullable()();
}

class DbCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn? get description => text().nullable()();
}

class DbServices extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer().references(DbCategories, #id)();
  TextColumn get name => text().nullable()();
  RealColumn get price => real().nullable()();
}
