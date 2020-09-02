import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/external/controller/base_form_controller.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/widgets/layout/app_bar/app_bar_form/app_bar_form.dart';

import 'base_view_controller.dart';

abstract class BaseLayoutForm<T extends BaseFormController> extends BaseViewController<T> {

  @override
  Widget build(BuildContext context) {
    ScreenCustom.init(context);

    return Scaffold(
      appBar: AppBarForm(
        title: "Adicionar ${controller.title}",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: controller.formKey,
            child: formField(controller)
          ),
        ),
      ),
    );
  }

  formField(T controller);

}