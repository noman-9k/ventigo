class UserDataFilter {
  bool asc = true;
  final String? orderingColumn;
  final String? selectQuery;
  final String? name;
  final String? phone;
  final DateTime? fromDate;
  final DateTime? toDate;
  final double? priceFrom;
  final double? priceTo;
  final List<String>? selectedMasters;
  final List<String>? selectedCategories;
  final bool? isRegularCustomer;
  final bool? isCustomerCard;
  final bool? isNewCustomer;
  final String? notes;

  UserDataFilter({
    required bool asc,
    required String? orderingColumn,
    required String? selectQuery,
    required String? name,
    required String? phone,
    required DateTime? fromDate,
    required DateTime? toDate,
    required double? priceFrom,
    required double? priceTo,
    required List<String>? selectedMasters,
    required List<String>? selectedCategories,
    required bool? isRegularCustomer,
    required bool? isCustomerCard,
    required bool? isNewCustomer,
    required String? notes,
  })  : asc = asc,
        this.orderingColumn = orderingColumn,
        this.selectQuery = selectQuery,
        this.name = name,
        this.phone = phone,
        this.fromDate = fromDate,
        this.toDate = toDate,
        this.priceFrom = priceFrom,
        this.priceTo = priceTo,
        this.selectedMasters = selectedMasters,
        this.selectedCategories = selectedCategories,
        this.isRegularCustomer = isRegularCustomer,
        this.isCustomerCard = isCustomerCard,
        this.isNewCustomer = isNewCustomer,
        this.notes = notes;
}
