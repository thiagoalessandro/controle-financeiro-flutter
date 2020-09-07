import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/repositories/base_repository.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/datasources/dashboard_api.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/mapper/gasto_periodo_mapper.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/gasto_periodo_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/resumo_cartao_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/resumo_despesa_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/resumo_lembrete_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/repositories/i_dashboard_repository.dart';

class DashboardRepository extends BaseRepository
    implements IDashboardRepository {
  final DashboardApi _dashboardApi;
  final GastoPeriodoMapper _mapper;

  DashboardRepository(
    this._dashboardApi,
    this._mapper,
  );

  @override
  Future<Either<ApiException, ResumoCartaoEntity>> resumoCartaoByTipo(
      {@required String tipoCartao}) async {
    ResumoCartaoEntity resumoCartaoEntity =
        ResumoCartaoEntity(valorAtual: 1589.0, valorProjecao: 1239.0);
    return right(resumoCartaoEntity);
  }

  @override
  Future<Either<ApiException, ResumoDespesaEntity>> resumoDespesaByCategoria(
      {@required String categoriaDespesa}) async {
    ResumoDespesaEntity resumoDespesaEntity =
        ResumoDespesaEntity(quantidade: 10, valor: 3825.0);
    return right(resumoDespesaEntity);
  }

  @override
  Future<Either<ApiException, ResumoLembreteEntity>> resumoLembrete() async {
    ResumoLembreteEntity resumoLembreteEntity =
        ResumoLembreteEntity(quantidade: 5, valor: 1287.0);
    return right(resumoLembreteEntity);
  }

  @override
  Future<Either<ApiException, double>> totalGasto() async {
    return right(4682.0);
  }

  @override
  Future<Either<ApiException, List<GastoPeriodoEntity>>> gastoGeralPeriodo({@required String responsavel}) async {
    var list = List<GastoPeriodoEntity>();
    try {
      var result = await _dashboardApi.list(responsavel: responsavel);
      result.fold(
          (l) => throw l,
          (r) => {
              list = r.map((dto) => _mapper.from(dto)).toList(),
              });
      return right(list);
    } catch (e) {
      logger.e(e);
      return left(e);
    }
  }
}
