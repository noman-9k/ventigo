import 'package:ventigo/app/models/service.dart';

class Category {
  final String? id;
  final String name;
  final List<AppService>? services;
  final String? description;

  Category({
    this.id,
    required this.name,
    this.services,
    this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      services: List<AppService>.from(
          json['services'].map((x) => AppService.fromJson(x))),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'services': services!.map((x) => x.toJson()).toList(),
      'description': description,
    };
  }
}
