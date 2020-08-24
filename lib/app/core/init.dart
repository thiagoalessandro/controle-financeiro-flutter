import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:project_ref_getx/app/core/environment/env.dart';

class Initialize {
  load() {
    bindingsPermanents();
    defaultLocale();
  }

  bindingsPermanents() {
    Get.put<Logger>(_instanceLogger(), permanent: true);
  }

  Logger _instanceLogger() {
    return Logger(
      printer: PrettyPrinter(methodCount: 0),
      level: isProduction ? Level.info : Level.debug
    );
  }

  defaultLocale() {
    Intl.defaultLocale = 'pt_BR';
    initializeDateFormatting(Intl.defaultLocale);
  }
}
