class AppService {
  final String? id;
  final String name;
  final double price;

  AppService({this.id, required this.name, required this.price});

  factory AppService.fromJson(Map<String, dynamic> json) {
    return AppService(
      id: json['_id'],
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
    };
  }
}
