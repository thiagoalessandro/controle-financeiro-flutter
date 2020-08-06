import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/entities/lembrete_entity.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/repositories/i_lembrete_repository.dart';

class LembreteUsecase {
  final ILembreteRepository lembreteRepository;

  LembreteUsecase({@required this.lembreteRepository})
      : assert(lembreteRepository != null);

  Future<Either<ApiException, List<LembreteEntity>>> getAllLembrete() async {
    var result = await lembreteRepository.getAll();
    return result.fold((l) => left(l), (r) => right(r));
  }
}
