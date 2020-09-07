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

abstract class BaseApiProvider implements IBaseApiProvider {

  final Dio _dio;
  final IMapper _mapper;
  final Logger logger = Get.find<Logger>();

  BaseApiProvider(this._dio, this._mapper);

  String get baseService;
  String get resourceTitle;

  Future<Either<ApiException, PageWrapper<T>>> getPage<T extends BaseApiDTO>({
    @required String service,
    @required int pageNumber,
    @required String search
  }) async {
    try {
      await checkConnectivity();
      int numberItemPage = environment.numberItemPage;
      Response response = await _dio.get("$service/$pageNumber/$numberItemPage/$search");
      PageWrapper<T> page = convertToPage<T>(response);
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

  Future<Either<ApiException, List<T>>> getAll<T extends BaseApiDTO>({String service}) async{
    try {
      await checkConnectivity();
      Response response = await _dio.get("$service");
      List<T> list = convertToList<T>(response);
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

  Future<Either<ApiException, T>> post<T extends BaseApiDTO>({@required String service, @required Map body}) async {
    try {
      await checkConnectivity();
      Response response = await _dio.post("$service", data: body);
      List errors = response.data['errors'] as List;
      if(errors != null && errors.length > 0){
        return left(ErrorsException(message: errors.join("\n")));
      }
      T object = convertSingleObject<T>(response);
      return right(object);
    } on DioError catch (e) {
      String message = "Ocorreu um erro ao cadastrar ${resourceTitle.toLowerCase()}(s)";
      logger.e(message, e);
      if (e?.response?.statusCode == 404) return left(NotFoundException());
      return left(InternalServerErrorException(message: e.error));
    } catch (e) {
      logger.e("Erro ao acessar api $service", e);
      return left(InternalServerErrorException(message: e));
    }
  }

  Future<Either<ApiException, T>> put<T extends BaseApiDTO>({@required String service, @required Map body}) async {
    try {
      await checkConnectivity();
      Response response = await _dio.put("$service", data: body);
      List errors = response.data['errors'] as List;
      if(errors != null && errors.length > 0){
        return left(ErrorsException(message: errors.join("\n")));
      }
      T object = convertSingleObject(response);
      return right(object);
    } on DioError catch (e) {
      String message = "Ocorreu um erro ao editar ${resourceTitle.toLowerCase()}(s)";
      logger.e(message, e);
      if (e?.response?.statusCode == 404) return left(NotFoundException());
      return left(InternalServerErrorException(message: e.error));
    } catch (e) {
      logger.e("Erro ao acessar api $service", e);
      return left(InternalServerErrorException(message: e));
    }
  }

  Future<Either<ApiException, T>> registerOrUpdate<T extends BaseApiDTO>({@required String service, @required Map body}) async{
    if(body.containsKey("id") && body["id"] == null){
      return this.post<T>(service: service, body: body);
    }else{
      return this.put<T>(service: service, body: body);
    }
  }

  Future<Either<ApiException, bool>> delete<T extends BaseApiDTO>({@required String service, @required int id}) async {
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

  PageWrapper<T> convertToPage<T extends BaseApiDTO>(dynamic response) {
    var page = PageWrapper<T>();
    page.list.value = (response.data['data']['content'] as List)
        .map((json) => this.parseJsonToModel<T>(json))
        .toList();
    page.last = response.data['data']['last'];
    page.pageNumber = response.data['data']['pageable']['pageNumber'];
    return page;
  }

  List<T> convertToList<T extends BaseApiDTO>(dynamic response) => (response.data['data'] as List)
      .map((json) => this.parseJsonToModel<T>(json))
      .toList();

  T convertSingleObject<T extends BaseApiDTO>(dynamic response){
    return parseJsonToModel<T>(response.data['data']);
  }

  T parseJsonToModel<T extends BaseApiDTO>(json) {
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
