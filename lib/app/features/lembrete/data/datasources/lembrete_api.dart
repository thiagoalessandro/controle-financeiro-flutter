import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/provider/api/base_api_provider.dart';
import 'package:project_ref_getx/app/core/wrapper/page_wrapper.dart';
import 'package:project_ref_getx/app/features/lembrete/data/mapper/lembrete_mapper.dart';
import 'package:project_ref_getx/app/features/lembrete/data/models/lembrete_model.dart';

class LembreteApi extends BaseApiProvider<LembreteModel> {
  final LembreteMapper mapper;

  LembreteApi(
      {@required Dio dio, @required Logger logger, @required this.mapper})
      : super(dio: dio, logger: logger) {
    this.resourceTitle = "Lembrete";
  }

  Future<Either<ApiException, PageWrapper<LembreteModel>>> list({@required int pageNumber}) async {
    return this.getPage(service: "lembrete", pageNumber: pageNumber);
  }

  @override
  LembreteModel parseJsonToModel(dynamic json) {
    return mapper.convert(json);
  }
}
