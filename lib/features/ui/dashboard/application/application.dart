import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gweiland_project/features/ui/dashboard/application/crypto_list_notifier.dart';
import 'package:gweiland_project/packages/network/app/entity/crypto_list_response.dart';

final cryptoListProvider =
    StateNotifierProvider<CryptoListNotifier, AsyncValue<List<Datum>>>(
        (ref) => CryptoListNotifier(ref));
