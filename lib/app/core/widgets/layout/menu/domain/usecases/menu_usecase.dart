import 'package:dartz/dartz.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/domain/entities/menu_entity.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/domain/repositories/i_menu_repository.dart';

class MenuUsecase{

  final IMenuRepository _menuRepository;

  MenuUsecase(this._menuRepository);

  Future<Either<Exception, List<MenuEntity>>> getAll() async{
    var result = await _menuRepository.getAll();
    return result.fold((l) => left(l), (r) => right(r));
  }
}