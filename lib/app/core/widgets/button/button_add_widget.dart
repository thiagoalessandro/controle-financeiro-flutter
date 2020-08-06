import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_stateless.dart';

class ButtonAddWidget extends BaseViewStateless {

  @override
  Widget build(BuildContext context) {

    ScreenCustom.init(context);

    return Positioned(
      top: ScreenCustom.screenHeight * .76,
      right: ScreenCustom.screenWidth * 0.05,
      child: MaterialButton(
        onPressed: () {},
        color: Colors.green,
        textColor: Colors.white,
        child: Icon(
          Icons.add,
          size: 24,
        ),
        padding: EdgeInsets.all(16),
        shape: CircleBorder(),
      ),
    );
  }
}
