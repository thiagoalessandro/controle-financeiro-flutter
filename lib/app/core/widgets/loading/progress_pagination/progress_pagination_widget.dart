import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_stateless.dart';
import 'package:project_ref_getx/app/core/widgets/loading/progress_pagination/progress_pagination_style.dart';

class ProgressPaginationWidget extends BaseViewStateless with ProgressPaginationStyle{

  final bool last;
  final int length;

  ProgressPaginationWidget({this.last, this.length});

  @override
  Widget build(BuildContext context) {
    if (length != 0 && !(last ?? false)) {
      return Padding(
        padding: EdgeInsets.all(indicatorPaddingAll),
        child: Center(
          child: SpinKitThreeBounce(
            color: Theme.of(context).accentColor,
            size: indicatorSize,
          ),
        ),
      );
    }else{
      return Container();
    }
  }
}