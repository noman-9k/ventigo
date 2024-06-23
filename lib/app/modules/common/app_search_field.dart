import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';

class AppSearchField extends StatefulWidget {
  const AppSearchField({
    super.key,
    required this.label,
    this.fetchData,
    this.getSelectedValue,
    this.controller,
  });
  final String label;
  final Function? fetchData;
  final Function? getSelectedValue;
  final TextEditingController? controller;

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldSearch(
      decoration:
          InputDecoration(floatingLabelBehavior: FloatingLabelBehavior.never),
      label: widget.label,
      controller: widget.controller ?? TextEditingController(),
      future: widget.fetchData,
      getSelectedValue: widget.getSelectedValue,
    );
  }
}
