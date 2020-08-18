import 'package:animate_do/animate_do.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_stateless.dart';
import 'package:project_ref_getx/app/core/widgets/button/button_option_page/button_option_page_style.dart';

class ButtonOptionPageWidget extends BaseViewStateless with ButtonOptionPageStyle{

  @override
  Widget build(BuildContext context) {
    ScreenCustom.init(context);
    return BounceInRight(
      child: FabCircularMenu(
          fabMargin: EdgeInsets.only(
              bottom: bottomOptionListMarginBotton(menuHeight),
              right: bottomOptionListMarginRigth
          ),
          fabElevation: 3,
          ringDiameter: bottomOptionListRingDiameter,
          ringColor: greenAccent,
          fabColor: green,
          fabOpenIcon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          fabCloseIcon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  print('Home');
                }),
            IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () {
                  print('Favorite');
                })
          ]),
    );
  }

}
