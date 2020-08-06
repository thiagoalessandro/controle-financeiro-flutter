import 'package:get/get.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/controller/lembrete_bindings.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/pages/lembrete_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => LembretePage(),
        binding: LembreteBinding()
    ),
  ];
}
