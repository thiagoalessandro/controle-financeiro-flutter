import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/repositories/base_repository.dart';
import 'package:project_ref_getx/app/core/wrapper/page_wrapper.dart';
import 'package:project_ref_getx/app/features/lembrete/data/datasources/lembrete_api.dart';
import 'package:project_ref_getx/app/features/lembrete/data/mapper/lembrete_mapper.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/entities/lembrete_entity.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/repositories/i_lembrete_repository.dart';

class LembreteRepository extends BaseRepository implements ILembreteRepository {
  final LembreteMapper mapper;
  final LembreteApi lembreteApi;

  LembreteRepository({
    @required this.lembreteApi,
    @required this.mapper,
  });

  Future<Either<ApiException, PageWrapper<LembreteEntity>>> list({@required int pageNumber, @required String search}) async {
    try {
      var pageWrapper = PageWrapper<LembreteEntity>();
      var result = await lembreteApi.list(pageNumber: pageNumber, search: search);
      result.fold((l) => left(l), (r) => {
        pageWrapper.list.value = r.list.map((dto) => mapper.from(dto)).toList(),
        pageWrapper.last = r.last
      });
      return right(pageWrapper);
    } catch (e) {
      logger.e(e);
      return left(ApiException(message: "Erro ao buscar lembrete"));
    }
  }
}
