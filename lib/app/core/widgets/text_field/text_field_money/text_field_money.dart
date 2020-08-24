import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_stateless.dart';

class TextFieldMoney extends BaseViewStateless{

  final String title;
  final Function onPressed;
  final Function onSaved;
  final Function validator;

  final controller = new MoneyMaskedTextController(leftSymbol: 'R\$ ');

  TextFieldMoney({
    @required this.title,
    @required this.onSaved,
    this.onPressed,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddindTextField, right: paddindTextField),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          prefixIcon: Icon(Icons.monetization_on),
          isDense: true,
        ),
        onTap: onPressed,
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }

  double format(String value){
    String _onlyDigits = value.replaceAll(RegExp('[^0-9]'), "");
    return double.parse(_onlyDigits) / 100;
  }

}