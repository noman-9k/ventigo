class CostsFilter {
  String? name;
  bool? deductFromTax;
  bool? systematicExpenditure;
  String? repetitionInterval;
  String? unitOfMeasurements;
  double? minPrice;
  double? maxPrice;

  CostsFilter({
    this.name,
    this.deductFromTax,
    this.systematicExpenditure,
    this.repetitionInterval,
    this.unitOfMeasurements,
    this.minPrice,
    this.maxPrice,
  });

  @override
  String toString() {
    return 'CostsFilter(name: $name, deductFromTax: $deductFromTax, systematicExpenditure: $systematicExpenditure, repetitionInterval: $repetitionInterval, unitOfMeasurements: $unitOfMeasurements, minPrice: $minPrice, maxPrice: $maxPrice)';
  }
}
