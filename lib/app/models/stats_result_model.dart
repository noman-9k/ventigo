class StatResultModel {
  StatResultModel({
    required this.employeeName,
    required this.totalPrice,
    required this.noRegCustomer,
    required this.noNewCustomer,
    required this.totalServices,
    required this.totalCost,
    // required this.allServicesIdsList,
    this.date,
  });

  final String employeeName;
  final double totalPrice;
  final int noRegCustomer;
  final int noNewCustomer;
  final int totalServices;
  final double totalCost;
  // final List<int> allServicesIdsList;
  final DateTime? date;

  @override
  String toString() {
    return 'StatResultModel(employeeName: $employeeName, totalPrice: $totalPrice, isRegCustomer: $noRegCustomer, isNewCustomer: $noNewCustomer, totalServices: $totalServices, totalCost: $totalCost, date: $date)';
  }
}
