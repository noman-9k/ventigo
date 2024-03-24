import 'package:ventigo/app/models/service.dart';

class Category {
  final String? id;
  final String name;
  final List<Service>? services;
  final String? description;

  Category({
    this.id,
    required this.name,
    this.services,
    this.description,
  });
}
