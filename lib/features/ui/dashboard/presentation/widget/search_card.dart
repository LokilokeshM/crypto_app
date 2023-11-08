import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gweiland_project/features/ui/dashboard/application/application.dart';
import 'package:gweiland_project/packages/common/config/config.dart';

class SearchCard extends ConsumerWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Expanded(
            child: CupertinoSearchTextField(
          placeholder: "Search Cryptocurrency ",
        )),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          child: Container(
              decoration: BoxDecoration(
                  color: grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  PopupMenuButton(
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        child: TextButton.icon(
                            onPressed: () {
                              ref.read(cryptoListProvider.notifier).sortPrice();
                            },
                            icon: const Icon(Icons.price_change),
                            label: const Text("Price")),
                      ),
                      PopupMenuItem(
                        child: TextButton.icon(
                            onPressed: () {
                              ref
                                  .read(cryptoListProvider.notifier)
                                  .sortVolume_24h();
                            },
                            icon: const Icon(Icons.timelapse),
                            label: const Text("Time")),
                      ),
                    ],
                  ),
                  Text("Filter"),
                ],
              )),
        )
      ],
    );
  }
}
