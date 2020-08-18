import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenCustom{

  static BuildContext context;

  static void init(BuildContext ctx){
    context = ctx;
    ScreenUtil.init(ctx);
  }

  static double get screenHeight => ScreenUtil.screenHeight;

  static double get screenWidth => ScreenUtil.screenWidth;

  static double get bottomBarHeight => ScreenUtil.bottomBarHeight;

  static double get statusBarHeight => ScreenUtil.statusBarHeight;

}