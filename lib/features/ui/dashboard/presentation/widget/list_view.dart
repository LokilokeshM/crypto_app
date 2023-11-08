import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gweiland_project/features/ui/dashboard/application/application.dart';
import 'package:gweiland_project/packages/common/config/size_config.dart';

class CryptoListView extends ConsumerWidget {
  const CryptoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(cryptoListProvider).when(
        data: (data) {
          if (data.isNotEmpty) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            child: data[index].logo != null
                                ? Image.network(data[index].logo ?? "")
                                : const CircularProgressIndicator(),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: SizeConfig.screenWidth! / 2,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${data[index].name}",
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ),
                                          Expanded(
                                            child: Image.network(
                                              "https://freepngimg.com/save/25380-stock-market-graph-up-clipart/417x304",
                                              height: 15,
                                              color: data[index]
                                                          .quote!["USD"]!
                                                          .percentChange24H!
                                                          .roundToDouble() >
                                                      0
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Text("${data[index].symbol}")
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      data[index].quote != null
                                          ? "\$ ${data[index].quote!["USD"]!.price!.roundToDouble()} USD"
                                          : "",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      data[index].quote != null
                                          ? "${data[index].quote!["USD"]!.percentChange24H!.roundToDouble() > 0 ? "+" : "-"} ${data[index].quote!["USD"]!.percentChange24H!.roundToDouble()}%"
                                          : "",
                                      style: TextStyle(
                                          color: data[index]
                                                      .quote!["USD"]!
                                                      .percentChange24H!
                                                      .roundToDouble() >
                                                  0
                                              ? Colors.green
                                              : Colors.red,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
          } else {
            return const Center(child: Text("No Record"));
          }
        },
        error: (e, st) => const Center(child: Text("No Record")),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
