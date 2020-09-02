import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/widgets/button/button_add_item/button_add_item.dart';
import 'package:project_ref_getx/app/core/widgets/layout/app_bar/app_bar_search/app_bar_search.dart';
import 'package:project_ref_getx/app/core/widgets/list_pagination/base_item_list/base_item_list_widget.dart';
import 'package:project_ref_getx/app/core/widgets/list_pagination/list_pagination_widget.dart';

import '../controller/base_list_controller.dart';
import 'base_view_controller.dart';

abstract class BaseLayoutList<T extends BaseListController> extends BaseViewController<T> {

  @override
  Widget build(BuildContext context) {
    ScreenCustom.init(context);

    return Scaffold(
      appBar: AppBarSearch(
        title: controller.title,
        onSearch: controller.toSearch,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          RefreshIndicator(
            onRefresh: controller.reloadList,
            child: Obx(
                  () =>
                  ListPaginationWidget(
                    list: controller.listItem.value,
                    scrollController: controller.scrollController,
                    loading: controller.isLoading.value,
                    last: controller.last,
                    item: cardItemWidget,
                    onDelete: controller.onDelete,
                  ),
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonAddItem(
        route: controller.formRouter,
      ),
    );
  }

  BaseItemListWidget get cardItemWidget;

}