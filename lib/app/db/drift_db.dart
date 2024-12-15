import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:ventigo/app/db/db_controller.dart';
import 'package:ventigo/app/models/employee.dart';
import 'package:ventigo/app/modules/filters/db_filter/costs_filter.dart';
import 'package:ventigo/extensions/date_extension.dart';
import 'package:ventigo/extensions/double_extensions.dart';
import 'package:ventigo/extensions/list_extension.dart';

import '../models/stats_result_model.dart';
import '../modules/filters/db_filter/user_data_filter.dart';
import 'tables/tables.dart';

part 'drift_db.g.dart';

@DriftDatabase(tables: [DbEmployees, DbCategories, DbServices, DbDataItems, DbCosts])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Employees
  Future insertNewEmployee(DbEmployee employee) => into(dbEmployees).insert(employee);

  Future updateEmployee(DbEmployee employee) => update(dbEmployees).replace(employee);

  Future<int> getTotalEmployees() => (select(dbEmployees)).get().then((value) => value.length);

  Future<int> getTotalServices() => (select(dbServices)).get().then((value) => value.length);

  Future<void> deleteEmployee(int id) {
    return (delete(dbEmployees)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> insertNewCompanionEmployee(String name, String lastName, String login, String password, double percentage,
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

  Stream<List<DbEmployee>> getAllEmployees() =>
      (select(dbEmployees)..orderBy([(tbl) => OrderingTerm(expression: tbl.id, mode: OrderingMode.desc)])).watch();

  Future<List<DbEmployee>> getAllEmployeesList() =>
      (select(dbEmployees)..orderBy([(tbl) => OrderingTerm(expression: tbl.id, mode: OrderingMode.desc)])).get();

  // Categories
  Future insertNewCategory(DbCategory category) => into(dbCategories).insert(category);

  Future<int> insertNewCompanionCategory(String name) async {
    final id = await into(dbCategories).insert(DbCategoriesCompanion.insert(name: Value(name)));
    return id;
  }

  Future<int> getCategoryId(String name) async {
    final category = await (select(dbCategories)..where((tbl) => tbl.name.equals(name))).getSingle();
    return category.id;
  }

  Stream<List<DbCategory>> getAllCategories() =>
      (select(dbCategories)..orderBy([(tbl) => OrderingTerm(expression: tbl.id, mode: OrderingMode.desc)])).watch();

  Future<List<DbCategory>> getAllCategoriesF() =>
      (select(dbCategories)..orderBy([(tbl) => OrderingTerm(expression: tbl.id, mode: OrderingMode.desc)])).get();

  Future<List<DbCategory>?> getCategoriesByEmpIDs(List<String> categories) async {
    final ids = categories.map((e) => int.parse(e)).toList();
    final categoriesList = await (select(dbCategories)..where((tbl) => tbl.id.isIn(ids))).get();
    return categoriesList;
  }

  Future<List<DbCategory>?> getCategoryByEmpId(int id) async {
    final employee = await (select(dbEmployees)..where((tbl) => tbl.id.equals(id))).getSingle();

    final categories = await getCategoriesByEmpIDs(employee.categories);
    return categories;
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
  Future insertNewService(DbService service) => into(dbServices).insert(service);

  Future<int> insertNewCompanionService(String name, double price, int categoryId) async {
    final id = await into(dbServices)
        .insert(DbServicesCompanion.insert(name: Value(name), price: Value(price), categoryId: categoryId));
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

  Future<DbEmployee?> getEmployeeByLoginPassword(String login, String password) async {
    final employee = await (select(dbEmployees)
          ..where((tbl) => tbl.login.equals(login) & tbl.password.equals(password)))
        .getSingleOrNull();
    return employee;
  }

  // DataItems

  Future insertNewDataItem(DbDataItem dataItem) => into(dbDataItems).insert(dataItem);

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
    double percentage,
    String notes,
  ) async {
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
      notes: Value(notes),
    ));
    return id;
  }

  Future updateDataItem(DbDataItem dataItem) => update(dbDataItems).replace(dataItem);

  Future<List<DbDataItem>> getAllDataItemsF() =>
      (select(dbDataItems)..orderBy([(tbl) => OrderingTerm(expression: tbl.phone, mode: OrderingMode.desc)])).get();
  Future<DbDataItem> getDataItemById(int id) => (select(dbDataItems)..where((tbl) => tbl.id.equals(id))).getSingle();

  Stream<List<DbDataItem>> getAllDataItems({DateTime? fromDate, DateTime? toDate}) => (select(dbDataItems)
        ..orderBy([(tbl) => OrderingTerm(expression: tbl.date, mode: OrderingMode.desc)])
        ..where((tbl) =>
            tbl.date.isBiggerOrEqualValue(fromDate ?? DateTime.now().subtract(Duration(days: 3600))) &
            tbl.date.isSmallerOrEqualValue(toDate ?? DateTime.now().add(Duration(days: 3600)))))
      .watch();

  Stream<List<DbDataItem>> getAllDataItemsByEmployeeId(int id) => (select(dbDataItems)
        ..where((tbl) => tbl.employeeId.equals(id))
        ..orderBy([(tbl) => OrderingTerm(expression: tbl.date, mode: OrderingMode.desc)]))
      .watch();

  Stream<List<DbDataItem>> getLastWeeksDataItemsByEmployeeId(int id) => (select(dbDataItems)
        ..where((tbl) =>
            tbl.employeeId.equals(id) & tbl.date.isBiggerOrEqualValue(DateTime.now().subtract(Duration(days: 7))))
        ..orderBy([(tbl) => OrderingTerm(expression: tbl.date, mode: OrderingMode.desc)]))
      .watch();

  Stream<List<DbDataItem>> getDataItemsByEmployee(int i) =>
      (select(dbDataItems)..where((tbl) => tbl.employeeId.equals(i))).watch();

  Stream<List<DbDataItem>> getDataItemsByDateRange(DateTime start, DateTime end) =>
      (select(dbDataItems)..where((tbl) => tbl.date.isBiggerOrEqualValue(start) & tbl.date.isSmallerOrEqualValue(end)))
          .watch();

  void deleteDatabase() {
    final tables = DbController.to.tables;
    for (final table in tables) {
      delete(table).go();
    }
  }

  Future<double?> getTodayTotalByEmployeeId(int employeeId) async {
    try {
      final query = select(dbDataItems)..where((tbl) => tbl.employeeId.equals(employeeId));

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
    } catch (e) {
      log('Error: $e');
    }
  }

  void insertCost(String name, bool? deductFromTax, bool? systematicExpenditure, String? retrievalInterval,
      int? numberOfUnits, double? price, String? unitsOfMeasurement, List<String> selectedCategories, DateTime date) {
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

  Stream<List<DbCost>> getAllCosts({DateTime? fromDate, DateTime? toDate}) => (select(dbCosts)
        ..orderBy([
          (tbl) => OrderingTerm(expression: tbl.date, mode: OrderingMode.desc),
          (tbl) => OrderingTerm(expression: tbl.id, mode: OrderingMode.desc)
        ])
        ..where((tbl) =>
            tbl.date.isBiggerOrEqualValue(fromDate ?? DateTime.now().subtract(Duration(days: 3600))) &
            tbl.date.isSmallerOrEqualValue(toDate ?? DateTime.now().add(Duration(days: 3600)))))
      .watch();

  Future<bool> ifAllSameDate({bool isCostTable = true}) async {
    if (isCostTable) {
      final query = select(dbCosts);
      final dataItems = await query.get();
      final dates = dataItems.map((e) => e.date).toSet();
      return dates.length == 1;
    } else {
      final query = select(dbDataItems);
      final dataItems = await query.get();
      final dates = dataItems.map((e) => e.date).toSet();
      return dates.length == 1;
    }
  }

  Future<int> count(String tableName, {String? whereClause}) {
    final table = getTable(tableName);
    if (table == null) return Future.value(0);
    final count = DbController.to.appDb
        .customSelect('SELECT COUNT(*) FROM ${tableName} ${whereClause ?? ''}', readsFrom: {table}).get();
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
      query.where((tbl) => tbl.price.isBiggerOrEqualValue(filterData.priceFrom!));
    }
    if (filterData.priceTo != null) {
      query.where((tbl) => tbl.price.isSmallerOrEqualValue(filterData.priceTo!));
    }
    if (filterData.selectedMasters?.isNotEmpty ?? false) {
      query.where((tbl) => tbl.employeeName.isIn(filterData.selectedMasters!));
    }
    if (filterData.selectedCategories?.isNotEmpty ?? false) {
      query.where((tbl) => tbl.categoryName.isIn(filterData.selectedCategories!));
    }
    if (filterData.name?.isNotEmpty ?? false) {
      query.where((tbl) => tbl.name.like('%${filterData.name}%'));
    }
    if (filterData.phone?.isNotEmpty ?? false) {
      query.where((tbl) => tbl.phone.like('%${filterData.phone}%'));
    }
    if (filterData.isRegularCustomer != null) {
      query.where((tbl) => tbl.regCustomer.equals(filterData.isRegularCustomer!));
    }
    if (filterData.isCustomerCard != null) {
      query.where((tbl) => tbl.cardPay.equals(filterData.isCustomerCard!));
    }
    if (filterData.isNewCustomer != null) {
      query.where((tbl) => tbl.newCustomer.equals(filterData.isNewCustomer!));
    }
    if (filterData.notes != null) {
      query.where((tbl) => tbl.notes.like('%${filterData.notes}%'));
    }

    return query.watch();
  }

  Future<List<Map<String, dynamic>>> customSelectFuture(String query) =>
      DbController.to.appDb.customSelect(query).map((item) => item.data).get();

  Stream<List<Map<String, dynamic>>> customSelectStream(String query, {Set<String>? fromEntityNames}) =>
      DbController.to.appDb.customSelect(query).map((item) => item.data).watch();

  TableInfo<Table, dynamic>? getTable(String tableName) {
    final tables = DbController.to.appDb.allTables.where((element) => element.actualTableName == tableName);
    if (tables.isEmpty) return null;
    return tables.first;
  }

  Future<double> getCostsByDate(DateTime? date) async {
    if (date == null) return 0;
    final costs = await (select(dbCosts)..where((tbl) => tbl.date.equals(date))).get();

    return costs.map((e) => e.price).toList().sumAll();
  }

  Future<double> getCostsByDateRange(DateTime? fromDate, DateTime? toDate) async {
    if (fromDate == null || toDate == null) return 0;
    final costs = await (select(dbCosts)
          ..where((tbl) => tbl.date.isBiggerOrEqualValue(fromDate) & tbl.date.isSmallerOrEqualValue(toDate)))
        .get();

    return costs.map((e) => e.price).toList().sumAll();
  }

  Future<List<StatResultModel>> getNewStatisticsReports({DateTime? fromDate, DateTime? toDate}) async {
    fromDate = fromDate ?? DateTime.now().subtract(Duration(days: 3600));
    toDate = toDate ?? DateTime.now().add(Duration(days: 3600));

    int from = fromDate.millisecondsSinceEpoch ~/ 1000;
    int to = toDate.millisecondsSinceEpoch ~/ 1000;

    // another Day added to toDate to include the last day
    to += Duration(hours: 24).inMilliseconds ~/ 1000;

    final joins = [
      innerJoin(dbServices, dbServices.id.equalsExp(dbDataItems.serviceId)),
      innerJoin(dbEmployees, dbEmployees.id.equalsExp(dbDataItems.employeeId)),
    ];

    final query = await (select(dbDataItems).join(joins)
          ..addColumns([
            dbDataItems.price.sum(),
            dbDataItems.regCustomer.count(),
          ])
          ..where(dbDataItems.date.isBiggerOrEqualValue(fromDate))
          ..where(dbDataItems.date.isSmallerOrEqualValue(DateTime.fromMillisecondsSinceEpoch(to * 1000)))
          ..groupBy([dbEmployees.id])
          ..orderBy([OrderingTerm(expression: dbEmployees.id, mode: OrderingMode.asc)]))
        .get();

    List<StatResultModel> list = [];

    final results = await query;
    for (final e in results) {
      final employeeName = e.read(dbEmployees.name);
      final employeePercentage = e.read(dbEmployees.percentage);
      final totalPrice = await customSelect(
          'SELECT SUM(price) as totalPrice FROM db_data_items WHERE employee_id = ${e.read(dbEmployees.id)} AND date BETWEEN $from AND $to',
          readsFrom: {dbDataItems}).getSingle();
      final totalRegCus = await customSelect(
          'SELECT COUNT(*) as newCus FROM db_data_items WHERE reg_customer = 1 AND employee_id = ${e.read(dbEmployees.id)} AND date BETWEEN $from AND $to',
          readsFrom: {dbDataItems}).getSingle();

      // unique customers
      final uniqueCustomers = await customSelect(
          // 'SELECT COUNT(DISTINCT phone) as uniqCus FROM db_data_items WHERE employee_id = ${e.read(dbEmployees.id)} AND date BETWEEN $from AND $to',
          'SELECT COUNT(DISTINCT phone) as uniqCus FROM db_data_items WHERE  date BETWEEN $from AND $to',
          readsFrom: {dbDataItems}).getSingle();

      log('uniqueCustomers: ${uniqueCustomers.data['uniqCus']}');

      final totalNewCus = await customSelect(
          'SELECT COUNT(*) as newCus FROM db_data_items WHERE new_customer = 1 AND employee_id = ${e.read(dbEmployees.id)} AND date BETWEEN $from AND $to',
          readsFrom: {dbDataItems}).getSingle();

      final totalServices = await customSelect(
          'SELECT COUNT(*) as totalServices FROM db_data_items WHERE employee_id = ${e.read(dbEmployees.id)} AND date BETWEEN $from AND $to',
          readsFrom: {dbDataItems}).getSingle();

      final allServicesIds = await customSelect(
          'SELECT service_id as totalServices FROM db_data_items WHERE employee_id = ${e.read(dbEmployees.id)} AND date BETWEEN $from AND $to',
          readsFrom: {dbDataItems}).get();

      final shopCost = await getCostsByDateRange(fromDate, toDate);

      final date = e.read(dbDataItems.date);

      final List<int> allServicesIdsList = allServicesIds.map((e) => e.data['totalServices']).toList().cast<int>();

      final sumAllTheCosts = await sumAllPrices(allServicesIdsList);

      //   log('Date: ${date}');
      //   log('EmployeeName: ${employeeName}');
      //   log('totalPrice: ${totalPrice.data['totalPrice']}');
      //   log('isRegCustomer: ${totalRegCus.data['newCus']}');
      //   log('isNewCustomer: ${totalNewCus.data['newCus']}');
      //   log('totalServices: ${totalServices.data['totalServices']}');
      //   log('allServicesIdsList: ${allServicesIdsList}');
      //   log('sumAllTheCosts: ${sumAllTheCosts}');
      // log('employeePercentage: $employeePercentage');

      // log('totalPrice: ${totalPrice.data['totalPrice']}');

      // log('percentage: ${double.tryParse((double.tryParse(totalPrice.data['totalPrice'].toString()) ?? 0).percentageOf(employeePercentage))}');

      list.add(StatResultModel(
          employeeName: employeeName ?? '',
          totalPrice: totalPrice.data['totalPrice'] ?? 0,
          noRegCustomer: totalRegCus.data['newCus'],
          noNewCustomer: totalNewCus.data['newCus'],
          totalServices: totalServices.data['totalServices'],
          uniqueCustomers: uniqueCustomers.data['uniqCus'],
          shopCost: shopCost,
          totalCost: sumAllTheCosts,
          percentage: double.tryParse(
                  (double.tryParse(totalPrice.data['totalPrice'].toString()) ?? 0).percentageOf(employeePercentage)) ??
              0,
          date: date));
    }
    list.add(list.total);

    return list;
  }

  Future<double> sumAllPrices(List<int> ids) async {
    List<double?> prices = [];

    for (final id in ids) {
      final query = await (select(dbServices)..where((tbl) => tbl.id.equals(id))).getSingle();
      prices.add(query.price);
    }

    return prices.sumAll();
  }

  Future<List<QueryRow>> getStatisticsReports({DateTime? fromDate, DateTime? toDate}) async {
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

  Stream<List<DbCost>> getFilteredCosts(CostsFilter? filter) {
    final query = select(dbCosts);

    if (filter?.minPrice != null) {
      query.where((tbl) => tbl.price.isBiggerOrEqualValue(filter!.minPrice!));
    }
    if (filter?.maxPrice != null) {
      query.where((tbl) => tbl.price.isSmallerOrEqualValue(filter!.maxPrice!));
    }
    if (filter?.name?.isNotEmpty ?? false) {
      query.where((tbl) => tbl.name.like('%${filter!.name}%'));
      log('filter.name: ${filter?.name}');
    }
    if (filter?.deductFromTax != null) {
      query.where((tbl) => tbl.isDeductFromTax.equals(filter!.deductFromTax!));
    }
    if (filter?.systematicExpenditure != null) {
      query.where((tbl) => tbl.isSystematic.equals(filter!.systematicExpenditure!));
    }
    if (filter?.repetitionInterval?.isNotEmpty ?? false) {
      query.where((tbl) => tbl.repetitionInterval.equals(filter!.repetitionInterval!));
    }
    if (filter?.unitOfMeasurements?.isNotEmpty ?? false) {
      query.where((tbl) => tbl.unitsOfMeasurement.equals(filter!.unitOfMeasurements!));
    }
    if (filter?.categories?.isNotEmpty ?? false) {
      query.where((tbl) => tbl.categories.contains('All') | tbl.categories.like('%${filter!.categories.toString()}%'));
      ;
    }
    if (filter?.fromDate != null) {
      query.where((tbl) => tbl.date.isBiggerOrEqualValue(filter!.fromDate!));
      log('filter.fromDate: ${filter?.fromDate}');
    }
    if (filter?.toDate != null) {
      query.where((tbl) => tbl.date.isSmallerOrEqualValue(filter!.toDate!));
    }
    query.watch().first.then((List<DbCost> data) {
      log(data.first.date.toString());
    });

    return query.watch();
  }

  getCategoriesCount() {
    return count('db_categories');
  }

  getServiceByServiceName(String query) {
    return (select(dbServices)..where((tbl) => tbl.name.equals(query))).getSingle();
  }

  getCategoryByService(DbService service) {
    return (select(dbCategories)..where((tbl) => tbl.id.equals(service.categoryId))).getSingle();
  }

  getCategoryById(int index) {
    return (select(dbCategories)..where((tbl) => tbl.id.equals(index))).getSingle();
  }

  void deleteDataItem(int id) {
    (delete(dbDataItems)..where((tbl) => tbl.id.equals(id))).go();
  }

  getCategoriesByIDs(List<String> categories) {
    final ids = categories.map((e) => int.parse(e)).toList();
    return (select(dbCategories)..where((tbl) => tbl.id.isIn(ids))).get();
  }

  deleteCost(int id) {
    (delete(dbCosts)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<double> getPriceByServiceId(int serviceId) async {
    final query = await (select(dbServices)..where((tbl) => tbl.id.equals(serviceId))).getSingle();
    return query.price ?? 0.0;
  }

  Future<bool> isCategoryPresent() {
    return dbCategories.count().getSingle().then((value) {
      log('value: $value');
      return value > 0;
    });
  }

  Future<DbEmployee> getEmployeeById(int id) {
    return (select(dbEmployees)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<String?>? getTotalCosts(DateTime? fromDate, DateTime? toDate) {
    final query = select(dbCosts)
      ..where((tbl) => tbl.date.isBiggerOrEqualValue(fromDate ?? DateTime(2000)))
      ..where((tbl) => tbl.date.isSmallerOrEqualValue(toDate ?? DateTime(8000)));

    var ww = query.get().then((value) {
      if (value.isNotEmpty) {
        return value.map((e) => e.price).toList().sumAll().toStringAsFixed(2);
      }
    });

    return ww;
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
    return this.fold(0, (previousValue, element) => previousValue + (element ?? 0));
  }
}
