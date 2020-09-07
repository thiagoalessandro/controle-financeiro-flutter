import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/enums/resource_title.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/mapper/i_mapper.dart';
import 'package:project_ref_getx/app/core/external/provider/api/base_api_provider.dart';
import 'package:project_ref_getx/app/modules/dashboard/data/models/gasto_periodo_model.dart';
import 'package:project_ref_getx/app/modules/responsavel/data/models/responsavel_model.dart';

class DashboardApi extends BaseApiProvider {

  DashboardApi(Dio dio, IMapper mapper) : super(dio, mapper);

  @override
  String get baseService => "/dashboard";

  @override
  String get resourceTitle => ResourceTitle.RESPONSAVEL.description;

  Future<Either<ApiException, List<GastoPeriodoModel>>> list({@required String responsavel}) async {
    var service = "$baseService/gastos/consolidado/$responsavel";
    return this.getAll<GastoPeriodoModel>(service: service);
  }
}