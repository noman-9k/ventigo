// write extension on double that return percentage of the number

extension DoubleExtension on double {
  String percentageOf(double? number) {
    if (number == null) return '0';
    return '${this * number / 100}';
  }

  String only2Decimals() {
    return '${this.toStringAsFixed(2)}';
  }
}
