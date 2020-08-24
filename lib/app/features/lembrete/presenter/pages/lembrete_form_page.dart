import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/environment/env.dart';
import 'package:project_ref_getx/app/core/external/screen/screen_custom.dart';
import 'package:project_ref_getx/app/core/external/view/base_view_controller.dart';
import 'package:project_ref_getx/app/core/widgets/button/button_save_form/button_save_form.dart';
import 'package:project_ref_getx/app/core/widgets/date_time_field/date_time_field.dart';
import 'package:project_ref_getx/app/core/widgets/layout/app_bar/app_bar_form/app_bar_form.dart';
import 'package:project_ref_getx/app/core/widgets/text_field/text_field_form/text_field_form.dart';
import 'package:project_ref_getx/app/core/widgets/text_field/text_field_money/text_field_money.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/controller/form/lembrete_form_controller.dart';
import 'package:project_ref_getx/app/features/responsavel/domain/entities/reponsavel_entity.dart';
import 'package:strings/strings.dart';

class LembreteFormPage extends BaseViewController<LembreteFormController> {
  @override
  Widget build(BuildContext context) {
    ScreenCustom.init(context);

    return Scaffold(
      appBar: AppBarForm(
        title: "Adicionar Lembrete",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: <Widget>[
                Center(
                  child: Image.asset(
                    "assets/images/calendar.png",
                    scale: 3,
                  ),
                ),
                TextFieldForm(
                  title: "Observação",
                  iconData: Icons.title,
                  validator: (String value) {
                    if (value.isEmpty) return 'Campo observação é obrigatório';
                    return null;
                  },
                  onSaved: (String value) {
                    controller.entity.observacao = value;
                  },
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: DateTimeField(
                        title: "Data",
                        validator: (String value) {
                          if (value.isEmpty) return 'Campo data é obrigatório';
                          return null;
                        },
                        onSaved: (value){
                          controller.entity.dataCompra = DateTime.parse(value);
                        },
                      ),
                    ),
                    Expanded(
                      child: TextFieldMoney(
                        title: "Valor",
                        validator: (String value) {
                          if (value.isEmpty) return 'Campo valor é obrigatório';
                          return null;
                        },
                        onSaved: (value){
                          controller.entity.valor = value;
                        },
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: paddindTextField, right: paddindTextField),
                  child: Obx(
                    () => DropdownButtonFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "Responsável",
                      ),
                      items: controller.listResponsavel.value
                          .map((ResponsavelEntity responsavel) {
                        return new DropdownMenuItem(
                          value: responsavel,
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "${environment.baseUrlIcons}/${responsavel.nome.toLowerCase()}.png",
                                ),
                                backgroundColor:
                                    Theme.of(Get.context).primaryColor,
                                radius: 12,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(camelize(responsavel.nome)),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (ResponsavelEntity value) {},
                      validator: (ResponsavelEntity value) {
                        if (value == null)
                          return 'Campo responsável é obrigatório';
                        return null;
                      },
                      onSaved: (ResponsavelEntity value) {
                        controller.entity.responsavel = value.nome;
                      },
                    ),
                  ),
                ),
                ButtonSaveForm(
                  onSave: controller.onSave,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
