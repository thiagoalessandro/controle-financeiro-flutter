import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';

mixin TotalGastoStyle {
  final height = ScreenCustom.screenHeight * .20;
  final paddindAll = 12.0;
  final elevation = 4.0;
  final fontSizeIcon = 22.0;
  final paddingLeftTextIcon = 5.0;
  final fontSizeTitle = 14.0;
  final paddingTopDetail = 8.0;
  final colorTextAndIcon = Colors.white;
  final fontWeightMoney = FontWeight.w400;

  calculateWidth(screenWidth) => screenWidth * .96;
}
