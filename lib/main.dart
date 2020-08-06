import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/init.dart';
import 'package:project_ref_getx/app/core/themes/appTheme.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/controller/lembrete_bindings.dart';
import 'package:project_ref_getx/app/features/lembrete/presenter/pages/lembrete_page.dart';
import 'package:project_ref_getx/app/routes/app_pages.dart';
import 'package:project_ref_getx/app/routes/app_routes.dart';

void main() {

  Initialize().load();

  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.INITIAL, //Rota inicial
        initialBinding: LembreteBinding(), // dependencias iniciais
        theme: appThemeData, //Tema personalizado app
        defaultTransition: Transition.fade, // Transição de telas padrão
        getPages: AppPages.routes, // Seu array de navegação contendo as rotas e suas pages
        home: LembretePage(), // Page inicial
        locale: Locale('pt', 'BR'), // Língua padrão
      )
  );
}