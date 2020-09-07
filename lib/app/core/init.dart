import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:project_ref_getx/app/core/constants/storage.dart';
import 'package:project_ref_getx/app/core/environment/env.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/data/mapper/menu_mapper.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/data/repositories/menu_repository.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/domain/usecases/menu_usecase.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/presenter/controller/menu_controller.dart';
import 'package:project_ref_getx/app/modules/responsavel/domain/entities/reponsavel_entity.dart';

class Initialize {
  load() async {
    bindingsPermanents();
    defaultLocale();
    await initStorage();
    await loadSessionResponsavel();
  }

  bindingsPermanents() {
    Get.put<Logger>(_instanceLogger(), permanent: true);
    Get.put<MenuController>(_instanceMenuController(), permanent: true);
  }

  initStorage() async {
    await StorageCustom.init();
  }

  Logger _instanceLogger() {
    return Logger(
        printer: PrettyPrinter(methodCount: 0),
        level: isProduction ? Level.info : Level.debug);
  }

  MenuController _instanceMenuController() {
    return MenuController(
      MenuUsecase(
        MenuRepository(
          MenuMapper(),
        ),
      ),
    );
  }

  defaultLocale() {
    Intl.defaultLocale = 'pt_BR';
    initializeDateFormatting(Intl.defaultLocale);
  }

  Future<void> loadSessionResponsavel() async {
    StorageCustom.set("responsavel", "THIAGO");
  }
}
