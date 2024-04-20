import 'caregory.dart';

class Employee {
  String name;
  String lastName;
  String? login;
  String? password;
  List<Category>? categories;
  double? percentage;
  List<Visibility>? visibility;

  Employee({
    required this.name,
    required this.lastName,
    this.login,
    this.password,
    this.categories,
    this.percentage,
    this.visibility,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      lastName: json['lastName'],
      login: json['login'],
      password: json['password'],
      categories: List<Category>.from(
          json['categories'].map((x) => Category.fromJson(x))),
      percentage: json['percentage'],
      visibility: List<Visibility>.from(
          json['visibility'].map((x) => Visibility.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': lastName,
      'login': login,
      'password': password,
      'categories': categories?.map((x) => x.toJson()).toList(),
      'percentage': percentage,
      'visibility': visibility?.map((x) => x.toJson()).toList(),
    };
  }
}

class Visibility {
  String name;
  bool isVisible;

  Visibility({required this.name, required this.isVisible});

  factory Visibility.fromJson(Map<String, dynamic> json) {
    return Visibility(name: json['name'], isVisible: json['isVisible']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isVisible': isVisible,
    };
  }
}
