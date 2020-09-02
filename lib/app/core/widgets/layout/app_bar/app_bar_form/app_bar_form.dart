import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';
import 'package:project_ref_getx/app/core/routes/app_routes.dart';
import 'package:project_ref_getx/app/core/widgets/layout/app_bar/app_bar_form/app_bar_form_style.dart';

class AppBarForm extends BaseView
    with AppBarFormStyle
    implements PreferredSizeWidget {
  final String title;

  AppBarForm({@required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Get.offNamed(AppRoutes.LEMBRETE);
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.add_alert),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(title),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(heigthAppBar);
}
