import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';

mixin ItemMenuStyle{

  final menuItemHorizontal = 4.0;
  final menuItemVertical = 12.0;
  final menuItemPaddingHorizontal = 5.0;
  final menuItemPaddingVertical = 13.0;

  get menuItemWidth => ((ScreenCustom.screenWidth) / 4) - ((menuItemHorizontal/2)  * 4);
  get menuItemFontSizeIcon => 25.0;
  get menuItemFontSizeText => 12.5;

}