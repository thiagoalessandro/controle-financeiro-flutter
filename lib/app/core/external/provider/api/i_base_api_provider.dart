import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/provider/api/dto/base_api_dto.dart';
import 'package:project_ref_getx/app/core/wrapper/page_wrapper.dart';

abstract class IBaseApiProvider {

  Future<Either<ApiException, PageWrapper<T>>> getPage<T extends BaseApiDTO>({
    @required String service,
    @required int pageNumber,
  });

  List<T> convertToList<T extends BaseApiDTO>(dynamic response);

  T parseJsonToModel<T extends BaseApiDTO>(dynamic json);

}