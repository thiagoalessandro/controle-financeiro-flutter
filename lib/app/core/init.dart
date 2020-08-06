import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:project_ref_getx/app/core/environment/env.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/data/mapper/menu_mapper.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/data/repositories/menu_repository.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/domain/usecases/menu_usecase.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/presenter/controller/menu_controller.dart';

class Initialize {
  load() {
    logger();
    bindingsPermanents();
  }

  logger() {
    Logger.level = isProduction ? Level.info : Level.debug;
  }

  bindingsPermanents() {
    Get.put<MenuController>(
        MenuController(
          menuUsecase: MenuUsecase(
            menuRepository: MenuRepository(
              mapper: MenuMapper(),
            ),
          ),
        ),
        permanent: true);
  }
}
