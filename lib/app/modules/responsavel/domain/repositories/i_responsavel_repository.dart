import 'package:dartz/dartz.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/modules/responsavel/domain/entities/reponsavel_entity.dart';

abstract class IResponsavelRepository {

  Future<Either<ApiException, List<ResponsavelEntity>>> list();

}