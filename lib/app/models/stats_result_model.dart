class StatResultModel {
  StatResultModel({
    required this.employeeName,
    required this.totalPrice,
    required this.isRegCustomer,
    required this.isNewCustomer,
    required this.totalServices,
    required this.totalCost,
    // required this.allServicesIdsList,
    this.date,
  });

  final String employeeName;
  final double totalPrice;
  final bool isRegCustomer;
  final bool isNewCustomer;
  final int totalServices;
  final double totalCost;
  // final List<int> allServicesIdsList;
  final DateTime? date;
}
