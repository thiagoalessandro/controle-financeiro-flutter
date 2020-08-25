import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/controller/base_controller.dart';
import 'package:project_ref_getx/app/core/mixins/base_form.dart';
import 'package:project_ref_getx/app/core/routes/app_routes.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/entities/lembrete_entity.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/usecases/lembrete_usecase.dart';
import 'package:project_ref_getx/app/features/responsavel/domain/entities/reponsavel_entity.dart';
import 'package:project_ref_getx/app/features/responsavel/domain/usecases/responsavel_usecase.dart';

class LembreteFormController extends BaseController
    with BaseForm<LembreteEntity> {
  final LembreteUsecase lembreteUsecase;
  final ResponsavelUsecase responsavelUsecase;

  final listResponsavel = List<ResponsavelEntity>().obs;
  final dataLembrete = DateTime.now().obs;

  LembreteFormController(
      {@required this.lembreteUsecase, @required this.responsavelUsecase});

  @override
  void onInit() {
    super.onInit();
    entity = LembreteEntity();
    _loadListReponsavel();
  }

  _loadListReponsavel() async {
    var result = await responsavelUsecase.list();
    result.fold(
      (ApiException e) =>
          notification(title: "Alerta", message: e.message.toString()),
      (data) => listResponsavel.value = data,
    );
  }

  @override
  get title => "Lembrete";

  @override
  Future<void> onSave() async {
    try {
      if (formKey.currentState.validate()) {
        formKey.currentState.save();
        var result = await lembreteUsecase.save(lembreteEntity: entity);
        result.fold(
            (exception) => notification(
              title: "Error",
              message: exception.message,
            ),
            (data) => {
                  notification(title: "Sucesso", message: "Lembrete cadastrado"),
                  Get.offAllNamed(AppRoutes.LEMBRETE)
                });
      } else {
        notification(
          title: "Alerta",
          message: "Existem dados inválidos",
        );
      }
    } catch (e) {
      logger.e(e);
      notification(
        title: "Error",
        message: "Ocorreu um erro ao cadastrar o lembrete",
      );
    }
  }
}
