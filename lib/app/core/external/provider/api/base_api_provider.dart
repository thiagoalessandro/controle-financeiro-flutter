import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:project_ref_getx/app/core/environment/env.dart';
import 'package:project_ref_getx/app/core/errors/api_exception.dart';
import 'package:project_ref_getx/app/core/external/mapper/i_mapper.dart';
import 'package:project_ref_getx/app/core/external/provider/api/dto/base_api_dto.dart';
import 'package:project_ref_getx/app/core/external/provider/api/i_base_api_provider.dart';
import 'package:project_ref_getx/app/core/wrapper/page_wrapper.dart';

abstract class BaseApiProvider<T extends BaseApiDTO>
    implements IBaseApiProvider<T> {

  final Dio _dio;
  final IMapper _mapper;
  final Logger logger = Get.find<Logger>();

  BaseApiProvider(this._dio, this._mapper);

  String get baseService;
  String get resourceTitle;

  Future<Either<ApiException, PageWrapper<T>>> getPage({
    @required String service,
    @required int pageNumber,
    @required String search
  }) async {
    try {
      await checkConnectivity();
      int numberItemPage = environment.numberItemPage;
      Response response = await _dio.get("$service/$pageNumber/$numberItemPage/$search");
      PageWrapper<T> page = convertToPage(response);
      return right(page);
    } on DioError catch (e) {
      String message = "Ocorreu um erro ao buscar ${resourceTitle.toLowerCase()}(s)";
      logger.e(message, e);
      if (e?.response?.statusCode == 404) return left(NotFoundException());
      return left(InternalServerErrorException(message: e.error));
    } catch (e) {
      logger.e("Erro ao acessar api $service", e);
      return left(InternalServerErrorException(message: e));
    }
  }

  Future<Either<ApiException, List<T>>> getAll({String service}) async{
    try {
      await checkConnectivity();
      Response response = await _dio.get("$service");
      List<T> list = convertToList(response);
      return right(list);
    } on DioError catch (e) {
      String message = "Ocorreu um erro ao buscar ${resourceTitle.toLowerCase()}(s)";
      logger.e(message, e);
      if (e?.response?.statusCode == 404) return left(NotFoundException());
      return left(InternalServerErrorException(message: e.error));
    } catch (e) {
      logger.e("Erro ao acessar api $service", e);
      return left(InternalServerErrorException(message: e));
    }
  }

  Future<Either<ApiException, T>> post({@required String service, @required Map body}) async {
    try {
      await checkConnectivity();
      Response response = await _dio.post("$service", data: body);
      List errors = response.data['errors'] as List;
      if(errors != null && errors.length > 0){
        return left(ErrorsException(message: errors.join("\n")));
      }
      T object = convertSingleObject(response);
      return right(object);
    } on DioError catch (e) {
      String message = "Ocorreu um erro ao salvar ${resourceTitle.toLowerCase()}(s)";
      logger.e(message, e);
      if (e?.response?.statusCode == 404) return left(NotFoundException());
      return left(InternalServerErrorException(message: e.error));
    } catch (e) {
      logger.e("Erro ao acessar api $service", e);
      return left(InternalServerErrorException(message: e));
    }
  }

  Future<Either<ApiException, bool>> delete({@required String service, @required int id}) async {
    try {
      await checkConnectivity();
      Response response = await _dio.delete("$service/$id");
      List errors = response.data['errors'] as List;
      if(errors != null && errors.length > 0){
        return left(ErrorsException(message: errors.join("\n")));
      }
      return right(true);
    } on DioError catch (e) {
      String message = "Ocorreu um erro ao deletar ${resourceTitle.toLowerCase()}(s)";
      logger.e(message, e);
      if (e?.response?.statusCode == 404) return left(NotFoundException());
      return left(InternalServerErrorException(message: e.error));
    } catch (e) {
      logger.e("Erro ao acessar api $service", e);
      return left(InternalServerErrorException(message: e));
    }
  }

  PageWrapper<T> convertToPage(dynamic response) {
    var page = PageWrapper<T>();
    page.list.value = (response.data['data']['content'] as List)
        .map((json) => this.parseJsonToModel(json))
        .toList();
    page.last = response.data['data']['last'];
    page.pageNumber = response.data['data']['pageable']['pageNumber'];
    return page;
  }

  List<T> convertToList(dynamic response) => (response.data['data'] as List)
      .map((json) => this.parseJsonToModel(json))
      .toList();

  T convertSingleObject(dynamic response){
    return parseJsonToModel(response.data['data']);
  }

  T parseJsonToModel(json) {
    return _mapper.convert(json);
  }

  checkConnectivity() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      logger.i("Conexão Mobile");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      logger.i("Conexão Wifi");
    } else if (connectivityResult == ConnectivityResult.none) {
      throw ("Sem conexão com a internet");
    }
  }

}
