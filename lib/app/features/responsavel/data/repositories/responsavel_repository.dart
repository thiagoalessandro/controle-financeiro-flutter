import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/features/responsavel/data/datasources/responsavel_api.dart';
import 'package:project_ref_getx/app/features/responsavel/data/mapper/responsavel_mapper.dart';
import 'package:project_ref_getx/app/features/responsavel/domain/entities/reponsavel_entity.dart';
import 'package:project_ref_getx/app/features/responsavel/domain/repositories/i_responsavel_repository.dart';

class ResponsavelRepository implements IResponsavelRepository {
  final ResponsavelMapper mapper;
  final ResponsavelApi responsavelApi;
  final Logger logger;

  ResponsavelRepository({
    @required this.responsavelApi,
    @required this.mapper,
    @required this.logger,
  });

  @override
  Future<Either<ApiException, List<ResponsavelEntity>>> list() async {
    try {
      var list = List<ResponsavelEntity>();
      var result = await responsavelApi.list();
      result.fold(
          (l) => left(l),
          (r) => {
                list = r.map((dto) => mapper.from(dto)).toList(),
              });
      return right(list);
    } catch (e) {
      logger.e(e);
      return left(ApiException(message: "Erro ao buscar responsável"));
    }
  }
}
