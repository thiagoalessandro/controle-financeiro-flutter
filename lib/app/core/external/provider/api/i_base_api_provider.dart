import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/provider/api/dto/base_api_dto.dart';

abstract class IBaseApiProvider<T extends BaseApiDTO> {

  Future<Either<ApiException, List<T>>> get({
    String service,
    Map<String, dynamic> queryParameters,
    Options options,
  });

  List<T> convertToList(dynamic response);

  T parseJsonToModel(dynamic json);

}