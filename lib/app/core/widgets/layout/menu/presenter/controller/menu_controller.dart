import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/external/controller/base_controller.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/domain/entities/menu_entity.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/domain/usecases/menu_usecase.dart';

class MenuController extends BaseController{
  final MenuUsecase menuUsecase;

  MenuController({@required this.menuUsecase}){
    loadMenu();
  }

  final RxList<MenuEntity> _listMenu = List<MenuEntity>().obs;

  set listMenu(value) => _listMenu.value = value;
  List<MenuEntity> get listMenu => _listMenu.value;
  
  loadMenu() async{
    final result = await menuUsecase.getAll();
    result.fold(
            (Exception e) => Get.rawSnackbar(title: "Alerta", message: e.toString()),
            (data) => this.listMenu = data
    );
  }

}