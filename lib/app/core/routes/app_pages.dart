import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/widgets/splashscreen/splash_screen_widget.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/controller/form/lembrete_form_bindings.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/controller/list/lembrete_list_bindings.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/pages/lembrete_form_page.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/pages/lembrete_list_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => SplashScreenWidget(),
    ),
    GetPage(
        name: AppRoutes.LEMBRETE,
        page: () => LembreteListPage(),
        binding: LembreteListBinding(),
        title: "Lembrete",
        transition: Transition.leftToRight
    ),
    GetPage(
        name: AppRoutes.LEMBRETE_FORM,
        page: () => LembreteFormPage(),
        binding: LembreteFormBinding(),
        title: "Lembrete",
        transition: Transition.rightToLeft
    ),
  ];
}
