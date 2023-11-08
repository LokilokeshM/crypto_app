// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' as retrofit;
import 'package:uuid/uuid.dart';

// Project imports:
import 'api_config.dart';
import 'entity/common_response.dart';
import 'entity/error_entity.dart';

typedef ApiCall<T> = Future<T> Function();
typedef ApiCallCorrelated<T> = Future<T> Function(String correlationId);

const String noNetworkMsg =
    'Please make sure your device is connected to the internet.\n Go to your device Settings to enable Wi-Fi or Cellular Data.';

mixin APIBasic {
  static const bool debug = bool.fromEnvironment("dart.vm.product") != true;
  final uuid = const Uuid();
  String? locale, appVersion, appBrand, apiCategory;

  Dio getDio({
    String? baseUrl,
  }) {
    final dio = Dio();
    _setupCommonHeaders(dio);

    dio.options.connectTimeout = timeout;
    dio.options.sendTimeout = timeout;
    dio.options.receiveTimeout = timeout;
    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
    }
    return dio;
  }

  Future<CommonResponse<T>> requestCall<T>(ApiCall<T> apiCall) async {
    T? response;
    CommonError? error;
    DioException? dioError;
    final start = DateTime.now();
    DateTime end;
    try {
      response = await apiCall.call();
      end = DateTime.now();
    } on Exception catch (obj) {
      end = DateTime.now();
      if (obj is DioException) {
        dioError = obj;
        error = buildError(obj);
      }
      var duration = end.difference(start).inMicroseconds * 1000;
      Map<String, dynamic> details = buildLogDetails(
        duration,
        null, // take it from dioError response
        dioError,
        error,
      );
      await logApi(apiCategory, "requestCall", details: details, isError: true);
    }

    return CommonResponse(response: response, error: error);
  }

  Future<CommonResponse<T>> requestCallWithDetails<T>(
      ApiCallCorrelated<retrofit.HttpResponse<T>> apiCall,
      [String msg = 'api= (api msg not given)']) async {
    retrofit.HttpResponse<T>? response;
    CommonError? error;
    final start = DateTime.now();
    final requestId = uuid.v4();
    DateTime end;
    DioError? dioError;
    try {
      response = await apiCall.call(requestId);
      end = DateTime.now();
    } on Exception catch (obj) {
      end = DateTime.now();
      if (obj is DioError) {
        error = buildError(obj);
        dioError = obj;
      }
    }
    var duration = end.difference(start).inMicroseconds * 1000;
    Map<String, dynamic> details = buildLogDetails(
      duration,
      response?.response,
      dioError,
      error,
    );

    //todo: remove Smukk_common from local ev logger later
    //await logApi(apiCategory, msg, details: details, isError: error != null);
    try {
      debugPrint(details.toString());
    } catch (e) {
      debugPrint(e.toString());
    }

    return CommonResponse(response: response?.data, error: error);
  }

  Map<String, dynamic> buildLogDetails(
    int duration,
    Response<dynamic>? response,
    DioError? dioError,
    CommonError? error,
  ) {
    final Map<String, dynamic> details = {};
    details["duration"] = duration;
    final detailResponse = response ?? dioError?.response;
    // Response info, it may be `null` if the request can't reach to the http server,
    // for example, occurring a dns error, network is not available.
    final uri = detailResponse != null
        ? detailResponse.requestOptions.uri
        : dioError?.requestOptions.uri;
    if (uri != null) {
      debugPrint(uri.toString());
      debugPrint(detailResponse != null
          ? detailResponse.requestOptions.method
          : dioError!.requestOptions.method);
      details["http.url"] = uri.toString();
      details["http.url_details.host"] = uri.host;
      details["http.url_details.port"] = uri.port;
      details["http.url_details.path"] = uri.path;
      details["http.url_details.queryString"] = uri.queryParameters;
      details["http.url_details.scheme"] = uri.scheme;
    }
    if (detailResponse != null) {
      details["http.status_code"] = detailResponse.statusCode;
      debugPrint(detailResponse.statusCode.toString());
      debugPrint(response.toString());
    }

    details["http.method"] = detailResponse != null
        ? detailResponse.requestOptions.method
        : dioError!.requestOptions.method;

    if (error != null) {
      details["error.kind"] = error.errorCodeString;
      debugPrint(error.errorCode.toString());
      details["error.message"] = error.errorMessage;
      debugPrint(error.errorMessage);
    }

    return details;
  }

  CommonError buildError(DioException obj) {
    CommonError? error;
    final res = obj.response;
    if (res?.data != null && res?.data is Map<String, dynamic>) {
      error = buildErrorFromData(res, obj);
    } else {
      error = buildErrorFromPlatformError(obj);
    }
    error ??= buildErrorFromResponse(res);
    return error;
  }

  CommonError buildErrorFromData(
    Response<dynamic>? res,
    DioException obj,
  ) {
    CommonError error;
    dynamic errorEntity;
    try {
      errorEntity = ErrorResponse.fromJson(res?.data);
    } catch (e) {
      debugPrint(e.toString());
    }
    if (errorEntity == null) {
      try {
        errorEntity = ErrorEntity.fromJson(res?.data);
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    if (errorEntity == null) {
      if (res?.data['error'] != null) {
        errorEntity = ErrorEntity(message: res?.data['error']);
      }
    }
    if (errorEntity is ErrorEntity && errorEntity.message?.isNotEmpty == true) {
      error = CommonError(
          errorCode: SERVER_ERROR, errorMessage: errorEntity.message);
    } else if (errorEntity is ErrorResponse &&
        errorEntity.status?.messages.isNotEmpty == true) {
      var msgItem = errorEntity.status?.messages.first.detailedDescription ??
          errorEntity.status?.messages.first.description;
      if (msgItem != null) {
        error = CommonError(errorCode: SERVER_ERROR, errorMessage: msgItem);
      } else {
        error = CommonError(errorCode: SERVER_ERROR, errorMessage: obj.message);
      }
    } else {
      error = CommonError(errorCode: SERVER_ERROR, errorMessage: obj.message);
    }
    return error;
  }

  CommonError buildErrorFromResponse(Response<dynamic>? res) {
    final result = CommonError(
        errorCode: res?.statusCode ?? SERVER_ERROR,
        errorMessage: res?.statusMessage ?? res?.toString());
    return result;
  }

  CommonError? buildErrorFromPlatformError(DioException obj) {
    int errorCode;
    String? errorMsg;
    CommonError? error;
    try {
      switch (obj.error) {
        case SocketException:
          errorCode = NETWORK_ERROR;
          break;
        case TimeoutException:
          errorCode = REQUEST_TIMEOUT_ERROR;
          break;
        default:
          errorCode = HTTP_SERVER_ERROR;
          break;
      }
      errorMsg = obj.error?.toString();
    } catch (e) {
      errorCode = HTTP_SERVER_ERROR;
      errorMsg = "error in api";
    }
    if (errorMsg != null) {
      error = CommonError(errorCode: errorCode, errorMessage: errorMsg);
    }
    return error;
  }

  Future<void> logApi(String? apiCategory, String msg,
      {Map<String, dynamic>? details, bool isError = true}) async {
    try {
      debugPrint(details.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _setupCommonHeaders(Dio dio) {
    dio.options
      ..headers["Access-Control-Allow-Origin"] =
          "*" // Required for CORS support to work
      ..headers["Access-Control-Allow-Origin"] = "*"
      ..headers["Content-Type"] = "application/json"
      ..headers["Access-Control-Allow-Headers"] =
          "Origin, X-Requested-With, Accept, Content-Type, X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale"
      ..headers["Access-Control-Allow-Methods"] =
          "POST, GET, OPTIONS, PUT, DELETE, HEAD"
      ..headers["X-CMC_PRO_API_KEY"] = "b4d6d14c-7e08-4c85-975b-e13bb683d232";
  }
}
