import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';
import 'package:project_ref_getx/app/core/widgets/layout/topo/topo_page_style.dart';

class TopoPageWidget extends BaseView with TopoPageStyle{
  final String title;

  TopoPageWidget({this.title});

  @override
  Widget build(BuildContext context) {

    ScreenCustom.init(context);

    return Positioned(
      top: statusBarHeight,
      width: screenWidth,
      height: topoPageHeigth,
      child: Container(
        height: ScreenCustom.screenHeight,
        decoration: BoxDecoration(color: Theme.of(context).accentColor),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: topoPageVertical,
                  horizontal:topoPageHorizontal),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.add_alert,
                    color: Colors.white,
                    size: topoPageFontSizeIcon,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: topoPageHorizontalText,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.5, 0.5),
                            )
                          ],
                          fontSize: topoPageFontSizeText),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: topoPageLogoRigth,
              top: topoPageLogoTop,
              child: Container(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  "assets/images/logo.png",
                  width: topoPageLogoWidth,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
