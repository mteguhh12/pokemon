import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pokemon/network/app_api.dart';
import 'package:pokemon/utils/app_config.dart';
import 'package:pokemon/utils/logger.dart';
import 'package:pokemon/utils/utils.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class AppClient {
  late AppApi appClient;
  late Link link;
  late Dio dio;

  AppClient._privateConstructor() {
    _setupClient();
  }

  static final AppClient _instance = AppClient._privateConstructor();

  factory AppClient() {
    return _instance;
  }

  void _setupClient() {
    dio = Dio(BaseOptions(
        baseUrl: AppConfig.environment.apiEndpoint,
        receiveTimeout: 60 * 1000 * 1,
        connectTimeout: 60 * 1000 * 1,
        contentType: "application/json;charset=UTF-8"));
    dio
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};

    // if (AppConfig.environment != Environment.PRODUCTION) {
    //   dio.interceptors.add(alice.getDioInterceptor());
    // }
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 1000));
    }

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      String? accessToken = "";
      if (!Utils.isEmpty(accessToken)) {
        options.headers["Authorization"] = "Bearer $accessToken";
        dio.options.headers["Authorization"] = "Bearer $accessToken";
      } else {
        options.headers.remove("Authorization");
        dio.options.headers.remove("Authorization");
      }
      if (options.path.contains("s3.")) {
        options.headers.remove("Authorization");
        dio.options.headers.remove("Authorization");
      }
      return handler.next(options);
    }, onResponse: (response, handler) async {
      if (response.data is Map && response.data?["errors"] != null) {
        return handler.reject(DioError(
            requestOptions: response.requestOptions,
            error: "${response.data["errors"].toString()}",
            type: DioErrorType.response,
            response: response));
      }
      return handler.next(response);
    }, onError: (DioError error, ErrorInterceptorHandler handler) async {
      logger.d("DioError request: ${error.requestOptions.toString()}");
      logger.d("DioError message: ${error.message}");
      if (error.response?.statusCode == 401) {
        logger.e("UnAuthorization");
        return handler.reject(DioError(
            requestOptions: error.requestOptions,
            error: error,
            type: DioErrorType.response,
            response: error.response));
      }
      if (error.error is SocketException) {
        logger.e("${error.error}");
      }
      return handler.next(error); //continue
    }));
    appClient = AppApi(dio);
  }
}

AppApi appClient = AppClient().appClient;
Link link = AppClient().link;
Dio dio = AppClient().dio;
