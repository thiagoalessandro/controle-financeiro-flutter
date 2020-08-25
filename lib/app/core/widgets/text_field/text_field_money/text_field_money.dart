import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_stateless.dart';

class TextFieldMoney extends BaseViewStateless{

  final String title;
  final Function onPressed;
  final Function onSaved;
  final Function validator;

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
        inputFormatters: [CurrencyTextInputFormatter(
          symbol: 'R\$'
        )],
        keyboardType: TextInputType.number,
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

}