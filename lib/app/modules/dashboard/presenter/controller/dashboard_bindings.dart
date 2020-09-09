import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/environment/env.dart';
import 'package:project_ref_getx/app/core/external/bindings/base_bindings..dart';
import 'package:project_ref_getx/app/modules/dashboard/data/datasources/dashboard_api.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/repositories/dashboard_repository.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/usecases/dashboard_usecase.dart';
import 'package:project_ref_getx/app/modules/dashboard/presenter/controller/dashboard_controller.dart';

class DashboardBinding extends BaseBindings implements Bindings {
  DashboardBinding() : super(baseUrl: environment.baseUrlContaPagar);

  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() {
      return DashboardController(
        DashboardUsecase(
          DashboardRepository(
            DashboardApi(
              dio,
            ),
          ),
        ),
      );
    });
  }
}
