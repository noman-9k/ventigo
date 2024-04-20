import 'package:get/get.dart';

import '../models/caregory.dart';
import '../models/service.dart';

class CategoryService extends GetxService {
  static CategoryService get to => Get.find();

  RxList<Category> servicesCategories = [
    Category(name: 'Manicure', services: [
      AppService(name: 'Manicure', price: 10.0),
      AppService(name: 'Manicure + Gel + Extension', price: 30.0),
    ]),
    Category(name: 'Pedicure', services: [
      AppService(name: 'Pedicure', price: 10.0),
      AppService(name: 'Pedicure + Gel + Extension', price: 30.0),
    ]),
    Category(name: 'Hair', services: [
      AppService(name: 'Haircut', price: 10.0),
      AppService(name: 'Haircut + Wash', price: 20.0),
    ]),
    Category(name: 'Massage', services: [
      AppService(name: 'Back Massage', price: 10.0),
    ]),
    Category(name: 'Facial', services: [
      AppService(name: 'Facial', price: 10.0),
    ]),
  ].obs;

  List<Category> getAllServicesCategories() {
    return servicesCategories;
  }

  List<AppService> getAllServices() {
    List<AppService> services = [];
    servicesCategories.forEach((element) {
      services.addAll(element.services!);
    });
    return services;
  }
}
