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

  // Employees
  Future insertNewEmployee(DbEmployee employee) =>
      into(dbEmployees).insert(employee);

  Future updateEmployee(DbEmployee employee) =>
      update(dbEmployees).replace(employee);

  Future<int> insertNewCompanionEmployee(String name, String lastName,
      String login, String password, double percentage,
      {List<String>? categories, List<String>? visibility}) async {
    final id = await into(dbEmployees).insert(DbEmployeesCompanion.insert(
        name: Value(name),
        lastName: Value(lastName),
        login: Value(login),
        password: Value(password),
        percentage: Value(percentage),
        categories: categories ?? [],
        visibility: visibility ?? []));

    return id;
  }

  Stream<List<DbEmployee>> getAllEmployees() => select(dbEmployees).watch();
  Future<List<DbEmployee>> getAllEmployeesList() => select(dbEmployees).get();

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
  Future<List<DbCategory>?> getCategoriesByIDs(List<String> categories) async {
    final ids = categories.map((e) => int.parse(e)).toList();
    final categoriesList =
        await (select(dbCategories)..where((tbl) => tbl.id.isIn(ids))).get();
    return categoriesList;
  }

  Future<List<DbCategory>> getCategoriesAsList() => select(dbCategories).get();

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
