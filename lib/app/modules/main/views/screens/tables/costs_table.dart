import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/extensions/date_extension.dart';

import '../../../controllers/table_data.dart';

class CostsTable extends StatefulWidget {
  CostsTable({super.key, required this.tableItems});
  final List<TableItem> tableItems;

  @override
  State<CostsTable> createState() => _CostsTableState();
}

class _CostsTableState extends State<CostsTable> {
  ScrollController _scrollController = ScrollController();
  bool changeColor = false;
  DateTime currentDate = DateTime.now();
  bool showScrollToBottom = false;
  bool showScrollToTop = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        HorizontalDataTable(
          onScrollControllerReady:
              (verticalController, horizontalController) {},
          leftHandSideColumnWidth: 100,
          rightHandSideColumnWidth: 500,
          isFixedHeader: true,
          headerWidgets: _getTitleWidget(),
          footerWidgets: _getTitleWidget(),
          leftSideItemBuilder: _generateFirstColumnRow,
          rightSideItemBuilder: _generateRightHandSideColumnRow,
          itemCount: widget.tableItems.length,
          rowSeparatorWidget: const Divider(
            color: Colors.black,
            height: 1.0,
            thickness: 0.0,
          ),
          scrollPhysics: const BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.fast),
          leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
          rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
          itemExtent: 55,
        ),
        if (showScrollToTop)
          Positioned(
            top: -50,
            right: 0,
            child: GestureDetector(
              onTap: () {
                _scrollController.animateTo(
                  _scrollController.position.minScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.blueColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        if (showScrollToBottom)
          Positioned(
            bottom: 100,
            right: 0,
            child: GestureDetector(
              onTap: () {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.blueColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Name Of Cost', 100),
      _getTitleItemWidget('Related Category', 100),
      _getTitleItemWidget('Deducted from Tax', 100),
      _getTitleItemWidget('Data of Service', 100),
      // _getTitleItemWidget('Category', 100, label2: 'Service'),
      _getTitleItemWidget('Price', 100, label2: 'Total'),
      // _getTitleItemWidget('%', 100, label2: 'Total'),
    ];
  }

  Widget _getTitleItemWidget(String label, double width, {String? label2}) {
    return Container(
      color: AppColors.lightYellow,
      width: width,
      height: 60,
      padding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
          if (label2 != null) Divider(height: 2),
          if (label2 != null)
            Text(label2, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    Duration difference = currentDate.difference(widget.tableItems[index].date);
    changeColor = difference.inDays.isEven;
    return Container(
      width: 100,
      height: 52,
      color: changeColor ? Colors.grey[200] : Colors.white,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(widget.tableItems[index].customerData),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    Duration difference = currentDate.difference(widget.tableItems[index].date);
    changeColor = difference.inDays.isEven;
    return Row(
      children: <Widget>[
        Container(
          color: changeColor ? Colors.grey[200] : Colors.white,
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Text(widget.tableItems[index].category.name),
              Divider(height: 1, endIndent: 10, indent: 10),
              Text(widget.tableItems[index].typeOfService.name),
            ],
          ),
        ),
        Container(
          color: changeColor ? Colors.grey[200] : Colors.white,
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: Icon(
            widget.tableItems[index].cardPay ? Icons.done : Icons.minimize,
            color: widget.tableItems[index].cardPay ? Colors.green : Colors.red,
          ),
        ),
        Container(
          color: changeColor ? Colors.grey[200] : Colors.white,
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(widget.tableItems[index].date.smallDate()),
        ),
        // Container(
        //   color: changeColor ? Colors.grey[200] : Colors.white,
        //   width: 50,
        //   height: 52,
        //   padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        //   alignment: Alignment.centerLeft,
        //   child: Icon(
        //     widget.tableItems[index].isNewCustomer
        //         ? Icons.done
        //         : Icons.minimize,
        //     color: widget.tableItems[index].isNewCustomer
        //         ? Colors.green
        //         : Colors.red,
        //   ),
        // ),
        Container(
          color: changeColor ? Colors.grey[200] : Colors.white,
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(widget.tableItems[index].date.smallDate()),
        ),
        Container(
          color: changeColor ? Colors.grey[200] : Colors.white,
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Text(widget.tableItems[index].price),
              Divider(height: 1, endIndent: 20, indent: 20),
              Text(widget.tableItems[index].total),
            ],
          ),
        ),
        // Container(
        //   color: changeColor ? Colors.grey[200] : Colors.white,
        //   width: 100,
        //   height: 52,
        //   padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        //   alignment: Alignment.centerLeft,
        //   child: Column(
        //     children: [
        //       Text(widget.tableItems[index].percentage + '%'),
        //       Divider(height: 1, endIndent: 20, indent: 20),
        //       Text(widget.tableItems[index].total),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
