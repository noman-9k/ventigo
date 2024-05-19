import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../modules/filters/db_filter/user_data_filter.dart';
import 'tables/tables.dart';

part 'drift_db.g.dart';

@DriftDatabase(
    tables: [DbEmployees, DbCategories, DbServices, DbDataItems, DbCosts])
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
  Future<List<DbCategory>> getAllCategoriesF() => select(dbCategories).get();

  Future<List<DbCategory>?> getCategoriesByIDs(List<String> categories) async {
    final ids = categories.map((e) => int.parse(e)).toList();
    final categoriesList =
        await (select(dbCategories)..where((tbl) => tbl.id.isIn(ids))).get();
    return categoriesList;
  }

  Future<List<DbCategory>> getCategoriesAsList() => select(dbCategories).get();

  Future<void> updateCategory(DbCategory category) {
    return update(dbCategories).replace(category);
  }

  void deleteCategory(int id) {
    (delete(dbCategories)..where((tbl) => tbl.id.equals(id))).go();
    (delete(dbServices)..where((tbl) => tbl.categoryId.equals(id))).go();
  }

  // Services
  Future insertNewService(DbService service) =>
      into(dbServices).insert(service);

  Future<int> insertNewCompanionService(
      String name, double price, int categoryId) async {
    final id = await into(dbServices).insert(DbServicesCompanion.insert(
        name: Value(name), price: Value(price), categoryId: categoryId));
    return id;
  }

  Future<void> updateService(DbService service) {
    return update(dbServices).replace(service);
  }

  void deleteService(int id) {
    (delete(dbServices)..where((tbl) => tbl.id.equals(id))).go();
  }

  Stream<List<DbService>> getAllServices() => select(dbServices).watch();
  Future<List<DbService>> getAllServicesF() => select(dbServices).get();

  Stream<List<DbService>> getServicesByCategory(int i) =>
      (select(dbServices)..where((tbl) => tbl.categoryId.equals(i))).watch();
  Future<List<DbService>> getServicesByCategoryId(int i) =>
      (select(dbServices)..where((tbl) => tbl.categoryId.equals(i))).get();

  Future<DbEmployee?> getEmployeeByLoginPassword(
      String login, String password) async {
    final employee = await (select(dbEmployees)
          ..where(
              (tbl) => tbl.login.equals(login) & tbl.password.equals(password)))
        .getSingleOrNull();
    return employee;
  }

  // DataItems

  Future insertNewDataItem(DbDataItem dataItem) =>
      into(dbDataItems).insert(dataItem);

  Future<int> insertNewCompanionDataItem(
      String name,
      String phone,
      int employeeId,
      String employeeName,
      int categoryId,
      String categoryName,
      int serviceId,
      String serviceName,
      bool newCustomer,
      bool regCustomer,
      DateTime date,
      bool cardPay,
      double price,
      double total,
      double percentage) async {
    final id = await into(dbDataItems).insert(DbDataItemsCompanion.insert(
      name: Value(name),
      phone: Value(phone),
      employeeId: employeeId,
      employeeName: Value(employeeName),
      categoryId: categoryId,
      categoryName: Value(categoryName),
      serviceId: serviceId,
      serviceName: Value(serviceName),
      newCustomer: Value(newCustomer),
      regCustomer: Value(regCustomer),
      date: Value(date),
      cardPay: Value(cardPay),
      price: Value(price),
      total: Value(total),
      percentage: Value(percentage),
    ));
    return id;
  }

  Future updateDataItem(DbDataItem dataItem) =>
      update(dbDataItems).replace(dataItem);

  Stream<List<DbDataItem>> getAllDataItems() => select(dbDataItems).watch();
  Stream<List<DbDataItem>> getAllDataItemsByEmployeeId(int id) =>
      (select(dbDataItems)
            ..where((tbl) => tbl.employeeId.equals(id))
            ..orderBy([
              (tbl) =>
                  OrderingTerm(expression: tbl.date, mode: OrderingMode.desc)
            ]))
          .watch();

  Stream<List<DbDataItem>> getDataItemsByEmployee(int i) =>
      (select(dbDataItems)..where((tbl) => tbl.employeeId.equals(i))).watch();

  Stream<List<DbDataItem>> getDataItemsByDateRange(
          DateTime start, DateTime end) =>
      (select(dbDataItems)
            ..where((tbl) =>
                tbl.date.isBiggerOrEqualValue(start) &
                tbl.date.isSmallerOrEqualValue(end)))
          .watch();

  void deleteDatabase() {
    final tables = DbController.to.tables;
    for (final table in tables) {
      delete(table).go();
    }
  }

  Future<double?> getTodayTotalByEmployeeId(int employeeId) async {
    final query = select(dbDataItems)
      ..where((tbl) => tbl.employeeId.equals(employeeId));

    final dataItems = await query.get();
    final total = dataItems
        .map((e) {
          if (e.date?.isToday() ?? false) {
            return e.price;
          }
        })
        .toList()
        .cast<double?>()
        .sumAll();

    return total;
  }

  void insertCost(
      String name,
      bool? deductFromTax,
      bool? systematicExpenditure,
      String? retrievalInterval,
      int? numberOfUnits,
      double? price,
      String? unitsOfMeasurement,
      List<String> selectedCategories,
      DateTime date) {
    var cost = DbCostsCompanion(
      name: Value(name),
      isDeductFromTax: Value(deductFromTax),
      isSystematic: Value(systematicExpenditure),
      repetitionInterval: Value(retrievalInterval),
      numberOfUnits: Value(numberOfUnits),
      price: Value(price),
      unitsOfMeasurement: Value(unitsOfMeasurement),
      categories: Value(selectedCategories),
      date: Value(date),
    );
    into(dbCosts).insert(cost);
  }

  Stream<List<DbCost>> getAllCosts() => select(dbCosts).watch();

  Future<int> count(String tableName, {String? whereClause}) {
    final table = getTable(tableName);
    if (table == null) return Future.value(0);
    final count = DbController.to.appDb.customSelect(
        'SELECT COUNT(*) FROM ${tableName} ${whereClause ?? ''}',
        readsFrom: {table}).get();
    return count.then((value) => value.first.data['COUNT(*)'] as int);
  }

  Stream<List<DbDataItem>> getFilteredDataItems(UserDataFilter filterData) {
    final query = select(dbDataItems);

    if (filterData.fromDate != null) {
      query.where((tbl) => tbl.date.isBiggerOrEqualValue(filterData.fromDate!));
    }
    if (filterData.toDate != null) {
      query.where((tbl) => tbl.date.isSmallerOrEqualValue(filterData.toDate!));
    }
    if (filterData.priceFrom != null) {
      query.where(
          (tbl) => tbl.price.isBiggerOrEqualValue(filterData.priceFrom!));
    }
    if (filterData.priceTo != null) {
      query
          .where((tbl) => tbl.price.isSmallerOrEqualValue(filterData.priceTo!));
    }
    if (filterData.selectedMasters?.isNotEmpty ?? false) {
      query.where((tbl) => tbl.employeeName.isIn(filterData.selectedMasters!));
    }
    if (filterData.selectedCategories?.isNotEmpty ?? false) {
      query.where(
          (tbl) => tbl.categoryName.isIn(filterData.selectedCategories!));
    }
    if (filterData.name?.isNotEmpty ?? false) {
      query.where((tbl) => tbl.name.like('%${filterData.name}%'));
    }
    if (filterData.phone?.isNotEmpty ?? false) {
      query.where((tbl) => tbl.phone.like('%${filterData.phone}%'));
    }
    if (filterData.isRegularCustomer != null) {
      query.where(
          (tbl) => tbl.regCustomer.equals(filterData.isRegularCustomer!));
    }
    if (filterData.isCustomerCard != null) {
      query.where((tbl) => tbl.cardPay.equals(filterData.isCustomerCard!));
    }
    if (filterData.isNewCustomer != null) {
      query.where((tbl) => tbl.newCustomer.equals(filterData.isNewCustomer!));
    }

    return query.watch();
  }

  Future<List<Map<String, dynamic>>> customSelectFuture(String query) =>
      DbController.to.appDb.customSelect(query).map((item) => item.data).get();

  Stream<List<Map<String, dynamic>>> customSelectStream(String query,
          {Set<String>? fromEntityNames}) =>
      DbController.to.appDb
          .customSelect(query)
          .map((item) => item.data)
          .watch();

  TableInfo<Table, dynamic>? getTable(String tableName) {
    final tables = DbController.to.appDb.allTables
        .where((element) => element.actualTableName == tableName);
    if (tables.isEmpty) return null;
    return tables.first;
  }

  Future<double> getCostsByDate(DateTime? date) async {
    if (date == null) return 0;
    final costs =
        await (select(dbCosts)..where((tbl) => tbl.date.equals(date))).get();

    return costs.map((e) => e.price).toList().sumAll();
  }

  Future<List<QueryRow>> getStatisticsReports(
      {DateTime? fromDate, DateTime? toDate}) async {
    int? from;
    int? to;
    String? whereClause;
    if (fromDate != null) {
      from = fromDate.millisecondsSinceEpoch ~/ 1000;
      whereClause = 'AND date > $from';
    }
    if (toDate != null) {
      to = toDate.millisecondsSinceEpoch ~/ 1000;
      whereClause = 'AND date < $to';
    }
    if (fromDate != null && toDate != null) {
      whereClause = 'AND "date" BETWEEN $from AND $to';
    }
    if (fromDate == null && toDate == null) {
      whereClause = '';
    }

    var query = '''
    SELECT 
    COUNT(*) FILTER (WHERE new_customer=1 $whereClause )  as newClient ,
    COUNT(*) FILTER (WHERE reg_customer=1  $whereClause) as regularClient ,
    COUNT(*) FILTER (WHERE 1=1 $whereClause) as numberOfServices , 
      SUM(price)  FILTER (WHERE 1=1 $whereClause) as sales, 
      date
       FROM db_data_items
     
       GROUP BY date
''';

    return DbController.to.appDb.customSelect(query).get();
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

// write extension on lists to get the sum of the list
extension Sum on List<double?> {
  double sumAll() {
    return this
        .fold(0, (previousValue, element) => previousValue + (element ?? 0));
  }
}
