import 'dart:developer';

import '../../../models/service.dart';
import '../../../models/caregory.dart';

class TableItem {
  String customerData;
  DateTime date;
  Category category;
  Service typeOfService;
  String price;
  String total;
  bool isNewCustomer;
  String percentage;
  bool cardPay;

  TableItem({
    required this.customerData,
    required this.date,
    required this.category,
    required this.typeOfService,
    required this.price,
    required this.total,
    this.isNewCustomer = false,
    this.cardPay = false,
    required this.percentage,
  });

  get(String fieldName) {
    if (fieldName == 'customerData') {
      return customerData;
    } else if (fieldName == 'date') {
      return date;
    } else if (fieldName == 'category') {
      return category;
    } else if (fieldName == 'typeOfService') {
      return typeOfService;
    } else if (fieldName == 'price') {
      return price;
    } else if (fieldName == 'total') {
      return total;
    } else if (fieldName == 'isNewCustomer') {
      return isNewCustomer;
    } else if (fieldName == 'percentage') {
      return percentage;
    } else if (fieldName == 'cardPay') {
      return cardPay;
    }

    throw Exception('Invalid field name');
  }
}
