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

  /// `Enter your last name`
  String get enterYourLastName {
    return Intl.message(
      'Enter your last name',
      name: 'enterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your login`
  String get enterYourLogin {
    return Intl.message(
      'Enter your login',
      name: 'enterYourLogin',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Select Categories from the list\n(maybe several)`
  String get selectCategoriesFromTheListnmaybeSeveral {
    return Intl.message(
      'Select Categories from the list\n(maybe several)',
      name: 'selectCategoriesFromTheListnmaybeSeveral',
      desc: '',
      args: [],
    );
  }

  /// `Set percentage of income if necessary`
  String get setPercentageOfIncomeIfNecessary {
    return Intl.message(
      'Set percentage of income if necessary',
      name: 'setPercentageOfIncomeIfNecessary',
      desc: '',
      args: [],
    );
  }

  /// `Set percentage of income`
  String get setPercentageOfIncome {
    return Intl.message(
      'Set percentage of income',
      name: 'setPercentageOfIncome',
      desc: '',
      args: [],
    );
  }

  /// `Percentage`
  String get percentage {
    return Intl.message(
      'Percentage',
      name: 'percentage',
      desc: '',
      args: [],
    );
  }

  /// ` Visibility level with a cross from the list`
  String get visibilityLevelWithACrossFromTheList {
    return Intl.message(
      ' Visibility level with a cross from the list',
      name: 'visibilityLevelWithACrossFromTheList',
      desc: '',
      args: [],
    );
  }

  /// `Employee Percentage`
  String get employeePercentage {
    return Intl.message(
      'Employee Percentage',
      name: 'employeePercentage',
      desc: '',
      args: [],
    );
  }

  /// `Total Percentage per month`
  String get totalPercentagePerMonth {
    return Intl.message(
      'Total Percentage per month',
      name: 'totalPercentagePerMonth',
      desc: '',
      args: [],
    );
  }

  /// `Amount Percentage per day`
  String get amountPercentagePerDay {
    return Intl.message(
      'Amount Percentage per day',
      name: 'amountPercentagePerDay',
      desc: '',
      args: [],
    );
  }

  /// `Show Phone`
  String get showPhone {
    return Intl.message(
      'Show Phone',
      name: 'showPhone',
      desc: '',
      args: [],
    );
  }

  /// `Total Price Service per day`
  String get totalPriceServicePerDay {
    return Intl.message(
      'Total Price Service per day',
      name: 'totalPriceServicePerDay',
      desc: '',
      args: [],
    );
  }

  /// `Save Employee`
  String get saveEmployee {
    return Intl.message(
      'Save Employee',
      name: 'saveEmployee',
      desc: '',
      args: [],
    );
  }

  /// `Number of Service for month`
  String get numberOfServiceForMonth {
    return Intl.message(
      'Number of Service for month',
      name: 'numberOfServiceForMonth',
      desc: '',
      args: [],
    );
  }

  /// `Hello `
  String get hello {
    return Intl.message(
      'Hello ',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Add Report`
  String get addReport {
    return Intl.message(
      'Add Report',
      name: 'addReport',
      desc: '',
      args: [],
    );
  }

  /// `Name of Client`
  String get nameOfClient {
    return Intl.message(
      'Name of Client',
      name: 'nameOfClient',
      desc: '',
      args: [],
    );
  }

  /// `Last Name of Client`
  String get lastNameOfClient {
    return Intl.message(
      'Last Name of Client',
      name: 'lastNameOfClient',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `New Customer`
  String get newCustomer {
    return Intl.message(
      'New Customer',
      name: 'newCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Regular Customer`
  String get regularCustomer {
    return Intl.message(
      'Regular Customer',
      name: 'regularCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Payment by Cash`
  String get paymentByCard {
    return Intl.message(
      'Payment by Cash',
      name: 'paymentByCard',
      desc: '',
      args: [],
    );
  }

  /// `Select Category`
  String get selectCategory {
    return Intl.message(
      'Select Category',
      name: 'selectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Select Service`
  String get selectService {
    return Intl.message(
      'Select Service',
      name: 'selectService',
      desc: '',
      args: [],
    );
  }

  /// `Price of Service`
  String get priceOfService {
    return Intl.message(
      'Price of Service',
      name: 'priceOfService',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Add Service`
  String get addService {
    return Intl.message(
      'Add Service',
      name: 'addService',
      desc: '',
      args: [],
    );
  }

  /// `Select a category`
  String get createOrSelectACategory {
    return Intl.message(
      'Select a category',
      name: 'createOrSelectACategory',
      desc: '',
      args: [],
    );
  }

  /// `Or Create a new Category`
  String get orCreateANewCategory {
    return Intl.message(
      'Or Create a new Category',
      name: 'orCreateANewCategory',
      desc: '',
      args: [],
    );
  }

  /// `Enter Category Name`
  String get enterCategoryName {
    return Intl.message(
      'Enter Category Name',
      name: 'enterCategoryName',
      desc: '',
      args: [],
    );
  }

  /// `Create a Service`
  String get nameOfTheService {
    return Intl.message(
      'Create a Service',
      name: 'nameOfTheService',
      desc: '',
      args: [],
    );
  }

  /// `Category Name`
  String get categoryName {
    return Intl.message(
      'Category Name',
      name: 'categoryName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Service Name`
  String get enterServiceName {
    return Intl.message(
      'Enter Service Name',
      name: 'enterServiceName',
      desc: '',
      args: [],
    );
  }

  /// `Service Name`
  String get serviceName {
    return Intl.message(
      'Service Name',
      name: 'serviceName',
      desc: '',
      args: [],
    );
  }

  /// `Cost of Materials for this Services`
  String get costOfMaterialsForThisServices {
    return Intl.message(
      'Cost of Materials for this Services',
      name: 'costOfMaterialsForThisServices',
      desc: '',
      args: [],
    );
  }

  /// `Enter Price`
  String get enterPrice {
    return Intl.message(
      'Enter Price',
      name: 'enterPrice',
      desc: '',
      args: [],
    );
  }

  /// `Admin Login`
  String get adminLogin {
    return Intl.message(
      'Admin Login',
      name: 'adminLogin',
      desc: '',
      args: [],
    );
  }

  /// `Set Admin Password `
  String get setAdminPassword {
    return Intl.message(
      'Set Admin Password ',
      name: 'setAdminPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter password here`
  String get enterPasswordHere {
    return Intl.message(
      'Enter password here',
      name: 'enterPasswordHere',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset here`
  String get resetHere {
    return Intl.message(
      'Reset here',
      name: 'resetHere',
      desc: '',
      args: [],
    );
  }

  /// `Exit`
  String get exit {
    return Intl.message(
      'Exit',
      name: 'exit',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure? You want to exit the app.`
  String get areYouSureYouWantToExitTheApp {
    return Intl.message(
      'Are you sure? You want to exit the app.',
      name: 'areYouSureYouWantToExitTheApp',
      desc: '',
      args: [],
    );
  }

  /// `Exit App`
  String get exitApp {
    return Intl.message(
      'Exit App',
      name: 'exitApp',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Costs Filter`
  String get costsFilter {
    return Intl.message(
      'Costs Filter',
      name: 'costsFilter',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Name of cost`
  String get nameOfCost {
    return Intl.message(
      'Name of cost',
      name: 'nameOfCost',
      desc: '',
      args: [],
    );
  }

  /// `Costs Price Range`
  String get costsPriceRange {
    return Intl.message(
      'Costs Price Range',
      name: 'costsPriceRange',
      desc: '',
      args: [],
    );
  }

  /// `Min Price`
  String get minPrice {
    return Intl.message(
      'Min Price',
      name: 'minPrice',
      desc: '',
      args: [],
    );
  }

  /// `Max Price`
  String get maxPrice {
    return Intl.message(
      'Max Price',
      name: 'maxPrice',
      desc: '',
      args: [],
    );
  }

  /// `Apply Filter`
  String get applyFilter {
    return Intl.message(
      'Apply Filter',
      name: 'applyFilter',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Edit Category`
  String get editCategory {
    return Intl.message(
      'Edit Category',
      name: 'editCategory',
      desc: '',
      args: [],
    );
  }

  /// `Edit Service`
  String get editService {
    return Intl.message(
      'Edit Service',
      name: 'editService',
      desc: '',
      args: [],
    );
  }

  /// `Answer the security questions to login`
  String get answerTheSecurityQuestionsToLogin {
    return Intl.message(
      'Answer the security questions to login',
      name: 'answerTheSecurityQuestionsToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Answer`
  String get answer {
    return Intl.message(
      'Answer',
      name: 'answer',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect answer`
  String get incorrectAnswer {
    return Intl.message(
      'Incorrect answer',
      name: 'incorrectAnswer',
      desc: '',
      args: [],
    );
  }

  /// `Please try again`
  String get pleaseTryAgain {
    return Intl.message(
      'Please try again',
      name: 'pleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Previous Question `
  String get previousQuestion {
    return Intl.message(
      'Previous Question ',
      name: 'previousQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Select Question`
  String get selectQuestion {
    return Intl.message(
      'Select Question',
      name: 'selectQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Please select a question`
  String get pleaseSelectAQuestion {
    return Intl.message(
      'Please select a question',
      name: 'pleaseSelectAQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in the answer field`
  String get pleaseFillInTheAnswerField {
    return Intl.message(
      'Please fill in the answer field',
      name: 'pleaseFillInTheAnswerField',
      desc: '',
      args: [],
    );
  }

  /// `Report: `
  String get report {
    return Intl.message(
      'Report: ',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `Employee Name: `
  String get employeeName {
    return Intl.message(
      'Employee Name: ',
      name: 'employeeName',
      desc: '',
      args: [],
    );
  }

  /// `Is Regular Cus. : `
  String get isRegularCus {
    return Intl.message(
      'Is Regular Cus. : ',
      name: 'isRegularCus',
      desc: '',
      args: [],
    );
  }

  /// `Cash Pay: `
  String get cardPay {
    return Intl.message(
      'Cash Pay: ',
      name: 'cardPay',
      desc: '',
      args: [],
    );
  }

  /// `Date `
  String get date {
    return Intl.message(
      'Date ',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Category: `
  String get category {
    return Intl.message(
      'Category: ',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get service {
    return Intl.message(
      'Service',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `Edit Report`
  String get editReport {
    return Intl.message(
      'Edit Report',
      name: 'editReport',
      desc: '',
      args: [],
    );
  }

  /// `Employees`
  String get employees {
    return Intl.message(
      'Employees',
      name: 'employees',
      desc: '',
      args: [],
    );
  }

  /// `No Employee Found\nPlease add a new employee.`
  String get noEmployeeFoundnpleaseAddANewEmployee {
    return Intl.message(
      'No Employee Found\nPlease add a new employee.',
      name: 'noEmployeeFoundnpleaseAddANewEmployee',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Access Level`
  String get accessLevel {
    return Intl.message(
      'Access Level',
      name: 'accessLevel',
      desc: '',
      args: [],
    );
  }

  /// `Not Limited`
  String get notLimited {
    return Intl.message(
      'Not Limited',
      name: 'notLimited',
      desc: '',
      args: [],
    );
  }

  /// `Limited`
  String get limited {
    return Intl.message(
      'Limited',
      name: 'limited',
      desc: '',
      args: [],
    );
  }

  /// `Apply Filters`
  String get applyFilters {
    return Intl.message(
      'Apply Filters',
      name: 'applyFilters',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filters {
    return Intl.message(
      'Filters',
      name: 'filters',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Price Range`
  String get priceRange {
    return Intl.message(
      'Price Range',
      name: 'priceRange',
      desc: '',
      args: [],
    );
  }

  /// `Dates`
  String get dates {
    return Intl.message(
      'Dates',
      name: 'dates',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Masters`
  String get masters {
    return Intl.message(
      'Masters',
      name: 'masters',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message(
      'Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Name of\nCost`
  String get nameOfncost {
    return Intl.message(
      'Name of\nCost',
      name: 'nameOfncost',
      desc: '',
      args: [],
    );
  }

  /// `Related\nCategories`
  String get relatedncategories {
    return Intl.message(
      'Related\nCategories',
      name: 'relatedncategories',
      desc: '',
      args: [],
    );
  }

  /// `Deducted\nFrom TAX`
  String get deductednfromTax {
    return Intl.message(
      'Deducted\nFrom TAX',
      name: 'deductednfromTax',
      desc: '',
      args: [],
    );
  }

  /// `Systematic\nExpenditure`
  String get systematicnexpenditure {
    return Intl.message(
      'Systematic\nExpenditure',
      name: 'systematicnexpenditure',
      desc: '',
      args: [],
    );
  }

  /// `Delete Cost`
  String get deleteCost {
    return Intl.message(
      'Delete Cost',
      name: 'deleteCost',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this cost?`
  String get areYouSureYouWantToDeleteThisCost {
    return Intl.message(
      'Are you sure you want to delete this cost?',
      name: 'areYouSureYouWantToDeleteThisCost',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get noData {
    return Intl.message(
      'No data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Reg\nCus`
  String get regncus {
    return Intl.message(
      'Reg\nCus',
      name: 'regncus',
      desc: '',
      args: [],
    );
  }

  /// `Cash\nPay`
  String get cardnpay {
    return Intl.message(
      'Cash\nPay',
      name: 'cardnpay',
      desc: '',
      args: [],
    );
  }

  /// `Employee\nInformation`
  String get employeendata {
    return Intl.message(
      'Employee\nInformation',
      name: 'employeendata',
      desc: '',
      args: [],
    );
  }

  /// `Customer\nInformation`
  String get customerndata {
    return Intl.message(
      'Customer\nInformation',
      name: 'customerndata',
      desc: '',
      args: [],
    );
  }

  /// `New\nCus`
  String get newncus {
    return Intl.message(
      'New\nCus',
      name: 'newncus',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Deleted`
  String get deleted {
    return Intl.message(
      'Deleted',
      name: 'deleted',
      desc: '',
      args: [],
    );
  }

  /// `Item deleted`
  String get itemDeleted {
    return Intl.message(
      'Item deleted',
      name: 'itemDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Delete Category`
  String get deleteCategory {
    return Intl.message(
      'Delete Category',
      name: 'deleteCategory',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this category?`
  String get areYouSureYouWantToDeleteThisCategory {
    return Intl.message(
      'Are you sure you want to delete this category?',
      name: 'areYouSureYouWantToDeleteThisCategory',
      desc: '',
      args: [],
    );
  }

  /// `Delete Service`
  String get deleteService {
    return Intl.message(
      'Delete Service',
      name: 'deleteService',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this service?`
  String get areYouSureYouWantToDeleteThisService {
    return Intl.message(
      'Are you sure you want to delete this service?',
      name: 'areYouSureYouWantToDeleteThisService',
      desc: '',
      args: [],
    );
  }

  /// `No Services Found\nPlease add a new service`
  String get noServicesFoundnpleaseAddANewService {
    return Intl.message(
      'No Services Found\nPlease add a new service',
      name: 'noServicesFoundnpleaseAddANewService',
      desc: '',
      args: [],
    );
  }

  /// `Backup restored successfully!`
  String get backupRestoredSuccessfully {
    return Intl.message(
      'Backup restored successfully!',
      name: 'backupRestoredSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Reload App`
  String get reloadApp {
    return Intl.message(
      'Reload App',
      name: 'reloadApp',
      desc: '',
      args: [],
    );
  }

  /// `Restoring database...`
  String get restoringDatabase {
    return Intl.message(
      'Restoring database...',
      name: 'restoringDatabase',
      desc: '',
      args: [],
    );
  }

  /// `Exported`
  String get exported {
    return Intl.message(
      'Exported',
      name: 'exported',
      desc: '',
      args: [],
    );
  }

  /// `Check your file in the Downloads folder`
  String get checkYourFileInTheDownloadsFolder {
    return Intl.message(
      'Check your file in the Downloads folder',
      name: 'checkYourFileInTheDownloadsFolder',
      desc: '',
      args: [],
    );
  }

  /// `Select the database to restore`
  String get selectTheDatabaseToRestore {
    return Intl.message(
      'Select the database to restore',
      name: 'selectTheDatabaseToRestore',
      desc: '',
      args: [],
    );
  }

  /// `Reports/Sales Tracker`
  String get reportssalesTracker {
    return Intl.message(
      'Reports/Sales Tracker',
      name: 'reportssalesTracker',
      desc: '',
      args: [],
    );
  }

  /// `Costs Tracker`
  String get costsTracker {
    return Intl.message(
      'Costs Tracker',
      name: 'costsTracker',
      desc: '',
      args: [],
    );
  }

  /// `Clear Dates`
  String get clearDates {
    return Intl.message(
      'Clear Dates',
      name: 'clearDates',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get anErrorOccurred {
    return Intl.message(
      'An error occurred',
      name: 'anErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `No data found`
  String get noDataFound {
    return Intl.message(
      'No data found',
      name: 'noDataFound',
      desc: '',
      args: [],
    );
  }

  /// `Master\nName`
  String get masternname {
    return Intl.message(
      'Master\nName',
      name: 'masternname',
      desc: '',
      args: [],
    );
  }

  /// `No. Reg\nClient`
  String get noRegnclient {
    return Intl.message(
      'No. Reg\nClient',
      name: 'noRegnclient',
      desc: '',
      args: [],
    );
  }

  /// `No. New\nClient`
  String get noNewnclient {
    return Intl.message(
      'No. New\nClient',
      name: 'noNewnclient',
      desc: '',
      args: [],
    );
  }

  /// `No of\nservices`
  String get noOfnservices {
    return Intl.message(
      'No of\nservices',
      name: 'noOfnservices',
      desc: '',
      args: [],
    );
  }

  /// `Cost`
  String get cost {
    return Intl.message(
      'Cost',
      name: 'cost',
      desc: '',
      args: [],
    );
  }

  /// `New\nClient`
  String get newnclient {
    return Intl.message(
      'New\nClient',
      name: 'newnclient',
      desc: '',
      args: [],
    );
  }

  /// `Reg\nClient`
  String get regnclient {
    return Intl.message(
      'Reg\nClient',
      name: 'regnclient',
      desc: '',
      args: [],
    );
  }

  /// `Num. of\nServices`
  String get numOfnservices {
    return Intl.message(
      'Num. of\nServices',
      name: 'numOfnservices',
      desc: '',
      args: [],
    );
  }

  /// `Costs`
  String get costs {
    return Intl.message(
      'Costs',
      name: 'costs',
      desc: '',
      args: [],
    );
  }

  /// `Sales`
  String get sales {
    return Intl.message(
      'Sales',
      name: 'sales',
      desc: '',
      args: [],
    );
  }

  /// `Please add a category first to add an employee`
  String get pleaseAddACategoryFirstToAddAnEmployee {
    return Intl.message(
      'Please add a category first to add an employee',
      name: 'pleaseAddACategoryFirstToAddAnEmployee',
      desc: '',
      args: [],
    );
  }

  /// `Add Category First`
  String get addCategoryFirst {
    return Intl.message(
      'Add Category First',
      name: 'addCategoryFirst',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure? You want to logout.`
  String get areYouSureYouWantToLogout {
    return Intl.message(
      'Are you sure? You want to logout.',
      name: 'areYouSureYouWantToLogout',
      desc: '',
      args: [],
    );
  }

  /// `Graphics`
  String get graphics {
    return Intl.message(
      'Graphics',
      name: 'graphics',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get results {
    return Intl.message(
      'Results',
      name: 'results',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message(
      'Reports',
      name: 'reports',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Login or password is incorrect`
  String get loginOrPasswordIsIncorrect {
    return Intl.message(
      'Login or password is incorrect',
      name: 'loginOrPasswordIsIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Milliliters`
  String get milliliters {
    return Intl.message(
      'Milliliters',
      name: 'milliliters',
      desc: '',
      args: [],
    );
  }

  /// `KW/h`
  String get kwh {
    return Intl.message(
      'KW/h',
      name: 'kwh',
      desc: '',
      args: [],
    );
  }

  /// `Kilograms`
  String get kilograms {
    return Intl.message(
      'Kilograms',
      name: 'kilograms',
      desc: '',
      args: [],
    );
  }

  /// `Liters`
  String get letters {
    return Intl.message(
      'Liters',
      name: 'letters',
      desc: '',
      args: [],
    );
  }

  /// `Pieces`
  String get pieces {
    return Intl.message(
      'Pieces',
      name: 'pieces',
      desc: '',
      args: [],
    );
  }

  /// `Grams`
  String get grams {
    return Intl.message(
      'Grams',
      name: 'grams',
      desc: '',
      args: [],
    );
  }

  /// `Boxes`
  String get boxes {
    return Intl.message(
      'Boxes',
      name: 'boxes',
      desc: '',
      args: [],
    );
  }

  /// `There is only one cost added yet add more to plot the graph`
  String get thereIsOnlyOneCostAddedYetAddMoreTo {
    return Intl.message(
      'There is only one cost added yet add more to plot the graph',
      name: 'thereIsOnlyOneCostAddedYetAddMoreTo',
      desc: '',
      args: [],
    );
  }

  /// `No Costs added yet`
  String get noCostsAddedYet {
    return Intl.message(
      'No Costs added yet',
      name: 'noCostsAddedYet',
      desc: '',
      args: [],
    );
  }

  /// `All costs are added on the same date, add more to plot the graph`
  String get allCostsAreAddedOnTheSameDateAddMore {
    return Intl.message(
      'All costs are added on the same date, add more to plot the graph',
      name: 'allCostsAreAddedOnTheSameDateAddMore',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Statistic`
  String get statistic {
    return Intl.message(
      'Statistic',
      name: 'statistic',
      desc: '',
      args: [],
    );
  }

  /// `Cost of\nmaterials`
  String get costOfMaterials {
    return Intl.message(
      'Cost of\nmaterials',
      name: 'costOfMaterials',
      desc: '',
      args: [],
    );
  }

  /// `Price\nservices`
  String get pricenservices {
    return Intl.message(
      'Price\nservices',
      name: 'pricenservices',
      desc: '',
      args: [],
    );
  }

  /// `Net\nprofit`
  String get netProfit {
    return Intl.message(
      'Net\nprofit',
      name: 'netProfit',
      desc: '',
      args: [],
    );
  }

  /// `What is the name of your favorite pet?`
  String get whatIsTheNameOfYourFavoritePet {
    return Intl.message(
      'What is the name of your favorite pet?',
      name: 'whatIsTheNameOfYourFavoritePet',
      desc: '',
      args: [],
    );
  }

  /// `Whats Your Childhood Nickname?`
  String get whatsYourChildhoodNickname {
    return Intl.message(
      'Whats Your Childhood Nickname?',
      name: 'whatsYourChildhoodNickname',
      desc: '',
      args: [],
    );
  }

  /// `What is your favorite movie?`
  String get whatIsYourFavoriteMovie {
    return Intl.message(
      'What is your favorite movie?',
      name: 'whatIsYourFavoriteMovie',
      desc: '',
      args: [],
    );
  }

  /// `What is your favorite book?`
  String get whatIsYourFavoriteBook {
    return Intl.message(
      'What is your favorite book?',
      name: 'whatIsYourFavoriteBook',
      desc: '',
      args: [],
    );
  }

  /// `What is your favorite food?`
  String get whatIsYourFavoriteFood {
    return Intl.message(
      'What is your favorite food?',
      name: 'whatIsYourFavoriteFood',
      desc: '',
      args: [],
    );
  }

  /// `What is your favorite song?`
  String get whatIsYourFavoriteSong {
    return Intl.message(
      'What is your favorite song?',
      name: 'whatIsYourFavoriteSong',
      desc: '',
      args: [],
    );
  }

  /// `What is your favorite color?`
  String get whatIsYourFavoriteColor {
    return Intl.message(
      'What is your favorite color?',
      name: 'whatIsYourFavoriteColor',
      desc: '',
      args: [],
    );
  }

  /// `number`
  String get number {
    return Intl.message(
      'number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `View Services before 7 days`
  String get viewServicesBefore7Days {
    return Intl.message(
      'View Services before 7 days',
      name: 'viewServicesBefore7Days',
      desc: '',
      args: [],
    );
  }

  /// `Can add a phone number`
  String get canAddAPhoneNumber {
    return Intl.message(
      'Can add a phone number',
      name: 'canAddAPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invalid pin`
  String get invalidPin {
    return Intl.message(
      'Invalid pin',
      name: 'invalidPin',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Enter a note`
  String get enterANote {
    return Intl.message(
      'Enter a note',
      name: 'enterANote',
      desc: '',
      args: [],
    );
  }

  /// `characters`
  String get characters {
    return Intl.message(
      'characters',
      name: 'characters',
      desc: '',
      args: [],
    );
  }

  /// `Employee will be deleted Permanently`
  String get employeeWillBeDeletedPermanently {
    return Intl.message(
      'Employee will be deleted Permanently',
      name: 'employeeWillBeDeletedPermanently',
      desc: '',
      args: [],
    );
  }

  /// `Payment By Cash`
  String get paymentByCash {
    return Intl.message(
      'Payment By Cash',
      name: 'paymentByCash',
      desc: '',
      args: [],
    );
  }

  /// ` (Optionally)`
  String get optionally {
    return Intl.message(
      ' (Optionally)',
      name: 'optionally',
      desc: '',
      args: [],
    );
  }

  /// `Pieces, Liters, Kilograms .. `
  String get piecesLitersKilograms {
    return Intl.message(
      'Pieces, Liters, Kilograms .. ',
      name: 'piecesLitersKilograms',
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
