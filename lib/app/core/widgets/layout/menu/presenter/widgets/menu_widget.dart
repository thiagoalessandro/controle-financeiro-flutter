import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_controller.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/presenter/controller/menu_controller.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/presenter/widgets/item_menu_widget.dart';

class MenuWidget extends BaseViewController<MenuController> {

  @override
  Widget build(BuildContext context) {

    ScreenCustom.init(context);

    return Positioned(
      bottom: ScreenCustom.bottomBarHeight,
      left: 0,
      right: 0,
      height: ScreenCustom.screenHeight * .15,
      child: Container(
        child: Obx(() =>
            ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: controller.listMenu.length,
              itemBuilder: (context, index) => ItemMenuWidget(controller.listMenu.elementAt(index)),
            ),
        ),
      ),
    );
  }
}
