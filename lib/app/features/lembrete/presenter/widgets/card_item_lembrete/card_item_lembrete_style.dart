import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';

mixin CardItemLembreteStyle{

  final responsibleImageWidth = 42.0;
  final responsibleImageHeigth = 42.0;

  final boxTextColor = Colors.blueGrey;

  final noteTextLeft = ScreenCustom.screenWidth * 0.14;
  final noteTextTop = ScreenCustom.screenHeight * 0.007;
  final noteTextFontSize = 14.0;

  final moneyTextLeft = ScreenCustom.screenWidth * 0.14;
  final moneyTextTop = ScreenCustom.screenHeight * .04;
  final moneyTextFontSize = 13.0;

  final responsibleNameBoxWidth = 35.0;
  final responsibleNameLeft = ScreenCustom.screenWidth * 0.80;
  final responsibleNameTop = ScreenCustom.screenHeight * .015;
  final responsibleNameFontSize = 13.0;

  responsibleColor(resposible) => resposible == "THIAGO" ? Color(0xFFF3DB0B3) : Color(0xFFFFF8598);

}