import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/repositories/base_repository.dart';
import 'package:project_ref_getx/app/core/wrapper/page_wrapper.dart';
import 'package:project_ref_getx/app/modules/lembrete/data/datasources/lembrete_api.dart';
import 'package:project_ref_getx/app/modules/lembrete/data/mapper/lembrete_mapper.dart';
import 'package:project_ref_getx/app/modules/lembrete/domain/entities/lembrete_entity.dart';
import 'package:project_ref_getx/app/modules/lembrete/domain/repositories/i_lembrete_repository.dart';

class LembreteRepository extends BaseRepository implements ILembreteRepository {
  final LembreteMapper _mapper;
  final LembreteApi _lembreteApi;

  LembreteRepository(
    this._lembreteApi,
    this._mapper,
  );

  Future<Either<ApiException, PageWrapper<LembreteEntity>>> list(
      {@required int pageNumber, @required String search}) async {
    var pageWrapper = PageWrapper<LembreteEntity>();
    try {
      var result = await _lembreteApi.list(pageNumber: pageNumber, search: search);
      result.fold(
          (l) => throw l,
          (r) => {
                pageWrapper.list.value =
                    r.list.map((dto) => _mapper.from(dto)).toList(),
                pageWrapper.last = r.last
              });
      return right(pageWrapper);
    } catch (e) {
      logger.e(e);
      return left(e);
    }
  }

  Future<Either<ApiException, LembreteEntity>> save(
      {@required LembreteEntity lembreteEntity}) async {
    var result = await _lembreteApi.save(json: _mapper.toJson(lembreteEntity));
    return result.fold((l) => left(l), (r) => right(_mapper.from(r)));
  }

  @override
  Future<Either<ApiException, bool>> deleteById({int id}) async {
    var result = await _lembreteApi.deleteById(id: id);
    return result.fold((l) => left(l), (r) => right(r));
  }
}
