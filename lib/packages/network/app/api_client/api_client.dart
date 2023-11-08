import 'package:dio/dio.dart';
import 'package:gweiland_project/packages/network/api_config.dart';
import 'package:gweiland_project/packages/network/app/entity/crypto_list_response.dart';
import 'package:gweiland_project/packages/network/app/entity/get_details_response.dart';
import 'package:gweiland_project/packages/network/entity/common_response.dart';
import '../../../network/api_basic.dart';
import '../app_api.dart';

import './app_client.dart';

class AppAPIClient extends AppClient with APIBasic {
  Dio _getAppDio() {
    final dio = getDio();
    return dio;
  }

  AppApis getApi() => AppApis(
        _getAppDio(),
        baseUrl: baseUrl,
      );
  AppApis getLogApi() => AppApis(
        _getAppDio(),
        baseUrl: logoUrl,
      );
  @override
  Future<CommonResponse<CryptoListResponse>> getCryptoList(
          int limit, DateTime time) =>
      requestCallWithDetails((_) => getApi().getCryptoList(limit, time));

  @override
  Future<CommonResponse<GetDetails>> getLogoDetails(int id) =>
      requestCallWithDetails((_) => getLogApi().getLogoDetails(id));
}
