import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/enums/resource_title.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/provider/api/base_api_provider.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/mapper/gasto_periodo_mapper.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/mapper/resumo_cartao_mapper.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/mapper/resumo_despesa_mapper.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/mapper/resumo_lembrete_mapper.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/models/gasto_periodo_model.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/models/resumo_cartao_model.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/models/resumo_despesa_model.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/models/resumo_lembrete_model.dart';

class DashboardApi extends BaseApiProvider {
  DashboardApi(Dio dio) : super(dio);

  @override
  String get baseService => "/dashboard";

  @override
  String get resourceTitle => ResourceTitle.DASHBOARD.description;

  Future<Either<ApiException, List<GastoPeriodoModel>>> gastoGeralPeriodo(
      {@required String responsavel}) async {
    var service = "$baseService/gastos/consolidado/$responsavel";
    return this.getAll<GastoPeriodoModel>(
        service: service, iMapper: GastoPeriodoMapper());
  }

  Future<Either<ApiException, ResumoCartaoModel>>
      resumoCartao({
    @required String tipoCartao,
    @required String responsavel,
  }) async {
    var service = "$baseService/resumoCartao/$responsavel/$tipoCartao";
    return this.get<ResumoCartaoModel>(service: service, iMapper: ResumoCartaoMapper());
  }

  Future<Either<ApiException, ResumoLembreteModel>>
  resumoLembrete({
    @required bool processado,
    @required String responsavel,
  }) async {
    var service = "$baseService/resumoLembrete/$responsavel/$processado";
    return this.get<ResumoLembreteModel>(service: service, iMapper: ResumoLembreteMapper());
  }

  Future<Either<ApiException, ResumoDespesaModel>>
  resumoDespesa({
    @required String categoriaDespesa,
    @required String responsavel,
  }) async {
    var service = "$baseService/resumoDespesa/$responsavel/$categoriaDespesa";
    return this.get<ResumoDespesaModel>(service: service, iMapper: ResumoDespesaMapper());
  }
}
