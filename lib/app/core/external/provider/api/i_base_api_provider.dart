import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/provider/api/dto/base_api_dto.dart';
import 'package:project_ref_getx/app/core/wrapper/page_wrapper.dart';

abstract class IBaseApiProvider<T extends BaseApiDTO> {

  Future<Either<ApiException, PageWrapper<T>>> getPage({
    @required String service,
    @required int pageNumber,
  });

  List<T> convertToList(dynamic response);

  T parseJsonToModel(dynamic json);

}