import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/enums/resource_title.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/provider/api/base_api_provider.dart';
import 'package:project_ref_getx/app/core/wrapper/page_wrapper.dart';
import 'package:project_ref_getx/app/modules/lembrete/data/mapper/lembrete_mapper.dart';
import 'package:project_ref_getx/app/modules/lembrete/data/models/lembrete_model.dart';

class LembreteApi extends BaseApiProvider {

  final lembreteMapper = LembreteMapper();

  LembreteApi(Dio dio): super(dio);

  @override
  String get baseService => "/lembretes";

  @override
  String get resourceTitle => ResourceTitle.LEMBRETE.description;

  Future<Either<ApiException, PageWrapper<LembreteModel>>> list({@required int pageNumber, @required String search}) async {
    return this.getPage<LembreteModel>(service: baseService, iMapper: lembreteMapper, pageNumber: pageNumber, search: search);
  }

  Future<Either<ApiException, LembreteModel>> save({@required Map json}) async {
    return this.registerOrUpdate<LembreteModel>(service: baseService, iMapper: lembreteMapper, body: json);
  }

  Future<Either<ApiException, bool>> deleteById({int id}) async {
    return this.delete<LembreteModel>(service: baseService, id: id);
  }

}
