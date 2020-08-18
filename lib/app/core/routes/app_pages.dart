import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/widgets/splashscreen/splash_screen_widget.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/controller/lembrete_bindings.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/pages/lembrete_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => SplashScreenWidget(),
    ),
    GetPage(
        name: AppRoutes.LEMBRETE,
        page: () => LembretePage(),
        binding: LembreteBinding()
    ),
  ];
}
