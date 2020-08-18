import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/init.dart';
import 'package:project_ref_getx/app/core/themes/appTheme.dart';

import 'app/core/routes/app_pages.dart';
import 'app/core/routes/app_routes.dart';

void main() {

  Initialize().load();

  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        theme: appThemeData, //Tema personalizado app
        defaultTransition: Transition.native, // Transição de telas padrão
        getPages: AppPages.routes, // Seu array de navegação contendo as rotas e suas pages
        initialRoute: AppRoutes.INITIAL,
        locale: Locale('pt', 'BR'), // Língua padrão
      )
  );
}