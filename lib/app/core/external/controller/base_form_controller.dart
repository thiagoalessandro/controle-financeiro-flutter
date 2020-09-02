import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/external/controller/base_controller.dart';

abstract class BaseFormController<T> extends BaseController {
  T entity;

  final formKey = GlobalKey<FormState>();

  BaseFormController() {
    var object = Get.arguments;
    if (object != null) {
      entity = (object as T);
    }else{
      entity = instanceEntity;
    }
  }

  T get instanceEntity;

  Future<void> onSave();
}
