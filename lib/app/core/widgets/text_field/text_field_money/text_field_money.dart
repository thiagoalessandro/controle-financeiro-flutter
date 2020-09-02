import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';
import 'package:project_ref_getx/app/core/utils/money_utils.dart';

class TextFieldMoney extends BaseView {
  final String title;
  final double initialValue;
  final Function onPressed;
  final Function(String value) onSaved;
  final Function(String value) validator;

  TextFieldMoney({
    @required this.title,
    @required this.initialValue,
    @required this.onSaved,
    this.onPressed,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddindTextField, right: paddindTextField),
      child: TextFormField(
        inputFormatters: [CurrencyTextInputFormatter(symbol: 'R\$')],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: title,
          prefixIcon: Icon(Icons.monetization_on),
          isDense: true,
        ),
        onTap: onPressed,
        initialValue: initialValue != null ? MoneyUtils.getFormatMoneyWithSymbol(initialValue) : null,
        onSaved: (value) => onSaved(value),
        validator: (value) => validator(value),
      ),
    );
  }
}
