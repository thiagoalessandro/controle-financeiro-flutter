import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';

mixin ItemMenuStyle{

  final menuItemHorizontal = 1.0;
  final menuItemVertical = 12.0;
  final menuItemPaddingHorizontal = 5.0;
  final menuItemPaddingVertical = 10.0;

  get menuItemWidth => (ScreenCustom.screenWidth / 4) - (menuItemHorizontal * 2);
  get menuItemFontSizeIcon => 24.0;
  get menuItemFontSizeText => 11.5;

}