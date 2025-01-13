import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ventigo/config/app_colors.dart';
import 'package:ventigo/config/app_text.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key, required this.items, this.onChanged, required this.title, this.selectedValue});
  final List<String>? items;
  final Function(String?)? onChanged;
  final String title;
  final String? selectedValue;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedValue;

  @override
  void initState() {
    selectedValue = widget.selectedValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        value: selectedValue,
        hint: AppText.mediumText(widget.title, color: Colors.grey),
        items: widget.items != null
            ? widget.items!
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
          if (widget.onChanged != null) widget.onChanged!(selectedValue);
        },
        buttonStyleData: ButtonStyleData(
          height: 50,
          width: 1.sw,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: AppColors.veryLightGrey),
        ),
        iconStyleData: const IconStyleData(icon: Icon(Icons.arrow_forward_ios_outlined), iconSize: 14),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 1.sw - 40,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: AppColors.whiteColor),
          offset: const Offset(0, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(height: 40, padding: EdgeInsets.only(left: 14, right: 14)),
      ),
    );
  }
}





// // flutter import

// import 'package:flutter/material.dart';

// // packages import
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:ventigo/config/app_styles.dart';

// import '../../../config/app_colors.dart';

// class DropDownMenu extends StatefulWidget {
//   const DropDownMenu(
//       {Key? key,
//       required this.listOfCategories,
//       required this.onValueChanged,
//       this.initialValue})
//       : super(key: key);
//   final List<String> listOfCategories;
//   final String? initialValue;
//   final Function(String?) onValueChanged;

//   @override
//   State<DropDownMenu> createState() => _DropDownMenuState();
// }

// class _DropDownMenuState extends State<DropDownMenu> {
//   @override
//   void initState() {
//     super.initState();
//     _selectedCategory = widget.initialValue ?? widget.listOfCategories[0];
//   }

//   String? _selectedCategory;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 2),
//       child: Container(
//         height: 50,
//         width: 1.sw,
//         decoration: BoxDecoration(
//             color: _selectedCategory == widget.listOfCategories[0]
//                 ? Colors.white
//                 : AppColors.primaryColor.withOpacity(0.1),
//             border: Border.all(
//                 color: _selectedCategory == widget.listOfCategories[0]
//                     ? AppColors.primaryColor
//                     : AppColors.darkGrey),
//             borderRadius: BorderRadius.circular(15)),
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: DropdownButton<String>(
//             borderRadius: BorderRadius.circular(15),
//             dropdownColor: AppColors.lightGrey,
//             menuMaxHeight: 250.h,
//             elevation: 0,
//             underline: SizedBox(),
//             icon: Icon(Icons.keyboard_arrow_down_outlined,
//                 color: AppColors.darkGrey),
//             iconEnabledColor: _selectedCategory == widget.listOfCategories[0]
//                 ? Colors.grey
//                 : Colors.white,
//             hint: Text(_selectedCategory ?? widget.listOfCategories[0],
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 13.sp,
//                     color: _selectedCategory == widget.listOfCategories[0]
//                         ? AppColors.primaryColor
//                         : AppColors.darkGrey)),
//             items: widget.listOfCategories.map((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value, style: AppStyles.lightStyle()),
//               );
//             }).toList(),
//             onChanged: (value) {
//               setState(() {
//                 _selectedCategory = value;
//               });
//               widget.onValueChanged(_selectedCategory);
//             }),
//       ),
//     );
//   }
// }

