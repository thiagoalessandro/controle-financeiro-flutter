import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_stateless.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/domain/entities/menu_entity.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/presenter/widgets/item_menu_style.dart';

class ItemMenuWidget extends BaseViewStateless with ItemMenuStyle{
  final MenuEntity menu;

  ItemMenuWidget(this.menu);

  @override
  Widget build(BuildContext context) {

    ScreenCustom.init(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: menuItemHorizontal,
        vertical: menuItemVertical,
      ),
      child: GestureDetector(
        onTap: () => Get.offNamed(menu.page),
        child: Container(
          width: menuItemWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).accentColor,
            boxShadow: <BoxShadow>[
              BoxShadow(offset: Offset(0.2, 0.6), blurRadius: 0.2),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: menuItemPaddingHorizontal, vertical: menuItemPaddingVertical),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    menu.icon,
                    color: Colors.white,
                    size: menuItemFontSizeIcon,
                  ),
                  Text(
                    menu.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: menuItemFontSizeText,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
