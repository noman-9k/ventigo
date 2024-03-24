import 'package:flutter/material.dart';
import 'package:textfield_search/textfield_search.dart';

class AppSearchField extends StatefulWidget {
  const AppSearchField({
    super.key,
    required this.label,
    this.fetchData,
    this.getSelectedValue,
  });
  final String label;
  final Function? fetchData;
  final Function? getSelectedValue;

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFieldSearch(
      label: widget.label,
      controller: myController,
      future: widget.fetchData,
      getSelectedValue: widget.getSelectedValue,
    );
  }
}
