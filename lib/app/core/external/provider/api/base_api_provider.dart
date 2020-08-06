import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/provider/api/dto/base_api_dto.dart';
import 'package:project_ref_getx/app/core/external/provider/api/i_base_api_provider.dart';

abstract class BaseApiProvider<T extends BaseApiDTO> implements IBaseApiProvider<T> {
  final Dio dio;
  final Logger logger;
  String resourceTitle;

  BaseApiProvider({@required this.dio, @required this.logger});

  Future<Either<ApiException, List<T>>> get({
    String service,
    Map<String, dynamic> queryParameters,
    Options options,
  }) async {
    try {
      Response response = await dio.get("/$service");
      List<T> data = convertToList(response);
      return right(data);
    } on DioError catch (e) {
      String message = "Ocorreu um erro ao buscar ${resourceTitle.toLowerCase()}(s)";
      logger.e(message, e);
      if(e?.response?.statusCode == 404)
        return left(NotFoundException());
      return left(InternalServerErrorException(message: e.error));
    } catch(e){
      logger.e("Erro ao acessar api $service", e);
      return left(InternalServerErrorException(message: e.message));
    }
  }

  List<T> convertToList(dynamic response) => (response.data['data'] as List)
      .map((json) => this.parseJsonToModel(json))
      .toList();

  T parseJsonToModel(dynamic json);
}
