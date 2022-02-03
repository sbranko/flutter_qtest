import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile, Response;

import '../constants/constants.dart';
import '../models/api_error/api_error.dart';
import '../models/api_result/api_result.dart';
import 'alice_service.dart';
import 'logger_service.dart';
import 'storage_service.dart';

enum HttpMethod {
  get,
  post,
  patch,
  delete,
  put,
}

extension on HttpMethod {
  String get name {
    switch (this) {
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
      case HttpMethod.delete:
        return 'DELETE';
      case HttpMethod.patch:
        return 'PATCH';
    }
  }
}

class DioService extends GetxService {
  final storageService = Get.find<StorageService>();

  /// ------------------------
  /// LOGGER
  /// ------------------------

  final loggerService = Get.find<LoggerService>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  late final Dio _dioQapp;
  late final Dio _dioIex;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  Dio get dioQ => _dioQapp;

  Dio get dioIex => _dioIex;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set dioQ(Dio value) => _dioQapp = value;

  set dioIex(Dio value) => _dioIex = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  void onInit() {
    super.onInit();
    initDio();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  void initDio() {
    dioQ = Dio(BaseOptions(
      baseUrl: QappConstants.baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    ))
      ..interceptors.add(
        Get.find<AliceService>().alice.getDioInterceptor(),
      );
  }

  Future<ApiResult<T>> request<T>({
    required String url,
    // ignore: avoid_annotating_with_dynamic
    required T Function(dynamic payload) onSuccess,
    required HttpMethod method,
    Map<String, dynamic>? passedData,
    String? token,
    bool jsonHeader = true,
    FormData? formData,
  }) async {
    T result;

    try {
      dynamic data;
      if (jsonHeader) {
        data = passedData != null ? jsonEncode(passedData) : null;
      } else {
        data = formData;
      }

      final options = jsonHeader
          ? Options(
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                if (token != null) 'Authorization': 'Jwt $token',
              },
              method: method.name,
            )
          : Options(
              headers: {
                'Content-Type': 'multipart/form-data',
                if (token != null) 'Authorization': 'Jwt $token',
              },
              method: method.name,
            );

      final Response response;
      switch (method.name) {
        case 'GET':
          response = await dioQ.get(
            url,
            options: options,
          );
          break;
        case 'POST':
          response = await dioQ.post(
            url,
            data: data,
            options: options,
          );
          break;
        default:
          response = await dioQ.post(
            url,
            data: data,
            options: options,
          );
          break;
      }
      // final genericResult = GenericResponse.fromJson(response.data);

      if (response.data?.toString().isEmpty ?? true) {
        loggerService.logger.i('Success, payload empty');
        return ApiResult<T>.empty();
      } else {
        if (response.data is Map<dynamic, dynamic>) {
          result = onSuccess(response.data as Map<String, dynamic>);
        } else if (response.data is String) {
          result = onSuccess(response.data as String);
        } else if (response.data is int) {
          result = onSuccess(response.data as int);
        } else {
          result = onSuccess(response.data as List<dynamic>);
        }

        loggerService.logger.i(result);
        return ApiResult<T>.success(result);
      }
    } on DioError catch (e) {
      loggerService.logger
          .e('$url\nPOST\n$e]\n[API] Proceeding to parse Dio error.');
      try {
        final errorData = e.response?.data as Map<String, dynamic>;
        final error = ApiError.fromJson(errorData);
        loggerService.logger.e('[API] Parsed Dio error!');
        return ApiResult<T>.error(error);
      } catch (e) {
        loggerService.logger.e('[API] Failed parsing Dio Error! Rethrowing!');
        final error =
            ApiError(message: 'Unsuccessfully tried parsing error message.');
        return ApiResult<T>.error(error);
      }
    }
  }
}
