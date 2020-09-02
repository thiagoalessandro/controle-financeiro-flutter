import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/environment/env.dart';
import 'package:project_ref_getx/app/core/external/bindings/base_bindings..dart';
import 'package:project_ref_getx/app/features/lembrete/data/datasources/lembrete_api.dart';
import 'package:project_ref_getx/app/features/lembrete/data/mapper/lembrete_mapper.dart';
import 'package:project_ref_getx/app/features/lembrete/data/repositories/lembrete_repository.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/usecases/lembrete_usecase.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/controller/form/lembrete_form_controller.dart';
import 'package:project_ref_getx/app/features/responsavel/data/datasources/responsavel_api.dart';
import 'package:project_ref_getx/app/features/responsavel/data/mapper/responsavel_mapper.dart';
import 'package:project_ref_getx/app/features/responsavel/data/repositories/responsavel_repository.dart';
import 'package:project_ref_getx/app/features/responsavel/domain/usecases/responsavel_usecase.dart';

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
              LembreteMapper(),
            ),
            LembreteMapper(),
          ),
        ),
        ResponsavelUsecase(
          ResponsavelRepository(
            responsavelApi: ResponsavelApi(
              dio,
              ResponsavelMapper(),
            ),
            mapper: ResponsavelMapper(),
          ),
        ),
      );
    });
  }
}
