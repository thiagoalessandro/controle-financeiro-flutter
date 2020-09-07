import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/widgets/splashscreen/splash_screen_widget.dart';
import 'package:project_ref_getx/app/modules/dashboard/presenter/controller/dashboard_bindings.dart';
import 'package:project_ref_getx/app/modules/dashboard/presenter/pages/dashboard_page.dart';
import 'package:project_ref_getx/app/modules/lembrete/presenter/controller/form/lembrete_form_bindings.dart';
import 'package:project_ref_getx/app/modules/lembrete/presenter/controller/list/lembrete_list_bindings.dart';
import 'package:project_ref_getx/app/modules/lembrete/presenter/pages/lembrete_form_page.dart';
import 'package:project_ref_getx/app/modules/lembrete/presenter/pages/lembrete_list_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => SplashScreenWidget(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding()
    ),
    GetPage(
        name: AppRoutes.LEMBRETE,
        page: () => LembreteListPage(),
        binding: LembreteListBinding(),
        transition: Transition.leftToRight
    ),
    GetPage(
        name: AppRoutes.LEMBRETE_FORM,
        page: () => LembreteFormPage(),
        binding: LembreteFormBinding(),
        transition: Transition.rightToLeft
    ),
  ];
}
