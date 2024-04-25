import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables/tables.dart';

part 'drift_db.g.dart';

@DriftDatabase(tables: [DbEmployees, DbCategories, DbServices])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override

  // Employees
  Future insertNewEmployee(DbEmployee employee) =>
      into(dbEmployees).insert(employee);

  Stream<List<DbEmployee>> getAllEmployees() => select(dbEmployees).watch();

  // Categories
  Future insertNewCategory(DbCategory category) =>
      into(dbCategories).insert(category);

  Future<int> insertNewCompanionCategory(String name) async {
    final id = await into(dbCategories)
        .insert(DbCategoriesCompanion.insert(name: Value(name)));
    return id;
  }

  Future<int> getCategoryId(String name) async {
    final category = await (select(dbCategories)
          ..where((tbl) => tbl.name.equals(name)))
        .getSingle();
    return category.id;
  }

  Stream<List<DbCategory>> getAllCategories() => select(dbCategories).watch();

  // Services
  Future insertNewService(DbService service) =>
      into(dbServices).insert(service);

  Future<int> insertNewCompanionService(
      String name, double price, int categoryId) async {
    final id = await into(dbServices).insert(DbServicesCompanion.insert(
        name: Value(name), price: Value(price), categoryId: categoryId));
    return id;
  }

  Stream<List<DbService>> getAllServices() => select(dbServices).watch();

  Stream<List<DbService>> getServicesByCategory(int i) {
    return (select(dbServices)..where((tbl) => tbl.categoryId.equals(i)))
        .watch();
  }
}

LazyDatabase _openConnection() {
  log('_openConnection()');
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'ventigo.sqlite'));

    return NativeDatabase.createInBackground(file, logStatements: true);
  });
}
