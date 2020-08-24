import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_stateless.dart';
import 'package:project_ref_getx/app/core/widgets/text_field/text_field_form/text_field_form_style.dart';

class TextFieldForm extends BaseViewStateless with TextFieldFormStyle{
  final IconData iconData;
  final String title;
  final TextInputType keyboardType;
  final Function onPressed;
  final Function onSaved;
  final Function validator;

  TextFieldForm({
    @required this.title,
    @required this.iconData,
    @required this.onSaved,
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
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
