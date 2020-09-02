import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/data/mapper/menu_mapper.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/data/models/menu_model.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/domain/entities/menu_entity.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/domain/repositories/i_menu_repository.dart';


class MenuRepository implements IMenuRepository {
  final MenuMapper _mapper;

  MenuRepository(this._mapper);

  @override
  Future<Either<Exception, List<MenuEntity>>> getAll() async {
    List<MenuEntity> listMenuEntity = _listMenu().map((model) => _mapper.from(model)).toList();
    return right(listMenuEntity);
  }

  List<MenuModel> _listMenu() {
    List<MenuModel> listMenu = List<MenuModel>();
    listMenu.add(MenuModel(title: "Lembrete", icon: Icons.add_alert, page: "/"));
    listMenu
        .add(MenuModel(title: "Responsáveis", icon: Icons.people, page: ""));
    listMenu.add(MenuModel(title: "Despesas", icon: Icons.poll, page: ""));
    listMenu
        .add(MenuModel(title: "Cartão Gold", icon: Icons.payment, page: ""));
    listMenu
        .add(MenuModel(title: "Cartão Iconta", icon: Icons.payment, page: ""));
    listMenu
        .add(MenuModel(title: "Cartão Nubank", icon: Icons.payment, page: ""));
    return listMenu;
  }
}
