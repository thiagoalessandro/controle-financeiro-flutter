import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';
import 'package:project_ref_getx/app/core/routes/app_routes.dart';
import 'package:project_ref_getx/app/core/widgets/layout/app_bar/app_bar_search/app_bar_search_style.dart';
import 'package:project_ref_getx/app/core/widgets/text_field/text_field_search/text_field_search.dart';

class AppBarSearch extends BaseView
    with AppBarSearchStyle
    implements PreferredSizeWidget {
  final Function(String value) onSearch;
  final String title;

  AppBarSearch({
    @required this.onSearch,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Get.offAllNamed(AppRoutes.DASHBOARD);
        },
      ),
      title: TextFieldSearch(
        searchFunction: onSearch,
        title: title,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(heigthAppBar);
}
