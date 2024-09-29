import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../db/drift_db.dart';
import '../../../models/caregory.dart';

class CategorySelectDialog extends StatefulWidget {
  const CategorySelectDialog(
      {super.key,
      required this.categories,
      required this.onDone,
      this.selectedCategories = const []});
  final List<DbCategory> categories;
  final Function(List<DbCategory>?) onDone;
  final List<DbCategory>? selectedCategories;

  @override
  State<CategorySelectDialog> createState() => _CategorySelectDialogState();
}

class _CategorySelectDialogState extends State<CategorySelectDialog> {
  List<DbCategory> selectedCategories = [];

  @override
  void initState() {
    selectedCategories = widget.selectedCategories ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).selectCategories),
      content: SingleChildScrollView(
        child: Column(
          children: [
            CheckboxListTile(
              title: Text(S.of(context).all),
              value: selectedCategories.length == widget.categories.length,
              onChanged: (value) {
                if (value!) {
                  selectedCategories = widget.categories;
                } else {
                  selectedCategories = [];
                }
                setState(() {});
              },
            ),
            Column(
              children: widget.categories.map((category) {
                return CheckboxListTile(
                  title: Text(category.name!),
                  value: selectedCategories.contains(category),
                  onChanged: (value) {
                    if (value!) {
                      selectedCategories.add(category);
                    } else {
                      selectedCategories.remove(category);
                    }
                    setState(() {});
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(S.of(context).cancel),
        ),
        TextButton(
          onPressed: () {
            widget.onDone(selectedCategories);
            Navigator.of(context).pop();
          },
          child: Text(S.of(context).done),
        ),
      ],
    );
  }
}
