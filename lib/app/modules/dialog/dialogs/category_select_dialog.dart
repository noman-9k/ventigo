import 'package:flutter/material.dart';

import '../../../models/caregory.dart';

class CategorySelectDialog extends StatefulWidget {
  const CategorySelectDialog(
      {super.key,
      required this.categories,
      required this.onDone,
      this.selectedCategories = const []});
  final List<Category> categories;
  final Function(List<Category>?) onDone;
  final List<Category>? selectedCategories;

  @override
  State<CategorySelectDialog> createState() => _CategorySelectDialogState();
}

class _CategorySelectDialogState extends State<CategorySelectDialog> {
  List<Category> selectedCategories = [];

  @override
  void initState() {
    selectedCategories = widget.selectedCategories ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Categories'),
      content: SingleChildScrollView(
        child: Column(
          children: widget.categories.map((category) {
            return CheckboxListTile(
              title: Text(category.name),
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
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            widget.onDone(selectedCategories);
            Navigator.of(context).pop();
          },
          child: const Text('Done'),
        ),
      ],
    );
  }
}
