import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_stateless.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/domain/entities/menu_entity.dart';

class ItemMenuWidget extends BaseViewStateless {

  final MenuEntity menu;

  ItemMenuWidget(this.menu);

  @override
  Widget build(BuildContext context) {

    ScreenCustom.init(context);

    const _horizontalItemMenu = 4.0;
    const _verticalItemMenu = 12.0;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: _horizontalItemMenu,
        vertical: _verticalItemMenu,
      ),
      child: Container(
        width: calculateWidthItemMenu(ScreenCustom.screenWidth, _horizontalItemMenu),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).accentColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  menu.icon,
                  color: Colors.white,
                  size: ScreenCustom.fator * 12,
                ),
                Text(
                  menu.title,
                  style: TextStyle(color: Colors.white, fontSize: ScreenCustom.fator * 7),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  calculateWidthItemMenu(width, padding) {
    return (width / 3.5) - (padding * 2);
  }
}
