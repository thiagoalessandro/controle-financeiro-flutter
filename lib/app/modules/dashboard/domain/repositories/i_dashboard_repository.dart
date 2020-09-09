import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/gasto_periodo_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/resumo_cartao_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/resumo_despesa_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/resumo_lembrete_entity.dart';

abstract class IDashboardRepository {
  Future<Either<ApiException, ResumoCartaoEntity>>
      resumoCartaoByTipoAndResponsavel({
    @required String tipoCartao,
    @required String responsavel,
  });

  Future<Either<ApiException, ResumoDespesaEntity>> resumoDespesaByCategoria(
      {@required String categoriaDespesa});

  Future<Either<ApiException, double>> totalGasto();

  Future<Either<ApiException, ResumoLembreteEntity>> resumoLembrete();

  Future<Either<ApiException, List<GastoPeriodoEntity>>> gastoGeralPeriodo(
      {@required String responsavel});
}
