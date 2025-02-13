// write code for extension on test field that add the textfield in a column with a label

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ventigo/config/app_text.dart';

import '../config/app_styles.dart';
import '../generated/l10n.dart';

extension TextFieldExtension on Widget {
  Widget withLabel(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText.lightBoldText(label),
        // Text(label,style: ,),
        SizedBox(height: 5),
        this,
      ],
    );
  }
}

extension TextFieldExtensions on TextField {
  Widget addMaxCount(int? maxLength) {
    if (maxLength == null) {
      return this;
    }
    return _MaxCountTextField(
      textField: this,
      maxLength: maxLength,
    );
  }
}

class _MaxCountTextField extends StatefulWidget {
  final TextField textField;
  final int maxLength;

  const _MaxCountTextField({
    Key? key,
    required this.textField,
    required this.maxLength,
  }) : super(key: key);

  @override
  State<_MaxCountTextField> createState() => _MaxCountTextFieldState();
}

class _MaxCountTextFieldState extends State<_MaxCountTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  int _charCount = 0;

  @override
  void initState() {
    super.initState();
    _controller = widget.textField.controller ?? TextEditingController();
    _focusNode = widget.textField.focusNode ?? FocusNode();
    _controller.addListener(_updateCharCount);
  }

  @override
  void dispose() {
    _controller.removeListener(_updateCharCount);
    if (widget.textField.controller == null) {
      _controller.dispose();
    }
    if (widget.textField.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _updateCharCount() {
    setState(() {
      _charCount = _controller.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          inputFormatters: [
            LengthLimitingTextInputFormatter(widget.maxLength),
          ],
          keyboardType: widget.textField.keyboardType,
          style: widget.textField.style,
          decoration: widget.textField.decoration,
          onChanged: (value) {
            _controller.text = value;
            _controller.selection = TextSelection.collapsed(offset: value.length);
            if (widget.textField.onChanged != null) {
              widget.textField.onChanged!(value);
            }
          },
        ),
        Text(
          S.of(context).characters + ' ${_charCount}/${widget.maxLength} ',
          style: AppStyles.lightStyle(),
        ),
      ],
    );
  }
}
