import 'package:drift/drift.dart';

class DbEmployees extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get lastName => text().nullable()();
  TextColumn get login => text().nullable()();
  TextColumn get password => text().nullable()();
  RealColumn get percentage => real().nullable()();
  TextColumn get categories => text().map(const StringListConverter())();
  TextColumn get visibility => text().map(const StringListConverter())();
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

// write class that converts List of Strings to String
// and vice versa
class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();
  @override
  List<String> fromSql(String fromDb) {
    return fromDb.split(',');
  }

  @override
  String toSql(List<String> value) {
    return value.join(',');
  }
}