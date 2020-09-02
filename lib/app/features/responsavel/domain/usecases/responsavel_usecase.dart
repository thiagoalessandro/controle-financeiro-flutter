import 'package:dartz/dartz.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/features/responsavel/domain/entities/reponsavel_entity.dart';
import 'package:project_ref_getx/app/features/responsavel/domain/repositories/i_responsavel_repository.dart';

class ResponsavelUsecase{

  final IResponsavelRepository _repository;

  ResponsavelUsecase(this._repository);

  Future<Either<ApiException, List<ResponsavelEntity>>> list() async {
    var result =  await _repository.list();
    return result.fold((l) => left(l), (r) => right(r));
  }

}