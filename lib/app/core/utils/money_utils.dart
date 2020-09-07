import 'package:intl/intl.dart';

class MoneyUtils{

  static double getOnlyNumber(String value){
    String _onlyDigits = value.replaceAll(RegExp('[^0-9]'), "");
    return double.parse(_onlyDigits) / 100;
  }

  static String getFormatMoneyWithSymbol(double value){
    try {
      if(value == null) return "R\$ 0,00";
      return "R\$ ${NumberFormat("#,##0.00").format(value)}";
    }catch(e){
      print("Erro ao formatar valor $value");
    }
  }

  static String getFormatMoneyNoSymbol(double value){
    return "${NumberFormat("#,##0.00").format(value)}";
  }

}