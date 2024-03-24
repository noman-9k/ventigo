import 'package:get/get.dart';

import '../models/caregory.dart';
import '../models/service.dart';

class CategoryService extends GetxService {
  static CategoryService get to => Get.find();
  RxList<Category> servicesCategories = [
    Category(name: 'Manicure', services: [
      Service(name: 'Manicure', price: 10.0),
      Service(name: 'Manicure + Gel', price: 20.0),
      Service(name: 'Manicure + Gel + Extension', price: 30.0),
    ]),
    Category(name: 'Pedicure', services: [
      Service(name: 'Pedicure', price: 10.0),
      Service(name: 'Pedicure + Gel', price: 20.0),
      Service(name: 'Pedicure + Gel + Extension', price: 30.0),
    ]),
    Category(name: 'Hair', services: [
      Service(name: 'Haircut', price: 10.0),
      Service(name: 'Haircut + Wash', price: 20.0),
      Service(name: 'Haircut + Wash + Blow Dry', price: 30.0),
    ]),
    Category(name: 'Massage', services: [
      Service(name: 'Back Massage', price: 10.0),
      Service(name: 'Full Body Massage', price: 20.0),
      Service(name: 'Full Body Massage + Scrub', price: 30.0),
    ]),
    Category(name: 'Facial', services: [
      Service(name: 'Facial', price: 10.0),
      Service(name: 'Facial + Scrub', price: 20.0),
      Service(name: 'Facial + Scrub + Bleach', price: 30.0),
    ]),
  ].obs;

  List<Category> getAllServicesCategories() {
    return servicesCategories;
  }
}
