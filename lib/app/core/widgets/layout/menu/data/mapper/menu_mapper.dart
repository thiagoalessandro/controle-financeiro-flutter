import 'package:project_ref_getx/app/core/external/mapper/i_mapper.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/data/models/menu_model.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/domain/entities/menu_entity.dart';

class MenuMapper implements IMapper<MenuModel, MenuEntity> {
  @override
  MenuModel convert([dynamic json]) {}

  @override
  MenuEntity from([MenuModel object]) {
    return MenuEntity(
      page: object.page,
      icon: object.icon,
      title: object.title,
    );
  }

  @override
  MenuModel to([MenuEntity object]) {}
}
