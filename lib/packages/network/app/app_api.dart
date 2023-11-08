import 'package:dio/dio.dart';
import 'package:gweiland_project/packages/network/app/entity/crypto_list_response.dart';
import 'package:retrofit/retrofit.dart';

import 'entity/get_details_response.dart';

part 'app_api.g.dart';

@RestApi()
abstract class AppApis {
  factory AppApis(Dio dio, {String baseUrl}) = _AppApis;

  @GET("v1/cryptocurrency/listings/historical")
  Future<HttpResponse<CryptoListResponse>> getCryptoList(
      @Query("limit") int limit, @Query("date") DateTime time);
  @GET("/v2/cryptocurrency/info")
  Future<HttpResponse<GetDetails>> getLogoDetails(@Query("id") int id);
}
