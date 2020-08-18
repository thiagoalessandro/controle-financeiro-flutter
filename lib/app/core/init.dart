import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
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
    defaultLocale();
  }

  logger() {
    Logger.level = isProduction ? Level.info : Level.debug;
  }

  bindingsPermanents() {
    Get.put<MenuController>(
        MenuController(
          MenuUsecase(
            menuRepository: MenuRepository(
              mapper: MenuMapper(),
            ),
          ),
        ),
        permanent: true);
  }

  defaultLocale() {
    Intl.defaultLocale = 'pt_BR';
    initializeDateFormatting(Intl.defaultLocale);
  }
}
