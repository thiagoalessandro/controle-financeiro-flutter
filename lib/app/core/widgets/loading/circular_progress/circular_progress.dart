import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';

class CircularProgress extends BaseView{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
