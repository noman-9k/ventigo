import 'package:flutter/material.dart';
import 'package:ventigo/config/app_colors.dart';

class AppTableWidget extends StatelessWidget {
  const AppTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Table(
        border: TableBorder.all(),
        columnWidths: const <int, TableColumnWidth>{
          0: FixedColumnWidth(30),
          // 0: IntrinsicColumnWidth(flex: 1),
          1: FlexColumnWidth(),
          2: FixedColumnWidth(94),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          TableRow(
            children: <Widget>[
              Container(
                height: 50,
                padding: EdgeInsets.all(2),
                color: AppColors.lightYellow,
                child: Expanded(child: Text('Reg Cus')),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.top,
                child: Container(
                  height: 32,
                  color: Colors.red,
                ),
              ),
              Container(
                height: 50,
                color: Colors.blue,
              ),
            ],
          ),
          TableRow(
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            children: <Widget>[
              Container(
                height: 64,
                width: 128,
                color: Colors.purple,
              ),
              Container(
                height: 32,
                color: Colors.yellow,
              ),
              Center(
                child: Container(
                  height: 32,
                  width: 32,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          ...List<TableRow>.generate(
              30,
              (i) => TableRow(
                    children: <Widget>[
                      Container(
                        height: 32,
                        color: Colors.green,
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.top,
                        child: Container(
                          height: 32,
                          width: 32,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        height: 64,
                        color: Colors.blue,
                      ),
                    ],
                  )).toList(),
        ],
      ),
    );
  }
}
