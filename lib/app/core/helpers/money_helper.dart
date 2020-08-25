class MoneyHelper{

  static double getOnlyNumber(String value){
    String _onlyDigits = value.replaceAll(RegExp('[^0-9]'), "");
    return double.parse(_onlyDigits) / 100;
  }

}