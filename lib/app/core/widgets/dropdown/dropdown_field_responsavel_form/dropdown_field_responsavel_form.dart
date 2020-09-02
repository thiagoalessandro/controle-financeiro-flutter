import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/environment/env.dart';
import 'package:project_ref_getx/app/core/external/view/base_view.dart';
import 'package:project_ref_getx/app/core/widgets/dropdown/dropdown_field_responsavel_form/dropdown_field_responsavel_form_style.dart';
import 'package:project_ref_getx/app/features/responsavel/domain/entities/reponsavel_entity.dart';
import 'package:strings/strings.dart';

class DropdownFieldResponsavelForm extends BaseView with DropdownFieldResponsavelFormStyle{
  final String initialValue;
  final List<ResponsavelEntity> list;
  final Function onSaved;

  DropdownFieldResponsavelForm({
    @required this.initialValue,
    @required this.list,
    @required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddindTextField, right: paddindTextField),
      child: DropdownButtonFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            labelText: "Responsável",
          ),
          value: initialValue,
          items: list.map((ResponsavelEntity responsavel) {
            return new DropdownMenuItem(
              value: responsavel.nome,
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      "${environment.baseUrlIcons}/${responsavel.nome.toLowerCase()}.png",
                    ),
                    backgroundColor: Theme.of(Get.context).primaryColor,
                    radius: radiusAvatar,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: paddindLeftNome),
                    child: Text(camelize(responsavel.nome)),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (String value) {},
          validator: (String value) {
            if (value == null) return 'Campo responsável é obrigatório';
            return null;
          },
          onSaved: onSaved,
        ),
      );
  }
}
