import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/gasto_periodo_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/resumo_cartao_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/resumo_despesa_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/entities/resumo_lembrete_entity.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/enums/categoria_despesa.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/enums/tipo_cartao.dart';
import 'package:project_ref_getx/app/modules/dashboard/domain/repositories/i_dashboard_repository.dart';

class DashboardUsecase {
  final IDashboardRepository _repository;

  DashboardUsecase(this._repository);

  Future<Either<ApiException, ResumoCartaoEntity>> resumoCartaoByTipo({@required TipoCartao tipoCartao}) async {
    var result = await _repository.resumoCartaoByTipo(tipoCartao: tipoCartao.toString());
    return result.fold((l) => left(l), (r) => right(r));
  }

  Future<Either<ApiException, ResumoDespesaEntity>> resumoDespesaByCategoria({@required CategoriaDespesa categoriaDespesa}) async {
    var result = await _repository.resumoDespesaByCategoria(categoriaDespesa: categoriaDespesa.toString());
    return result.fold((l) => left(l), (r) => right(r));
  }

  Future<Either<ApiException, ResumoLembreteEntity>> resumoLembrete() async {
    var result = await _repository.resumoLembrete();
    return result.fold((l) => left(l), (r) => right(r));
  }

  Future<Either<ApiException, List<GastoPeriodoEntity>>> gastoGeralPeriodo({@required String responsavel}) async {
    var result = await _repository.gastoGeralPeriodo(responsavel: responsavel);
    return result.fold((l) => left(l), (r) => right(r));
  }

  Future<Either<ApiException, double>> totalGasto() async {
    var result = await _repository.totalGasto();
    return result.fold((l) => left(l), (r) => right(r));
  }

}
