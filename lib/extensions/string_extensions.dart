// write extension on double that return percentage of the number

extension StringExtension on String {
  /// returns only last 3 characters of the string and return all if string length is less than 3
  String lastThreeCharacters() {
    if (this.length < 3) return this;
    return this.substring(this.length - 3, this.length);
  }
}
