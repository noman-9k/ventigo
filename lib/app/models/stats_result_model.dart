class StatResultModel {
  StatResultModel({
    required this.employeeName,
    required this.totalPrice,
    required this.noRegCustomer,
    required this.noNewCustomer,
    required this.totalServices,
    required this.totalCost,
    required this.percentage,
    required this.shopCost,
    required this.uniqueCustomers,
    this.date,
  });

  String employeeName;
  double totalPrice;
  int noRegCustomer;
  int noNewCustomer;
  int totalServices;
  int uniqueCustomers;
  double totalCost;
  DateTime? date;
  double percentage;

  double? shopCost;
  @override
  String toString() {
    return 'StatResultModel(employeeName: $employeeName, totalPrice: $totalPrice, isRegCustomer: $noRegCustomer, isNewCustomer: $noNewCustomer, totalServices: $totalServices, totalCost: $totalCost, date: $date)';
  }
}
