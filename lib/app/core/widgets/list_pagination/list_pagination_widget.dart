import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/entity/base_entity.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';
import 'package:project_ref_getx/app/core/widgets/list_pagination/list_pagination_style.dart';
import 'package:project_ref_getx/app/core/widgets/loading/progress_pagination/progress_pagination_widget.dart';

import 'base_item_list/base_item_list_widget.dart';

class ListPaginationWidget extends BaseView with ListPaginationStyle {
  final List<BaseEntity> list;
  final ScrollController scrollController;
  final bool loading;
  final bool last;
  final BaseItemListWidget item;
  final Function(BaseEntity entity) onDelete;

  ListPaginationWidget({
    @required this.list,
    @required this.scrollController,
    @required this.loading,
    @required this.last,
    @required this.item,
    @required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    ScreenCustom.init(context);

    return Positioned(
      top: listCardMarginTop,
      width: listCardWidth,
      child: Stack(
        children: <Widget>[
          Container(
            child: Visibility(
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: list.length + 1,
                itemBuilder: (context, index) {
                  if (index == list.length) {
                    return ProgressPaginationWidget(
                      last: last,
                      length: list.length,
                    );
                  } else {
                    return item.generate(list.elementAt(index), onDelete, context);
                  }
                },
                controller: scrollController,
              ),
              visible: !this.loading,
              replacement: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            width: double.infinity,
            height: listCardHeigth,
          ),
        ],
      ),
    );
  }

}
