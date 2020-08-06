import 'package:dartz/dartz.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/entities/lembrete_entity.dart';

abstract class ILembreteRepository {
  Future<Either<ApiException,List<LembreteEntity>>> getAll();
}
