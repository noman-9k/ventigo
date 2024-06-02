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
        date: null,
      ),
      (totals, item) {
        totals.totalPrice += item.totalPrice;
        totals.noRegCustomer += item.noRegCustomer;
        totals.noNewCustomer += item.noNewCustomer;
        totals.totalServices += item.totalServices;
        totals.totalCost += item.totalCost;
        return totals;
      },
    );
  }
}
