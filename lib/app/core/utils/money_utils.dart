import 'package:intl/intl.dart';

class MoneyUtils{

  static double getOnlyNumber(String value){
    String _onlyDigits = value.replaceAll(RegExp('[^0-9]'), "");
    return double.parse(_onlyDigits) / 100;
  }

  static String getFormatMoneyWithSymbol(double value){
    return "R\$ ${NumberFormat("#,##0.00").format(value)}";
  }

  static String getFormatMoneyNoSymbol(double value){
    return "${NumberFormat("#,##0.00").format(value)}";
  }

}