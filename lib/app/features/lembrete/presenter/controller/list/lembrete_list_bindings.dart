import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/environment/env.dart';
import 'package:project_ref_getx/app/core/external/bindings/base_bindings..dart';
import 'package:project_ref_getx/app/features/lembrete/data/datasources/lembrete_api.dart';
import 'package:project_ref_getx/app/features/lembrete/data/mapper/lembrete_mapper.dart';
import 'package:project_ref_getx/app/features/lembrete/data/repositories/lembrete_repository.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/usecases/lembrete_usecase.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/controller/list/lembrete_list_controller.dart';

class LembreteListBinding extends BaseBindings implements Bindings {
  LembreteListBinding() : super(baseUrl: environment.baseUrlContaPagar);

  @override
  void dependencies() {
    Get.lazyPut<LembreteListController>(() {
      return LembreteListController(
        LembreteUsecase(
          repository: LembreteRepository(
            lembreteApi: LembreteApi(
              dio: dio,
              mapper: LembreteMapper(),
            ),
            mapper: LembreteMapper(),
          ),
        ),
      );
    });
  }
}
