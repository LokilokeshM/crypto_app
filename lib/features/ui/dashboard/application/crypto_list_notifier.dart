import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gweiland_project/packages/network/api_client_config.dart';
import 'package:gweiland_project/packages/network/app/entity/crypto_list_response.dart';

class CryptoListNotifier extends StateNotifier<AsyncValue<List<Datum>>> {
  CryptoListNotifier(this.ref) : super(const AsyncValue.loading()) {
    getCryptoList();
  }
  Ref ref;
  List<Datum>? data;
  Future<void> getCryptoList() async {
    try {
      final commonResponse =
          await APIClientConfig.getAppAPI().getCryptoList(20, DateTime.now());
      if (commonResponse.response != null) {
        data = commonResponse.response!.data ?? [];
        state = AsyncValue.data(data!);
        appendLogo();
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> sortPrice() async {
    data!.sort(
        (a, b) => a.quote!["USD"]!.price!.compareTo(b.quote!["USD"]!.price!));
    state = AsyncValue.data(data ?? []);
  }

  Future<void> sortVolume_24h() async {
    data!.sort((a, b) => a.quote!["USD"]!.percentChange24H!
        .compareTo(b.quote!["USD"]!.percentChange24H!));
    state = AsyncValue.data(data ?? []);
  }

  Future<void> appendLogo() async {
    data!.forEach((element) async {
      final res = await APIClientConfig.getAppAPI().getLogoDetails(element.id!);
      if (res.response != null) {
        element.name = res.response!.data!["${element.id}"]["name"];
        element.logo = res.response!.data!["${element.id}"]["logo"];
        log(element.logo.toString());
      }
      state = AsyncValue.data(data!);
    });
  }
}
