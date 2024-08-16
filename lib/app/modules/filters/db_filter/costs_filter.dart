class CostsFilter {
  String? name;
  bool? deductFromTax;
  bool? systematicExpenditure;
  String? repetitionInterval;
  String? unitOfMeasurements;
  double? minPrice;
  double? maxPrice;
  List<String>? categories;
  final DateTime? fromDate;
  final DateTime? toDate;

  CostsFilter({
    this.name,
    this.deductFromTax,
    this.systematicExpenditure,
    this.repetitionInterval,
    this.unitOfMeasurements,
    this.minPrice,
    this.maxPrice,
    this.categories,
    this.fromDate,
    this.toDate,
  });

  @override
  String toString() {
    return 'CostsFilter(name: $name, deductFromTax: $deductFromTax, systematicExpenditure: $systematicExpenditure, repetitionInterval: $repetitionInterval, unitOfMeasurements: $unitOfMeasurements, minPrice: $minPrice, maxPrice: $maxPrice)';
  }
}
