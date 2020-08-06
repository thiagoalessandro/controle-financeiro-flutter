import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/features/lembrete/data/datasources/lembrete_api.dart';
import 'package:project_ref_getx/app/features/lembrete/data/mapper/lembrete_mapper.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/entities/lembrete_entity.dart';
import 'package:project_ref_getx/app/features/lembrete/domain/repositories/i_lembrete_repository.dart';

class LembreteRepository implements ILembreteRepository {
  final LembreteMapper mapper;
  final LembreteApi lembreteApi;
  final Logger logger;

  LembreteRepository({
    @required this.lembreteApi,
    @required this.mapper,
    @required this.logger,
  });

  Future<Either<ApiException, List<LembreteEntity>>> getAll() async {
    try {
      var result = await lembreteApi.getAll();
      return result.map((r) => r.map((dto) =>  mapper.from(dto)).toList());
    } catch (e) {
      logger.e(e);
      return left(ApiException(message: "Erro ao buscar lembrete"));
    }
  }
}
