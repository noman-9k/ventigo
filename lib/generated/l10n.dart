// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Add Cost`
  String get addCost {
    return Intl.message(
      'Add Cost',
      name: 'addCost',
      desc: '',
      args: [],
    );
  }

  /// `Repetition Interval`
  String get repetitionInterval {
    return Intl.message(
      'Repetition Interval',
      name: 'repetitionInterval',
      desc: '',
      args: [],
    );
  }

  /// `Do Not Repeat`
  String get doNotRepeat {
    return Intl.message(
      'Do Not Repeat',
      name: 'doNotRepeat',
      desc: '',
      args: [],
    );
  }

  /// `Every Day`
  String get everyDay {
    return Intl.message(
      'Every Day',
      name: 'everyDay',
      desc: '',
      args: [],
    );
  }

  /// `Name `
  String get name {
    return Intl.message(
      'Name ',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Name of expense`
  String get nameOfExpense {
    return Intl.message(
      'Name of expense',
      name: 'nameOfExpense',
      desc: '',
      args: [],
    );
  }

  /// `Select categories`
  String get selectCategories {
    return Intl.message(
      'Select categories',
      name: 'selectCategories',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Deduct from TAX`
  String get deductFromTax {
    return Intl.message(
      'Deduct from TAX',
      name: 'deductFromTax',
      desc: '',
      args: [],
    );
  }

  /// `Systematic expenditure`
  String get systematicExpenditure {
    return Intl.message(
      'Systematic expenditure',
      name: 'systematicExpenditure',
      desc: '',
      args: [],
    );
  }

  /// `Every Week`
  String get everyWeek {
    return Intl.message(
      'Every Week',
      name: 'everyWeek',
      desc: '',
      args: [],
    );
  }

  /// `Every Month`
  String get everyMonth {
    return Intl.message(
      'Every Month',
      name: 'everyMonth',
      desc: '',
      args: [],
    );
  }

  /// `Every Quarter`
  String get everyQuarter {
    return Intl.message(
      'Every Quarter',
      name: 'everyQuarter',
      desc: '',
      args: [],
    );
  }

  /// `Every Year`
  String get everyYear {
    return Intl.message(
      'Every Year',
      name: 'everyYear',
      desc: '',
      args: [],
    );
  }

  /// `Number of Units`
  String get numberOfUnits {
    return Intl.message(
      'Number of Units',
      name: 'numberOfUnits',
      desc: '',
      args: [],
    );
  }

  /// `Unit Price`
  String get unitPrice {
    return Intl.message(
      'Unit Price',
      name: 'unitPrice',
      desc: '',
      args: [],
    );
  }

  /// `Unit of measurements`
  String get unitOfMeasurements {
    return Intl.message(
      'Unit of measurements',
      name: 'unitOfMeasurements',
      desc: '',
      args: [],
    );
  }

  /// `No Unit of Measurements`
  String get noUnitOfMeasurements {
    return Intl.message(
      'No Unit of Measurements',
      name: 'noUnitOfMeasurements',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Add Employee`
  String get addEmployee {
    return Intl.message(
      'Add Employee',
      name: 'addEmployee',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Change Admin Password`
  String get changeAdminPassword {
    return Intl.message(
      'Change Admin Password',
      name: 'changeAdminPassword',
      desc: '',
      args: [],
    );
  }

  /// `Export to file`
  String get exportToFile {
    return Intl.message(
      'Export to file',
      name: 'exportToFile',
      desc: '',
      args: [],
    );
  }

  /// `Security Questions`
  String get securityQuestions {
    return Intl.message(
      'Security Questions',
      name: 'securityQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Data Backup`
  String get dataBackup {
    return Intl.message(
      'Data Backup',
      name: 'dataBackup',
      desc: '',
      args: [],
    );
  }

  /// `BackUp Data`
  String get backupData {
    return Intl.message(
      'BackUp Data',
      name: 'backupData',
      desc: '',
      args: [],
    );
  }

  /// `Restore Data`
  String get restoreData {
    return Intl.message(
      'Restore Data',
      name: 'restoreData',
      desc: '',
      args: [],
    );
  }

  /// `Clear Data`
  String get clearData {
    return Intl.message(
      'Clear Data',
      name: 'clearData',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to clear all data?`
  String get areYouSureYouWantToClearAllData {
    return Intl.message(
      'Are you sure you want to clear all data?',
      name: 'areYouSureYouWantToClearAllData',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Or sign in as`
  String get orSignInAs {
    return Intl.message(
      'Or sign in as',
      name: 'orSignInAs',
      desc: '',
      args: [],
    );
  }

  /// `Admin Maine`
  String get adminMaine {
    return Intl.message(
      'Admin Maine',
      name: 'adminMaine',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'bg'),
      Locale.fromSubtags(languageCode: 'cs'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
