import 'package:get/get.dart';
import 'package:project_ref_getx/app/core/constants/notification.dart';
import 'package:project_ref_getx/app/core/external/controller/base_controller.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/domain/entities/menu_entity.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/domain/usecases/menu_usecase.dart';

class MenuController extends BaseController{
  final MenuUsecase _menuUsecase;

  MenuController(this._menuUsecase){
    _loadMenus();
  }

  final RxList<MenuEntity> _listMenu = List<MenuEntity>().obs;

  set listMenu(value) => _listMenu.value = value;
  List<MenuEntity> get listMenu => _listMenu.value;
  
  _loadMenus() async{
    final result = await _menuUsecase.getAll();
    result.fold(
            (Exception e) => NotificationCustom.alert(e.toString()),
            (data) => this.listMenu = data
    );
  }

  @override
  String get title => throw UnimplementedError();

}