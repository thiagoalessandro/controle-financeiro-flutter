import 'package:flutter/cupertino.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/presenter/widgets/menu_widget.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/widgets/card_list_lembrete_widget.dart';
import 'package:project_ref_getx/app/core/widgets/layout/top/top_page_widget.dart';
import 'package:project_ref_getx/app/core/widgets/button/button_add_widget.dart';
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_controller.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/controller/lembrete_controller.dart';

class LembretePage extends BaseViewController<LembreteController> {
  final String title = "Lembrete";

  @override
  Widget build(BuildContext context) {
    ScreenCustom.init(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          TopPageWidget(title: title),
          CardListLembreteWidget(),
          ButtonAddWidget(),
          MenuWidget(),
        ],
      ),
    );
  }
}
