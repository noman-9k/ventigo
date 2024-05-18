// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_db.dart';

// ignore_for_file: type=lint
class $DbEmployeesTable extends DbEmployees
    with TableInfo<$DbEmployeesTable, DbEmployee> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbEmployeesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
      'login', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _percentageMeta =
      const VerificationMeta('percentage');
  @override
  late final GeneratedColumn<double> percentage = GeneratedColumn<double>(
      'percentage', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _categoriesMeta =
      const VerificationMeta('categories');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> categories =
      GeneratedColumn<String>('categories', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($DbEmployeesTable.$convertercategories);
  static const VerificationMeta _visibilityMeta =
      const VerificationMeta('visibility');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> visibility =
      GeneratedColumn<String>('visibility', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($DbEmployeesTable.$convertervisibility);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, lastName, login, password, percentage, categories, visibility];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_employees';
  @override
  VerificationContext validateIntegrity(Insertable<DbEmployee> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    }
    if (data.containsKey('login')) {
      context.handle(
          _loginMeta, login.isAcceptableOrUnknown(data['login']!, _loginMeta));
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    }
    if (data.containsKey('percentage')) {
      context.handle(
          _percentageMeta,
          percentage.isAcceptableOrUnknown(
              data['percentage']!, _percentageMeta));
    }
    context.handle(_categoriesMeta, const VerificationResult.success());
    context.handle(_visibilityMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbEmployee map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbEmployee(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name']),
      login: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}login']),
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password']),
      percentage: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}percentage']),
      categories: $DbEmployeesTable.$convertercategories.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}categories'])!),
      visibility: $DbEmployeesTable.$convertervisibility.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}visibility'])!),
    );
  }

  @override
  $DbEmployeesTable createAlias(String alias) {
    return $DbEmployeesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertercategories =
      const StringListConverter();
  static TypeConverter<List<String>, String> $convertervisibility =
      const StringListConverter();
}

class DbEmployee extends DataClass implements Insertable<DbEmployee> {
  final int id;
  final String? name;
  final String? lastName;
  final String? login;
  final String? password;
  final double? percentage;
  final List<String> categories;
  final List<String> visibility;
  const DbEmployee(
      {required this.id,
      this.name,
      this.lastName,
      this.login,
      this.password,
      this.percentage,
      required this.categories,
      required this.visibility});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || login != null) {
      map['login'] = Variable<String>(login);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    if (!nullToAbsent || percentage != null) {
      map['percentage'] = Variable<double>(percentage);
    }
    {
      map['categories'] = Variable<String>(
          $DbEmployeesTable.$convertercategories.toSql(categories));
    }
    {
      map['visibility'] = Variable<String>(
          $DbEmployeesTable.$convertervisibility.toSql(visibility));
    }
    return map;
  }

  DbEmployeesCompanion toCompanion(bool nullToAbsent) {
    return DbEmployeesCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      login:
          login == null && nullToAbsent ? const Value.absent() : Value(login),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
      percentage: percentage == null && nullToAbsent
          ? const Value.absent()
          : Value(percentage),
      categories: Value(categories),
      visibility: Value(visibility),
    );
  }

  factory DbEmployee.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbEmployee(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      login: serializer.fromJson<String?>(json['login']),
      password: serializer.fromJson<String?>(json['password']),
      percentage: serializer.fromJson<double?>(json['percentage']),
      categories: serializer.fromJson<List<String>>(json['categories']),
      visibility: serializer.fromJson<List<String>>(json['visibility']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'lastName': serializer.toJson<String?>(lastName),
      'login': serializer.toJson<String?>(login),
      'password': serializer.toJson<String?>(password),
      'percentage': serializer.toJson<double?>(percentage),
      'categories': serializer.toJson<List<String>>(categories),
      'visibility': serializer.toJson<List<String>>(visibility),
    };
  }

  DbEmployee copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<String?> lastName = const Value.absent(),
          Value<String?> login = const Value.absent(),
          Value<String?> password = const Value.absent(),
          Value<double?> percentage = const Value.absent(),
          List<String>? categories,
          List<String>? visibility}) =>
      DbEmployee(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        lastName: lastName.present ? lastName.value : this.lastName,
        login: login.present ? login.value : this.login,
        password: password.present ? password.value : this.password,
        percentage: percentage.present ? percentage.value : this.percentage,
        categories: categories ?? this.categories,
        visibility: visibility ?? this.visibility,
      );
  @override
  String toString() {
    return (StringBuffer('DbEmployee(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lastName: $lastName, ')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('percentage: $percentage, ')
          ..write('categories: $categories, ')
          ..write('visibility: $visibility')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, lastName, login, password, percentage, categories, visibility);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbEmployee &&
          other.id == this.id &&
          other.name == this.name &&
          other.lastName == this.lastName &&
          other.login == this.login &&
          other.password == this.password &&
          other.percentage == this.percentage &&
          other.categories == this.categories &&
          other.visibility == this.visibility);
}

class DbEmployeesCompanion extends UpdateCompanion<DbEmployee> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> lastName;
  final Value<String?> login;
  final Value<String?> password;
  final Value<double?> percentage;
  final Value<List<String>> categories;
  final Value<List<String>> visibility;
  const DbEmployeesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lastName = const Value.absent(),
    this.login = const Value.absent(),
    this.password = const Value.absent(),
    this.percentage = const Value.absent(),
    this.categories = const Value.absent(),
    this.visibility = const Value.absent(),
  });
  DbEmployeesCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.lastName = const Value.absent(),
    this.login = const Value.absent(),
    this.password = const Value.absent(),
    this.percentage = const Value.absent(),
    required List<String> categories,
    required List<String> visibility,
  })  : categories = Value(categories),
        visibility = Value(visibility);
  static Insertable<DbEmployee> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? lastName,
    Expression<String>? login,
    Expression<String>? password,
    Expression<double>? percentage,
    Expression<String>? categories,
    Expression<String>? visibility,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (lastName != null) 'last_name': lastName,
      if (login != null) 'login': login,
      if (password != null) 'password': password,
      if (percentage != null) 'percentage': percentage,
      if (categories != null) 'categories': categories,
      if (visibility != null) 'visibility': visibility,
    });
  }

  DbEmployeesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<String?>? lastName,
      Value<String?>? login,
      Value<String?>? password,
      Value<double?>? percentage,
      Value<List<String>>? categories,
      Value<List<String>>? visibility}) {
    return DbEmployeesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      login: login ?? this.login,
      password: password ?? this.password,
      percentage: percentage ?? this.percentage,
      categories: categories ?? this.categories,
      visibility: visibility ?? this.visibility,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (percentage.present) {
      map['percentage'] = Variable<double>(percentage.value);
    }
    if (categories.present) {
      map['categories'] = Variable<String>(
          $DbEmployeesTable.$convertercategories.toSql(categories.value));
    }
    if (visibility.present) {
      map['visibility'] = Variable<String>(
          $DbEmployeesTable.$convertervisibility.toSql(visibility.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbEmployeesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('lastName: $lastName, ')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('percentage: $percentage, ')
          ..write('categories: $categories, ')
          ..write('visibility: $visibility')
          ..write(')'))
        .toString();
  }
}

class $DbCategoriesTable extends DbCategories
    with TableInfo<$DbCategoriesTable, DbCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_categories';
  @override
  VerificationContext validateIntegrity(Insertable<DbCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbCategory(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $DbCategoriesTable createAlias(String alias) {
    return $DbCategoriesTable(attachedDatabase, alias);
  }
}

class DbCategory extends DataClass implements Insertable<DbCategory> {
  final int id;
  final String? name;
  final String? description;
  const DbCategory({required this.id, this.name, this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  DbCategoriesCompanion toCompanion(bool nullToAbsent) {
    return DbCategoriesCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory DbCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbCategory(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'description': serializer.toJson<String?>(description),
    };
  }

  DbCategory copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<String?> description = const Value.absent()}) =>
      DbCategory(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        description: description.present ? description.value : this.description,
      );
  @override
  String toString() {
    return (StringBuffer('DbCategory(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbCategory &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class DbCategoriesCompanion extends UpdateCompanion<DbCategory> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> description;
  const DbCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  DbCategoriesCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  static Insertable<DbCategory> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  DbCategoriesCompanion copyWith(
      {Value<int>? id, Value<String?>? name, Value<String?>? description}) {
    return DbCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $DbServicesTable extends DbServices
    with TableInfo<$DbServicesTable, DbService> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbServicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES db_categories (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, categoryId, name, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_services';
  @override
  VerificationContext validateIntegrity(Insertable<DbService> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbService map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbService(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
    );
  }

  @override
  $DbServicesTable createAlias(String alias) {
    return $DbServicesTable(attachedDatabase, alias);
  }
}

class DbService extends DataClass implements Insertable<DbService> {
  final int id;
  final int categoryId;
  final String? name;
  final double? price;
  const DbService(
      {required this.id, required this.categoryId, this.name, this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    return map;
  }

  DbServicesCompanion toCompanion(bool nullToAbsent) {
    return DbServicesCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
    );
  }

  factory DbService.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbService(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      name: serializer.fromJson<String?>(json['name']),
      price: serializer.fromJson<double?>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
      'name': serializer.toJson<String?>(name),
      'price': serializer.toJson<double?>(price),
    };
  }

  DbService copyWith(
          {int? id,
          int? categoryId,
          Value<String?> name = const Value.absent(),
          Value<double?> price = const Value.absent()}) =>
      DbService(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        name: name.present ? name.value : this.name,
        price: price.present ? price.value : this.price,
      );
  @override
  String toString() {
    return (StringBuffer('DbService(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoryId, name, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbService &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.name == this.name &&
          other.price == this.price);
}

class DbServicesCompanion extends UpdateCompanion<DbService> {
  final Value<int> id;
  final Value<int> categoryId;
  final Value<String?> name;
  final Value<double?> price;
  const DbServicesCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
  });
  DbServicesCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
    this.name = const Value.absent(),
    this.price = const Value.absent(),
  }) : categoryId = Value(categoryId);
  static Insertable<DbService> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<String>? name,
    Expression<double>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
    });
  }

  DbServicesCompanion copyWith(
      {Value<int>? id,
      Value<int>? categoryId,
      Value<String?>? name,
      Value<double?>? price}) {
    return DbServicesCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbServicesCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $DbDataItemsTable extends DbDataItems
    with TableInfo<$DbDataItemsTable, DbDataItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbDataItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _employeeIdMeta =
      const VerificationMeta('employeeId');
  @override
  late final GeneratedColumn<int> employeeId = GeneratedColumn<int>(
      'employee_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES db_employees (id)'));
  static const VerificationMeta _employeeNameMeta =
      const VerificationMeta('employeeName');
  @override
  late final GeneratedColumn<String> employeeName = GeneratedColumn<String>(
      'employee_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES db_categories (id)'));
  static const VerificationMeta _categoryNameMeta =
      const VerificationMeta('categoryName');
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
      'category_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _serviceIdMeta =
      const VerificationMeta('serviceId');
  @override
  late final GeneratedColumn<int> serviceId = GeneratedColumn<int>(
      'service_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES db_services (id)'));
  static const VerificationMeta _serviceNameMeta =
      const VerificationMeta('serviceName');
  @override
  late final GeneratedColumn<String> serviceName = GeneratedColumn<String>(
      'service_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _newCustomerMeta =
      const VerificationMeta('newCustomer');
  @override
  late final GeneratedColumn<bool> newCustomer = GeneratedColumn<bool>(
      'new_customer', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("new_customer" IN (0, 1))'));
  static const VerificationMeta _regCustomerMeta =
      const VerificationMeta('regCustomer');
  @override
  late final GeneratedColumn<bool> regCustomer = GeneratedColumn<bool>(
      'reg_customer', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("reg_customer" IN (0, 1))'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _cardPayMeta =
      const VerificationMeta('cardPay');
  @override
  late final GeneratedColumn<bool> cardPay = GeneratedColumn<bool>(
      'card_pay', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("card_pay" IN (0, 1))'));
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double> total = GeneratedColumn<double>(
      'total', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        phone,
        employeeId,
        employeeName,
        categoryId,
        categoryName,
        serviceId,
        serviceName,
        newCustomer,
        regCustomer,
        date,
        cardPay,
        price,
        total
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_data_items';
  @override
  VerificationContext validateIntegrity(Insertable<DbDataItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('employee_id')) {
      context.handle(
          _employeeIdMeta,
          employeeId.isAcceptableOrUnknown(
              data['employee_id']!, _employeeIdMeta));
    } else if (isInserting) {
      context.missing(_employeeIdMeta);
    }
    if (data.containsKey('employee_name')) {
      context.handle(
          _employeeNameMeta,
          employeeName.isAcceptableOrUnknown(
              data['employee_name']!, _employeeNameMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('category_name')) {
      context.handle(
          _categoryNameMeta,
          categoryName.isAcceptableOrUnknown(
              data['category_name']!, _categoryNameMeta));
    }
    if (data.containsKey('service_id')) {
      context.handle(_serviceIdMeta,
          serviceId.isAcceptableOrUnknown(data['service_id']!, _serviceIdMeta));
    } else if (isInserting) {
      context.missing(_serviceIdMeta);
    }
    if (data.containsKey('service_name')) {
      context.handle(
          _serviceNameMeta,
          serviceName.isAcceptableOrUnknown(
              data['service_name']!, _serviceNameMeta));
    }
    if (data.containsKey('new_customer')) {
      context.handle(
          _newCustomerMeta,
          newCustomer.isAcceptableOrUnknown(
              data['new_customer']!, _newCustomerMeta));
    }
    if (data.containsKey('reg_customer')) {
      context.handle(
          _regCustomerMeta,
          regCustomer.isAcceptableOrUnknown(
              data['reg_customer']!, _regCustomerMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('card_pay')) {
      context.handle(_cardPayMeta,
          cardPay.isAcceptableOrUnknown(data['card_pay']!, _cardPayMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbDataItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbDataItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      employeeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}employee_id'])!,
      employeeName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}employee_name']),
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      categoryName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_name']),
      serviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}service_id'])!,
      serviceName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}service_name']),
      newCustomer: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}new_customer']),
      regCustomer: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}reg_customer']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date']),
      cardPay: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}card_pay']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total']),
    );
  }

  @override
  $DbDataItemsTable createAlias(String alias) {
    return $DbDataItemsTable(attachedDatabase, alias);
  }
}

class DbDataItem extends DataClass implements Insertable<DbDataItem> {
  final int id;
  final String? name;
  final String? phone;
  final int employeeId;
  final String? employeeName;
  final int categoryId;
  final String? categoryName;
  final int serviceId;
  final String? serviceName;
  final bool? newCustomer;
  final bool? regCustomer;
  final DateTime? date;
  final bool? cardPay;
  final double? price;
  final double? total;
  const DbDataItem(
      {required this.id,
      this.name,
      this.phone,
      required this.employeeId,
      this.employeeName,
      required this.categoryId,
      this.categoryName,
      required this.serviceId,
      this.serviceName,
      this.newCustomer,
      this.regCustomer,
      this.date,
      this.cardPay,
      this.price,
      this.total});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['employee_id'] = Variable<int>(employeeId);
    if (!nullToAbsent || employeeName != null) {
      map['employee_name'] = Variable<String>(employeeName);
    }
    map['category_id'] = Variable<int>(categoryId);
    if (!nullToAbsent || categoryName != null) {
      map['category_name'] = Variable<String>(categoryName);
    }
    map['service_id'] = Variable<int>(serviceId);
    if (!nullToAbsent || serviceName != null) {
      map['service_name'] = Variable<String>(serviceName);
    }
    if (!nullToAbsent || newCustomer != null) {
      map['new_customer'] = Variable<bool>(newCustomer);
    }
    if (!nullToAbsent || regCustomer != null) {
      map['reg_customer'] = Variable<bool>(regCustomer);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || cardPay != null) {
      map['card_pay'] = Variable<bool>(cardPay);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || total != null) {
      map['total'] = Variable<double>(total);
    }
    return map;
  }

  DbDataItemsCompanion toCompanion(bool nullToAbsent) {
    return DbDataItemsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      employeeId: Value(employeeId),
      employeeName: employeeName == null && nullToAbsent
          ? const Value.absent()
          : Value(employeeName),
      categoryId: Value(categoryId),
      categoryName: categoryName == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryName),
      serviceId: Value(serviceId),
      serviceName: serviceName == null && nullToAbsent
          ? const Value.absent()
          : Value(serviceName),
      newCustomer: newCustomer == null && nullToAbsent
          ? const Value.absent()
          : Value(newCustomer),
      regCustomer: regCustomer == null && nullToAbsent
          ? const Value.absent()
          : Value(regCustomer),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      cardPay: cardPay == null && nullToAbsent
          ? const Value.absent()
          : Value(cardPay),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      total:
          total == null && nullToAbsent ? const Value.absent() : Value(total),
    );
  }

  factory DbDataItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbDataItem(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      employeeId: serializer.fromJson<int>(json['employeeId']),
      employeeName: serializer.fromJson<String?>(json['employeeName']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      categoryName: serializer.fromJson<String?>(json['categoryName']),
      serviceId: serializer.fromJson<int>(json['serviceId']),
      serviceName: serializer.fromJson<String?>(json['serviceName']),
      newCustomer: serializer.fromJson<bool?>(json['newCustomer']),
      regCustomer: serializer.fromJson<bool?>(json['regCustomer']),
      date: serializer.fromJson<DateTime?>(json['date']),
      cardPay: serializer.fromJson<bool?>(json['cardPay']),
      price: serializer.fromJson<double?>(json['price']),
      total: serializer.fromJson<double?>(json['total']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'phone': serializer.toJson<String?>(phone),
      'employeeId': serializer.toJson<int>(employeeId),
      'employeeName': serializer.toJson<String?>(employeeName),
      'categoryId': serializer.toJson<int>(categoryId),
      'categoryName': serializer.toJson<String?>(categoryName),
      'serviceId': serializer.toJson<int>(serviceId),
      'serviceName': serializer.toJson<String?>(serviceName),
      'newCustomer': serializer.toJson<bool?>(newCustomer),
      'regCustomer': serializer.toJson<bool?>(regCustomer),
      'date': serializer.toJson<DateTime?>(date),
      'cardPay': serializer.toJson<bool?>(cardPay),
      'price': serializer.toJson<double?>(price),
      'total': serializer.toJson<double?>(total),
    };
  }

  DbDataItem copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          int? employeeId,
          Value<String?> employeeName = const Value.absent(),
          int? categoryId,
          Value<String?> categoryName = const Value.absent(),
          int? serviceId,
          Value<String?> serviceName = const Value.absent(),
          Value<bool?> newCustomer = const Value.absent(),
          Value<bool?> regCustomer = const Value.absent(),
          Value<DateTime?> date = const Value.absent(),
          Value<bool?> cardPay = const Value.absent(),
          Value<double?> price = const Value.absent(),
          Value<double?> total = const Value.absent()}) =>
      DbDataItem(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        phone: phone.present ? phone.value : this.phone,
        employeeId: employeeId ?? this.employeeId,
        employeeName:
            employeeName.present ? employeeName.value : this.employeeName,
        categoryId: categoryId ?? this.categoryId,
        categoryName:
            categoryName.present ? categoryName.value : this.categoryName,
        serviceId: serviceId ?? this.serviceId,
        serviceName: serviceName.present ? serviceName.value : this.serviceName,
        newCustomer: newCustomer.present ? newCustomer.value : this.newCustomer,
        regCustomer: regCustomer.present ? regCustomer.value : this.regCustomer,
        date: date.present ? date.value : this.date,
        cardPay: cardPay.present ? cardPay.value : this.cardPay,
        price: price.present ? price.value : this.price,
        total: total.present ? total.value : this.total,
      );
  @override
  String toString() {
    return (StringBuffer('DbDataItem(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('employeeId: $employeeId, ')
          ..write('employeeName: $employeeName, ')
          ..write('categoryId: $categoryId, ')
          ..write('categoryName: $categoryName, ')
          ..write('serviceId: $serviceId, ')
          ..write('serviceName: $serviceName, ')
          ..write('newCustomer: $newCustomer, ')
          ..write('regCustomer: $regCustomer, ')
          ..write('date: $date, ')
          ..write('cardPay: $cardPay, ')
          ..write('price: $price, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      phone,
      employeeId,
      employeeName,
      categoryId,
      categoryName,
      serviceId,
      serviceName,
      newCustomer,
      regCustomer,
      date,
      cardPay,
      price,
      total);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbDataItem &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.employeeId == this.employeeId &&
          other.employeeName == this.employeeName &&
          other.categoryId == this.categoryId &&
          other.categoryName == this.categoryName &&
          other.serviceId == this.serviceId &&
          other.serviceName == this.serviceName &&
          other.newCustomer == this.newCustomer &&
          other.regCustomer == this.regCustomer &&
          other.date == this.date &&
          other.cardPay == this.cardPay &&
          other.price == this.price &&
          other.total == this.total);
}

class DbDataItemsCompanion extends UpdateCompanion<DbDataItem> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> phone;
  final Value<int> employeeId;
  final Value<String?> employeeName;
  final Value<int> categoryId;
  final Value<String?> categoryName;
  final Value<int> serviceId;
  final Value<String?> serviceName;
  final Value<bool?> newCustomer;
  final Value<bool?> regCustomer;
  final Value<DateTime?> date;
  final Value<bool?> cardPay;
  final Value<double?> price;
  final Value<double?> total;
  const DbDataItemsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.employeeId = const Value.absent(),
    this.employeeName = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.serviceId = const Value.absent(),
    this.serviceName = const Value.absent(),
    this.newCustomer = const Value.absent(),
    this.regCustomer = const Value.absent(),
    this.date = const Value.absent(),
    this.cardPay = const Value.absent(),
    this.price = const Value.absent(),
    this.total = const Value.absent(),
  });
  DbDataItemsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    required int employeeId,
    this.employeeName = const Value.absent(),
    required int categoryId,
    this.categoryName = const Value.absent(),
    required int serviceId,
    this.serviceName = const Value.absent(),
    this.newCustomer = const Value.absent(),
    this.regCustomer = const Value.absent(),
    this.date = const Value.absent(),
    this.cardPay = const Value.absent(),
    this.price = const Value.absent(),
    this.total = const Value.absent(),
  })  : employeeId = Value(employeeId),
        categoryId = Value(categoryId),
        serviceId = Value(serviceId);
  static Insertable<DbDataItem> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<int>? employeeId,
    Expression<String>? employeeName,
    Expression<int>? categoryId,
    Expression<String>? categoryName,
    Expression<int>? serviceId,
    Expression<String>? serviceName,
    Expression<bool>? newCustomer,
    Expression<bool>? regCustomer,
    Expression<DateTime>? date,
    Expression<bool>? cardPay,
    Expression<double>? price,
    Expression<double>? total,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (employeeId != null) 'employee_id': employeeId,
      if (employeeName != null) 'employee_name': employeeName,
      if (categoryId != null) 'category_id': categoryId,
      if (categoryName != null) 'category_name': categoryName,
      if (serviceId != null) 'service_id': serviceId,
      if (serviceName != null) 'service_name': serviceName,
      if (newCustomer != null) 'new_customer': newCustomer,
      if (regCustomer != null) 'reg_customer': regCustomer,
      if (date != null) 'date': date,
      if (cardPay != null) 'card_pay': cardPay,
      if (price != null) 'price': price,
      if (total != null) 'total': total,
    });
  }

  DbDataItemsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<String?>? phone,
      Value<int>? employeeId,
      Value<String?>? employeeName,
      Value<int>? categoryId,
      Value<String?>? categoryName,
      Value<int>? serviceId,
      Value<String?>? serviceName,
      Value<bool?>? newCustomer,
      Value<bool?>? regCustomer,
      Value<DateTime?>? date,
      Value<bool?>? cardPay,
      Value<double?>? price,
      Value<double?>? total}) {
    return DbDataItemsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      employeeId: employeeId ?? this.employeeId,
      employeeName: employeeName ?? this.employeeName,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      serviceId: serviceId ?? this.serviceId,
      serviceName: serviceName ?? this.serviceName,
      newCustomer: newCustomer ?? this.newCustomer,
      regCustomer: regCustomer ?? this.regCustomer,
      date: date ?? this.date,
      cardPay: cardPay ?? this.cardPay,
      price: price ?? this.price,
      total: total ?? this.total,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (employeeId.present) {
      map['employee_id'] = Variable<int>(employeeId.value);
    }
    if (employeeName.present) {
      map['employee_name'] = Variable<String>(employeeName.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    if (serviceId.present) {
      map['service_id'] = Variable<int>(serviceId.value);
    }
    if (serviceName.present) {
      map['service_name'] = Variable<String>(serviceName.value);
    }
    if (newCustomer.present) {
      map['new_customer'] = Variable<bool>(newCustomer.value);
    }
    if (regCustomer.present) {
      map['reg_customer'] = Variable<bool>(regCustomer.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (cardPay.present) {
      map['card_pay'] = Variable<bool>(cardPay.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbDataItemsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('employeeId: $employeeId, ')
          ..write('employeeName: $employeeName, ')
          ..write('categoryId: $categoryId, ')
          ..write('categoryName: $categoryName, ')
          ..write('serviceId: $serviceId, ')
          ..write('serviceName: $serviceName, ')
          ..write('newCustomer: $newCustomer, ')
          ..write('regCustomer: $regCustomer, ')
          ..write('date: $date, ')
          ..write('cardPay: $cardPay, ')
          ..write('price: $price, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }
}

class $DbCostsTable extends DbCosts with TableInfo<$DbCostsTable, DbCost> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbCostsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isDeductFromTaxMeta =
      const VerificationMeta('isDeductFromTax');
  @override
  late final GeneratedColumn<bool> isDeductFromTax = GeneratedColumn<bool>(
      'is_deduct_from_tax', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_deduct_from_tax" IN (0, 1))'));
  static const VerificationMeta _isSystematicMeta =
      const VerificationMeta('isSystematic');
  @override
  late final GeneratedColumn<bool> isSystematic = GeneratedColumn<bool>(
      'is_systematic', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_systematic" IN (0, 1))'));
  static const VerificationMeta _repetitionIntervalMeta =
      const VerificationMeta('repetitionInterval');
  @override
  late final GeneratedColumn<String> repetitionInterval =
      GeneratedColumn<String>('repetition_interval', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _numberOfUnitsMeta =
      const VerificationMeta('numberOfUnits');
  @override
  late final GeneratedColumn<int> numberOfUnits = GeneratedColumn<int>(
      'number_of_units', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _unitsOfMeasurementMeta =
      const VerificationMeta('unitsOfMeasurement');
  @override
  late final GeneratedColumn<String> unitsOfMeasurement =
      GeneratedColumn<String>('units_of_measurement', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoriesMeta =
      const VerificationMeta('categories');
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> categories =
      GeneratedColumn<String>('categories', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($DbCostsTable.$convertercategories);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        isDeductFromTax,
        isSystematic,
        repetitionInterval,
        numberOfUnits,
        price,
        unitsOfMeasurement,
        categories,
        date
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'db_costs';
  @override
  VerificationContext validateIntegrity(Insertable<DbCost> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('is_deduct_from_tax')) {
      context.handle(
          _isDeductFromTaxMeta,
          isDeductFromTax.isAcceptableOrUnknown(
              data['is_deduct_from_tax']!, _isDeductFromTaxMeta));
    }
    if (data.containsKey('is_systematic')) {
      context.handle(
          _isSystematicMeta,
          isSystematic.isAcceptableOrUnknown(
              data['is_systematic']!, _isSystematicMeta));
    }
    if (data.containsKey('repetition_interval')) {
      context.handle(
          _repetitionIntervalMeta,
          repetitionInterval.isAcceptableOrUnknown(
              data['repetition_interval']!, _repetitionIntervalMeta));
    }
    if (data.containsKey('number_of_units')) {
      context.handle(
          _numberOfUnitsMeta,
          numberOfUnits.isAcceptableOrUnknown(
              data['number_of_units']!, _numberOfUnitsMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('units_of_measurement')) {
      context.handle(
          _unitsOfMeasurementMeta,
          unitsOfMeasurement.isAcceptableOrUnknown(
              data['units_of_measurement']!, _unitsOfMeasurementMeta));
    }
    context.handle(_categoriesMeta, const VerificationResult.success());
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbCost map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DbCost(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      isDeductFromTax: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_deduct_from_tax']),
      isSystematic: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_systematic']),
      repetitionInterval: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}repetition_interval']),
      numberOfUnits: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number_of_units']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price']),
      unitsOfMeasurement: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}units_of_measurement']),
      categories: $DbCostsTable.$convertercategories.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}categories'])!),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date']),
    );
  }

  @override
  $DbCostsTable createAlias(String alias) {
    return $DbCostsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertercategories =
      const StringListConverter();
}

class DbCost extends DataClass implements Insertable<DbCost> {
  final int id;
  final String? name;
  final bool? isDeductFromTax;
  final bool? isSystematic;
  final String? repetitionInterval;
  final int? numberOfUnits;
  final double? price;
  final String? unitsOfMeasurement;
  final List<String> categories;
  final DateTime? date;
  const DbCost(
      {required this.id,
      this.name,
      this.isDeductFromTax,
      this.isSystematic,
      this.repetitionInterval,
      this.numberOfUnits,
      this.price,
      this.unitsOfMeasurement,
      required this.categories,
      this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || isDeductFromTax != null) {
      map['is_deduct_from_tax'] = Variable<bool>(isDeductFromTax);
    }
    if (!nullToAbsent || isSystematic != null) {
      map['is_systematic'] = Variable<bool>(isSystematic);
    }
    if (!nullToAbsent || repetitionInterval != null) {
      map['repetition_interval'] = Variable<String>(repetitionInterval);
    }
    if (!nullToAbsent || numberOfUnits != null) {
      map['number_of_units'] = Variable<int>(numberOfUnits);
    }
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    if (!nullToAbsent || unitsOfMeasurement != null) {
      map['units_of_measurement'] = Variable<String>(unitsOfMeasurement);
    }
    {
      map['categories'] = Variable<String>(
          $DbCostsTable.$convertercategories.toSql(categories));
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  DbCostsCompanion toCompanion(bool nullToAbsent) {
    return DbCostsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      isDeductFromTax: isDeductFromTax == null && nullToAbsent
          ? const Value.absent()
          : Value(isDeductFromTax),
      isSystematic: isSystematic == null && nullToAbsent
          ? const Value.absent()
          : Value(isSystematic),
      repetitionInterval: repetitionInterval == null && nullToAbsent
          ? const Value.absent()
          : Value(repetitionInterval),
      numberOfUnits: numberOfUnits == null && nullToAbsent
          ? const Value.absent()
          : Value(numberOfUnits),
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      unitsOfMeasurement: unitsOfMeasurement == null && nullToAbsent
          ? const Value.absent()
          : Value(unitsOfMeasurement),
      categories: Value(categories),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory DbCost.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbCost(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      isDeductFromTax: serializer.fromJson<bool?>(json['isDeductFromTax']),
      isSystematic: serializer.fromJson<bool?>(json['isSystematic']),
      repetitionInterval:
          serializer.fromJson<String?>(json['repetitionInterval']),
      numberOfUnits: serializer.fromJson<int?>(json['numberOfUnits']),
      price: serializer.fromJson<double?>(json['price']),
      unitsOfMeasurement:
          serializer.fromJson<String?>(json['unitsOfMeasurement']),
      categories: serializer.fromJson<List<String>>(json['categories']),
      date: serializer.fromJson<DateTime?>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'isDeductFromTax': serializer.toJson<bool?>(isDeductFromTax),
      'isSystematic': serializer.toJson<bool?>(isSystematic),
      'repetitionInterval': serializer.toJson<String?>(repetitionInterval),
      'numberOfUnits': serializer.toJson<int?>(numberOfUnits),
      'price': serializer.toJson<double?>(price),
      'unitsOfMeasurement': serializer.toJson<String?>(unitsOfMeasurement),
      'categories': serializer.toJson<List<String>>(categories),
      'date': serializer.toJson<DateTime?>(date),
    };
  }

  DbCost copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<bool?> isDeductFromTax = const Value.absent(),
          Value<bool?> isSystematic = const Value.absent(),
          Value<String?> repetitionInterval = const Value.absent(),
          Value<int?> numberOfUnits = const Value.absent(),
          Value<double?> price = const Value.absent(),
          Value<String?> unitsOfMeasurement = const Value.absent(),
          List<String>? categories,
          Value<DateTime?> date = const Value.absent()}) =>
      DbCost(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        isDeductFromTax: isDeductFromTax.present
            ? isDeductFromTax.value
            : this.isDeductFromTax,
        isSystematic:
            isSystematic.present ? isSystematic.value : this.isSystematic,
        repetitionInterval: repetitionInterval.present
            ? repetitionInterval.value
            : this.repetitionInterval,
        numberOfUnits:
            numberOfUnits.present ? numberOfUnits.value : this.numberOfUnits,
        price: price.present ? price.value : this.price,
        unitsOfMeasurement: unitsOfMeasurement.present
            ? unitsOfMeasurement.value
            : this.unitsOfMeasurement,
        categories: categories ?? this.categories,
        date: date.present ? date.value : this.date,
      );
  @override
  String toString() {
    return (StringBuffer('DbCost(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isDeductFromTax: $isDeductFromTax, ')
          ..write('isSystematic: $isSystematic, ')
          ..write('repetitionInterval: $repetitionInterval, ')
          ..write('numberOfUnits: $numberOfUnits, ')
          ..write('price: $price, ')
          ..write('unitsOfMeasurement: $unitsOfMeasurement, ')
          ..write('categories: $categories, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      isDeductFromTax,
      isSystematic,
      repetitionInterval,
      numberOfUnits,
      price,
      unitsOfMeasurement,
      categories,
      date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbCost &&
          other.id == this.id &&
          other.name == this.name &&
          other.isDeductFromTax == this.isDeductFromTax &&
          other.isSystematic == this.isSystematic &&
          other.repetitionInterval == this.repetitionInterval &&
          other.numberOfUnits == this.numberOfUnits &&
          other.price == this.price &&
          other.unitsOfMeasurement == this.unitsOfMeasurement &&
          other.categories == this.categories &&
          other.date == this.date);
}

class DbCostsCompanion extends UpdateCompanion<DbCost> {
  final Value<int> id;
  final Value<String?> name;
  final Value<bool?> isDeductFromTax;
  final Value<bool?> isSystematic;
  final Value<String?> repetitionInterval;
  final Value<int?> numberOfUnits;
  final Value<double?> price;
  final Value<String?> unitsOfMeasurement;
  final Value<List<String>> categories;
  final Value<DateTime?> date;
  const DbCostsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isDeductFromTax = const Value.absent(),
    this.isSystematic = const Value.absent(),
    this.repetitionInterval = const Value.absent(),
    this.numberOfUnits = const Value.absent(),
    this.price = const Value.absent(),
    this.unitsOfMeasurement = const Value.absent(),
    this.categories = const Value.absent(),
    this.date = const Value.absent(),
  });
  DbCostsCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isDeductFromTax = const Value.absent(),
    this.isSystematic = const Value.absent(),
    this.repetitionInterval = const Value.absent(),
    this.numberOfUnits = const Value.absent(),
    this.price = const Value.absent(),
    this.unitsOfMeasurement = const Value.absent(),
    required List<String> categories,
    this.date = const Value.absent(),
  }) : categories = Value(categories);
  static Insertable<DbCost> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? isDeductFromTax,
    Expression<bool>? isSystematic,
    Expression<String>? repetitionInterval,
    Expression<int>? numberOfUnits,
    Expression<double>? price,
    Expression<String>? unitsOfMeasurement,
    Expression<String>? categories,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isDeductFromTax != null) 'is_deduct_from_tax': isDeductFromTax,
      if (isSystematic != null) 'is_systematic': isSystematic,
      if (repetitionInterval != null) 'repetition_interval': repetitionInterval,
      if (numberOfUnits != null) 'number_of_units': numberOfUnits,
      if (price != null) 'price': price,
      if (unitsOfMeasurement != null)
        'units_of_measurement': unitsOfMeasurement,
      if (categories != null) 'categories': categories,
      if (date != null) 'date': date,
    });
  }

  DbCostsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<bool?>? isDeductFromTax,
      Value<bool?>? isSystematic,
      Value<String?>? repetitionInterval,
      Value<int?>? numberOfUnits,
      Value<double?>? price,
      Value<String?>? unitsOfMeasurement,
      Value<List<String>>? categories,
      Value<DateTime?>? date}) {
    return DbCostsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isDeductFromTax: isDeductFromTax ?? this.isDeductFromTax,
      isSystematic: isSystematic ?? this.isSystematic,
      repetitionInterval: repetitionInterval ?? this.repetitionInterval,
      numberOfUnits: numberOfUnits ?? this.numberOfUnits,
      price: price ?? this.price,
      unitsOfMeasurement: unitsOfMeasurement ?? this.unitsOfMeasurement,
      categories: categories ?? this.categories,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isDeductFromTax.present) {
      map['is_deduct_from_tax'] = Variable<bool>(isDeductFromTax.value);
    }
    if (isSystematic.present) {
      map['is_systematic'] = Variable<bool>(isSystematic.value);
    }
    if (repetitionInterval.present) {
      map['repetition_interval'] = Variable<String>(repetitionInterval.value);
    }
    if (numberOfUnits.present) {
      map['number_of_units'] = Variable<int>(numberOfUnits.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (unitsOfMeasurement.present) {
      map['units_of_measurement'] = Variable<String>(unitsOfMeasurement.value);
    }
    if (categories.present) {
      map['categories'] = Variable<String>(
          $DbCostsTable.$convertercategories.toSql(categories.value));
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbCostsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isDeductFromTax: $isDeductFromTax, ')
          ..write('isSystematic: $isSystematic, ')
          ..write('repetitionInterval: $repetitionInterval, ')
          ..write('numberOfUnits: $numberOfUnits, ')
          ..write('price: $price, ')
          ..write('unitsOfMeasurement: $unitsOfMeasurement, ')
          ..write('categories: $categories, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $DbEmployeesTable dbEmployees = $DbEmployeesTable(this);
  late final $DbCategoriesTable dbCategories = $DbCategoriesTable(this);
  late final $DbServicesTable dbServices = $DbServicesTable(this);
  late final $DbDataItemsTable dbDataItems = $DbDataItemsTable(this);
  late final $DbCostsTable dbCosts = $DbCostsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [dbEmployees, dbCategories, dbServices, dbDataItems, dbCosts];
}
