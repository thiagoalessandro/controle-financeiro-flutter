import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/wrapper/page_wrapper.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/entities/lembrete_entity.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/repositories/i_lembrete_repository.dart';

class LembreteUsecase {
  final ILembreteRepository repository;

  LembreteUsecase({@required this.repository})
      : assert(repository != null);

  Future<Either<ApiException, PageWrapper<LembreteEntity>>> listLembrete({@required int pageNumber, @required String search}) async {
    var result = await repository.list(pageNumber: pageNumber, search: search);
    return result.fold((l) => left(l), (r) => right(r));
  }

  Future<Either<ApiException, LembreteEntity>> save({@required LembreteEntity lembreteEntity}) async {
    var result = await repository.save(lembreteEntity: lembreteEntity);
    return result.fold((l) => left(l), (r) => right(r));
  }

}
