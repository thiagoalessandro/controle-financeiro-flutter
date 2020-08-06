import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/controller/base_controller.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/entities/lembrete_entity.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/usecases/lembrete_usecase.dart';

class LembreteController extends BaseController {
  final LembreteUsecase lembreteUsecase;

  LembreteController({@required this.lembreteUsecase}) {
    this.getAllLembrete();
  }

  final _listLembrete = List<LembreteEntity>().obs;

  List<LembreteEntity> get listLembrete => this._listLembrete.value;

  set listLembrete(List<LembreteEntity> value) =>
      this._listLembrete.value = value;

  getAllLembrete() async {
    final result = await lembreteUsecase.getAllLembrete();
    result.fold(
        (ApiException e) => Get.rawSnackbar(title: "Alerta", message: e.message.toString()),
        (data) => this.listLembrete = data
    );
  }
}
