import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_stateless.dart';
import 'package:project_ref_getx/app/core/widgets/date_time_field/date_time_field_style.dart';

class DateTimeField extends BaseViewStateless with DateTimeFieldStyle {
  final String title;
  final Function onSaved;
  final Function validator;

  DateTimeField({
    @required this.title,
    @required this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddindTextField, right: paddindTextField),
      child: DateTimePicker(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.date_range),
          labelText: title,
          isDense: true,
        ),
        dateMask: "dd/MM/yyyy",
        initialValue: '',
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}
