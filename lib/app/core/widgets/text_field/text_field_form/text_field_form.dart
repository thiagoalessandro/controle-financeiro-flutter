import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';
import 'package:project_ref_getx/app/core/widgets/text_field/text_field_form/text_field_form_style.dart';

class TextFieldForm extends BaseView with TextFieldFormStyle{
  final IconData iconData;
  final String title;
  final TextInputType keyboardType;
  final Function onPressed;
  final Function(String value) onSaved;
  final Function(String value) validator;
  final String initialValue;

  TextFieldForm({
    @required this.title,
    @required this.iconData,
    @required this.onSaved,
    @required this.initialValue,
    this.keyboardType,
    this.onPressed,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddindTextField, right: paddindTextField),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: title,
          prefixIcon: Icon(iconData),
          isDense: true,
        ),
        onTap: onPressed,
        onSaved: (value) => onSaved(value),
        validator: (value) => validator(value),
        initialValue: initialValue
      ),
    );
  }
}
