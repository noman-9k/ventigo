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

class DbDataItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get phone => text().nullable()();
  IntColumn get employeeId => integer().references(DbEmployees, #id)();
  TextColumn get employeeName => text().nullable()();
  IntColumn get categoryId => integer().references(DbCategories, #id)();
  TextColumn get categoryName => text().nullable()();
  IntColumn get serviceId => integer().references(DbServices, #id)();
  TextColumn get serviceName => text().nullable()();
  BoolColumn get newCustomer => boolean().nullable()();
  BoolColumn get regCustomer => boolean().nullable()();
  DateTimeColumn get date => dateTime().nullable()();
  BoolColumn get cardPay => boolean().nullable()();
  RealColumn get price => real().nullable()();
  RealColumn get total => real().nullable()();
  RealColumn get percentage => real().nullable()();
  TextColumn get notes => text().nullable()();
}

class DbCosts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  BoolColumn get isDeductFromTax => boolean().nullable()();
  BoolColumn get isSystematic => boolean().nullable()();
  TextColumn get repetitionInterval => text().nullable()();
  IntColumn get numberOfUnits => integer().nullable()();
  RealColumn get price => real().nullable()();
  TextColumn get unitsOfMeasurement => text().nullable()();
  TextColumn get categories => text().map(const StringListConverter())();
  DateTimeColumn get date => dateTime().nullable()();
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
