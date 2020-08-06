import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_stateless.dart';

class TopPageWidget extends BaseViewStateless {

  final String title;

  TopPageWidget({this.title});

  @override
  Widget build(BuildContext context) {

    ScreenCustom.init(context);

    return Positioned(
      top: ScreenCustom.statusBarHeight,
      width: ScreenCustom.screenWidth,
      height: ScreenCustom.screenHeight * .14,
      child: Container(
        height: ScreenCustom.screenHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Theme.of(context).accentColor,
            Color(0xFF4a0073),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: ScreenCustom.screenHeight * .038,
                  horizontal: ScreenCustom.screenWidth * .03),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add_alert,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenCustom.screenWidth * .02),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenCustom.fator * 11),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
