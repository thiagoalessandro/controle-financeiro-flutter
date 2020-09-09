import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/environment/env.dart';
import 'package:project_ref_getx/app/core/external/bindings/base_bindings..dart';
import 'package:project_ref_getx/app/modules/lembrete/data/datasources/lembrete_api.dart';
import 'package:project_ref_getx/app/modules/lembrete/data/mapper/lembrete_mapper.dart';
import 'package:project_ref_getx/app/modules/lembrete/data/repositories/lembrete_repository.dart';
import 'package:project_ref_getx/app/modules/lembrete/domain/usecases/lembrete_usecase.dart';
import 'package:project_ref_getx/app/modules/lembrete/presenter/controller/form/lembrete_form_controller.dart';
import 'package:project_ref_getx/app/modules/responsavel/data/datasources/responsavel_api.dart';
import 'package:project_ref_getx/app/modules/responsavel/data/mapper/responsavel_mapper.dart';
import 'package:project_ref_getx/app/modules/responsavel/data/repositories/responsavel_repository.dart';
import 'package:project_ref_getx/app/modules/responsavel/domain/usecases/responsavel_usecase.dart';

class LembreteFormBinding extends BaseBindings implements Bindings {
  LembreteFormBinding() : super(baseUrl: environment.baseUrlContaPagar);

  @override
  void dependencies() {
    Get.lazyPut<LembreteFormController>(() {
      return LembreteFormController(
        LembreteUsecase(
          LembreteRepository(
            LembreteApi(
              dio,
            ),
            LembreteMapper(),
          ),
        ),
        ResponsavelUsecase(
          ResponsavelRepository(
            ResponsavelApi(
              dio,
            ),
            ResponsavelMapper(),
          ),
        ),
      );
    });
  }
}
