import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_stateless.dart';

class ButtonAddItem extends BaseViewStateless {
  final String route;

  ButtonAddItem({@required this.route});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.offNamed(route);
      },
      child: Icon(
        Icons.add,
      ),
    );
  }
}
