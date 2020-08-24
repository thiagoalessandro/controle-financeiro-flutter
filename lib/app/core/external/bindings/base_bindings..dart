import "package:dio/dio.dart";
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_ref_getx/app/core/environment/env.dart';
import 'package:get/get.dart';

abstract class BaseBindings {
  Logger logger;
  Dio dio;

  BaseBindings({@required baseUrl}) {
    _instanceDio(baseUrl);
    _loadInstanceLogger();
  }

  _instanceDio(String baseUrl) {
    BaseOptions baseOptions = BaseOptions(baseUrl: baseUrl);
    dio = new Dio(baseOptions);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      if (!isProduction) _printRequest(options);
      return options;
    }, onResponse: (Response response) async {
      if (!isProduction) _printResponse(response);
      return response;
    }, onError: (DioError e) async {
      logger.e(e.toString());
      return e;
    }));
  }

  _loadInstanceLogger() {
    this.logger = Get.find<Logger>();
  }

  _printRequest(RequestOptions options) {
    logger.d(
        "=================================================== REQUEST ===================================================");
    logger.d("url: ${options.uri}");
    logger.d("headers: ${options.headers}");
    logger.d("method: ${options.method}");
    logger.d("queryParameters: ${options.queryParameters}");
    logger.d("data: ${options.data}");
  }

  _printResponse(Response response) {
    logger.d(
        "=================================================== RESPONSE ===================================================");
    logger.d("url: ${response.request.uri}");
    logger.d("status: ${response.statusCode}");
    logger.d("headers: ${response.headers}");
    logger.d("data: ${response.data}");
  }
}
