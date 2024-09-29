// extension TotalQuantityExtension on List<Item> {
//   TotalQuantity calculateTotalQuantity() {
//     return this.fold(
//       TotalQuantity(name: 'total', quantity: 0, totalPrice: 0.0),
//       (totals, item) {
//         totals.quantity += item.quantity;
//         totals.totalPrice += item.quantity * item.price;
//         return totals;
//       },
//     );
//   }
// }

import '../app/models/stats_result_model.dart';
import '../app/modules/addReport/controllers/add_report_controller.dart';

extension ListSearchExtension on List<SearchItem> {
  List<SearchItem> myDistinct() {
    return this.fold(
      [],
      (List<SearchItem> distinctList, item) {
        if (!distinctList.any((element) => element.label == item.label)) {
          distinctList.add(item);
        }
        return distinctList;
      },
    );
  }
}

extension ListExtension on List<StatResultModel> {
  StatResultModel get total {
    return this.fold(
      StatResultModel(
        employeeName: 'Total',
        totalPrice: 0.0,
        noRegCustomer: 0,
        noNewCustomer: 0,
        totalServices: 0,
        totalCost: 0.0,
        percentage: 0.0,
        shopCost: 0.0,
        uniqueCustomers: 0,
        date: null,
      ),
      (totals, item) {
        totals.totalPrice += item.totalPrice;
        totals.noRegCustomer += item.noRegCustomer;
        totals.noNewCustomer += item.noNewCustomer;
        totals.totalServices += item.totalServices;
        (totals.totalCost += item.totalCost).roundToDouble();
        totals.percentage += item.percentage;
        totals.shopCost = item.shopCost;
        totals.uniqueCustomers = item.uniqueCustomers;
        return totals;
      },
    );
  }
}
