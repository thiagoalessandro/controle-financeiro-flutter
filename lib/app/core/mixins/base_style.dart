import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';

mixin BaseStyle {

  final menuHeight = 100.0;
  final heigthAppBar = 60.0;

  final paddindTextField = 6.0;

  final green = Color(0xFF47BFA3);
  final greenAccent = Color(0xFF269B88);

  get screenWidth => ScreenCustom.screenWidth;
  get screenHeight => ScreenCustom.screenHeight;
  get statusBarHeight => ScreenCustom.statusBarHeight;
  get bottomBarHeight => ScreenCustom.bottomBarHeight;

  get listCardHeigth => screenHeight - Scaffold.of(ScreenCustom.context).appBarMaxHeight;
  get listCardMarginTop => 0.0;
  get listCardWidth => screenWidth;

}