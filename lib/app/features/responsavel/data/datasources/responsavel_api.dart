import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/mapper/i_mapper.dart';
import 'package:project_ref_getx/app/core/external/provider/api/base_api_provider.dart';
import 'package:project_ref_getx/app/features/responsavel/data/models/responsavel_model.dart';

class ResponsavelApi extends BaseApiProvider<ResponsavelModel> {

  ResponsavelApi({
    @required Dio dio,
    @required Logger logger,
    @required IMapper mapper,
  }): super(dio: dio, mapper: mapper) {
    this.resourceTitle = "Responsável";
  }

  Future<Either<ApiException, List<ResponsavelModel>>> list() async{
    return this.getAll(service: "responsavel");
  }

}
