import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';
import 'package:project_ref_getx/app/core/widgets/button/button_save_form/button_save_form.dart';
import 'package:project_ref_getx/app/core/widgets/date_time_field/date_time_field.dart';
import 'package:project_ref_getx/app/core/widgets/dropdown/dropdown_field_responsavel_form/dropdown_field_responsavel_form.dart';
import 'package:project_ref_getx/app/core/widgets/text_field/text_field_form/text_field_form.dart';
import 'package:project_ref_getx/app/core/widgets/text_field/text_field_money/text_field_money.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/controller/form/lembrete_form_controller.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/widgets/form_lembrete/form_lembrete_style.dart';

class FormLembreteWidget extends BaseView with FormLembreteStyle {
  final LembreteFormController controller;

  FormLembreteWidget({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Image.asset(
            "assets/images/calendar.png",
            scale: 3,
          ),
        ),
        TextFieldForm(
            title: "Observação",
            initialValue: controller.entity.observacao,
            iconData: Icons.title,
            validator: (value) => controller.validatorObservacao(value),
            onSaved: (value) => controller.onSavedObservacao(value)),
        Row(
          children: <Widget>[
            Expanded(
              child: DateTimeField(
                title: "Data",
                initialValue: controller.entity.dataCompra,
                validator: (value) => controller.validatorData(value),
                onSaved: (value) => controller.onSavedData(value),
              ),
            ),
            Expanded(
              child: TextFieldMoney(
                title: "Valor",
                initialValue: controller.entity.valor,
                validator: (value) => controller.validatorValor(value),
                onSaved: (value) => controller.onSavedValor(value),
              ),
            )
          ],
        ),
        Obx(
          () => DropdownFieldResponsavelForm(
            list: controller.listResponsavel.value,
            initialValue: controller.entity.responsavel,
            onSaved: (value) => controller.onSavedResponsavel(value),
          ),
        ),
        ButtonSaveForm(
          onSave: controller.onSave,
        )
      ],
    );
  }
}
