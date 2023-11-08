// Project imports:

import 'package:gweiland_project/packages/network/app/entity/get_details_response.dart';
import 'package:gweiland_project/packages/network/entity/common_response.dart';

import '../entity/crypto_list_response.dart';

abstract class AppClient {
  Future<CommonResponse<CryptoListResponse>> getCryptoList(
      int limit, DateTime time);
  Future<CommonResponse<GetDetails>> getLogoDetails(int id);
}
