import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ventigo/app/db/drift_db.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_text.dart';
import '../../app_services/category_service.dart';

class GetServiceOfCategoryById extends StatefulWidget {
  const GetServiceOfCategoryById({super.key, this.categoryId, this.onChanged});

  final int? categoryId;
  final Function(DbService)? onChanged;

  @override
  State<GetServiceOfCategoryById> createState() =>
      _GetServiceOfCategoryByIdState();
}

class _GetServiceOfCategoryByIdState extends State<GetServiceOfCategoryById> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    try {
      return DropdownButtonHideUnderline(
        child: StreamBuilder<List<DbService>>(
            stream: CategoryService.to.getServicesByCategory(widget.categoryId),
            builder: (context, snapshot) {
              final items = snapshot.data?.map((e) => e.name ?? '').toList();

              return DropdownButton2<String>(
                isExpanded: true,
                value: selectedValue,
                hint: AppText.mediumText('Select Service'),
                items: items != null
                    ? items
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: AppText.mediumText(item),
                            ))
                        .toList()
                    : [],
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                  if (widget.onChanged != null) {
                    final service = snapshot.data
                        ?.firstWhere((element) => element.name == value);
                    widget.onChanged!(service!);
                  }
                },
                buttonStyleData: ButtonStyleData(
                  height: 50,
                  width: 1.sw,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color(0xFFECECEC)),
                  elevation: 2,
                ),
                iconStyleData: const IconStyleData(
                    icon: Icon(Icons.arrow_forward_ios_outlined), iconSize: 14),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: 1.sw - 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: AppColors.whiteColor),
                  offset: const Offset(0, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                    height: 40, padding: EdgeInsets.only(left: 14, right: 14)),
              );
            }),
      );
    } catch (e) {
      return const SizedBox();
    }
  }

  //   if (widget.categoryId == null) {
  //     return CustomDropDown(

  //       onChanged: (value) {},
  //       title: 'Select Service',
  //     );
  //   } else {
  //     return StreamBuilder(
  //         stream: CategoryService.to.getServicesByCategory(widget.categoryId!),
  //         builder: (context, snapshot) {
  //           return CustomDropDown(
  //             items: snapshot.data?.map((e) => e.name!).toList(),
  //             onChanged: (value) {},
  //             title: 'Select Service d',
  //           );
  //         });
  //   }
  // }
}
