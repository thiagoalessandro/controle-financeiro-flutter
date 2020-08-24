import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/entity/base_entity.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_stateless.dart';
import 'package:project_ref_getx/app/core/widgets/list_pagination/list_pagination_style.dart';
import 'package:project_ref_getx/app/core/widgets/loading/progress_pagination/progress_pagination_widget.dart';

import 'base_item_widget.dart';

class ListPaginationWidget extends BaseViewStateless with ListPaginationStyle {
  final List<BaseEntity> list;
  final ScrollController scrollController;
  final bool loading;
  final bool last;
  final BaseItemWidget item;

  ListPaginationWidget({
    @required this.list,
    @required this.scrollController,
    @required this.loading,
    @required this.last,
    @required this.item,
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
            child: !this.loading
                ? ListView.builder(
                    padding: EdgeInsets.all(0),
                    itemCount: list.length + 1,
                    itemBuilder: (context, index) {
                      if (index == list.length) {
                        return ProgressPaginationWidget(
                          last: last,
                          length: list.length,
                        );
                      } else {
                        return item.generate(list.elementAt(index));
                      }
                    },
                    controller: scrollController,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
            width: double.infinity,
            height: listCardHeigth,
          ),
        ],
      ),
    );
  }
}
