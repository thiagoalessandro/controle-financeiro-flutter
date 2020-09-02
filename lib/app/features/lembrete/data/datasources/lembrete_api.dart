import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/enums/resource_title.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/mapper/i_mapper.dart';
import 'package:project_ref_getx/app/core/external/provider/api/base_api_provider.dart';
import 'package:project_ref_getx/app/core/wrapper/page_wrapper.dart';
import 'package:project_ref_getx/app/features/lembrete/data/models/lembrete_model.dart';

class LembreteApi extends BaseApiProvider<LembreteModel> {

  LembreteApi(Dio dio, IMapper mapper): super(dio, mapper);

  @override
  String get baseService => "/lembrete";

  @override
  String get resourceTitle => ResourceTitle.LEMBRETE.description;

  Future<Either<ApiException, PageWrapper<LembreteModel>>> list({@required int pageNumber, @required String search}) async {
    return this.getPage(service: baseService, pageNumber: pageNumber, search: search);
  }

  Future<Either<ApiException, LembreteModel>> save({@required Map json}) async {
    return this.post(service: baseService, body: json);
  }

  Future<Either<ApiException, bool>> deleteById({int id}) async {
    return this.delete(service: baseService, id: id);
  }

}
