// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';

// import '../../../../../../config/app_colors.dart';

// class StatisticCostScreen extends StatelessWidget {
//   const StatisticCostScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DataTable2(
//       headingRowColor: MaterialStateProperty.resolveWith<Color?>(
//           (Set<MaterialState> states) {
//         if (states.contains(MaterialState.selected))
//           return Theme.of(context).colorScheme.primary.withOpacity(0.08);
//         return AppColors.lightYellow;
//       }),
//       columns: const <DataColumn2>[
//         DataColumn2(label: Text('Name')),
//         DataColumn2(label: Text('Category')),
//         DataColumn2(label: Text('Amount')),
//         DataColumn2(label: Text('Date')),
//       ],
//       rows: const <DataRow>[
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text('Name0')),
//             DataCell(Text('Category')),
//             DataCell(Text('Amount')),
//             DataCell(Text('Date')),
//           ],
//         ),
//         DataRow(
//           cells: <DataCell>[
//             DataCell(Text('Name')),
//             DataCell(Text('Category')),
//             DataCell(Text('Amount')),
//             DataCell(Text('Date')),
//           ],
//         ),
//       ],
//     );
//   }
// }
