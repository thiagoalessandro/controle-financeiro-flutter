import 'package:dartz/dartz.dart';
import 'package:project_ref_getx/app/core/widgets/layout/menu/domain/entities/menu_entity.dart';

abstract class IMenuRepository{

  Future<Either<Exception, List<MenuEntity>>> getAll();

}