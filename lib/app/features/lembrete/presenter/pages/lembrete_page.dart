import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_controller.dart';
import 'package:project_ref_getx/app/core/widgets/button/button_option_page/button_option_page_widget.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/presenter/widgets/menu_widget.dart';
import 'package:project_ref_getx/app/core/widgets/layout/topo/topo_page_widget.dart';
import 'package:project_ref_getx/app/core/widgets/list_pagination/list_pagination_widget.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/controller/lembrete_controller.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/widgets/card_item_lembrete_widget.dart';

class LembretePage extends BaseViewController<LembreteController> {
  final String title = "Lembrete";

  @override
  Widget build(BuildContext context) {
    print("Drawing LembretePage");

    ScreenCustom.init(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          TopoPageWidget(title: title),
          RefreshIndicator(
            onRefresh: controller.reloadList,
            child: Obx(
              () => ListPaginationWidget(
                list: controller.listItem.value,
                scrollController: controller.scrollController,
                loading: controller.loading,
                last: controller.last,
                item: CardItemLembreteWidget(),
              ),
            ),
          ),
          MenuWidget(),
        ],
      ),
      floatingActionButton: ButtonOptionPageWidget(),
    );
  }
}
