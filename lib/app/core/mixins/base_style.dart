import 'dart:ui';

import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';

mixin BaseStyle {

  final menuHeight = 100.0;

  final green = Color(0xFF47BFA3);
  final greenAccent = Color(0xFF269B88);

  get screenWidth => ScreenCustom.screenWidth;
  get screenHeight => ScreenCustom.screenHeight;
  get statusBarHeight => ScreenCustom.statusBarHeight;
  get bottomBarHeight => ScreenCustom.bottomBarHeight;

  get listCardHeigth => screenHeight - listCardMarginTop - menuHeight;
  get listCardMarginTop => screenHeight * 0.125;
  get listCardWidth => screenWidth;

}