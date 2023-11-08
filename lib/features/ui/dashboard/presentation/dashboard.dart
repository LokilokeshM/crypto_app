import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gweiland_project/features/ui/dashboard/presentation/widget/bottom_card.dart';
import 'package:gweiland_project/features/ui/dashboard/presentation/widget/search_card.dart';
import 'package:gweiland_project/packages/common/config/config.dart';

import 'widget/list_view.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                AppBar(
                  elevation: 0,
                  backgroundColor: white,
                  title: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "EXCHANGES",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Stack(
                        children: <Widget>[
                          const Icon(
                            Icons.notifications,
                            color: black,
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 12,
                                minHeight: 12,
                              ),
                              child: const Text(
                                "",
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 8,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Icon(Icons.settings)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SearchCard(),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text(
                      "Cryptocurrency",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "NET",
                        style: TextStyle(
                            color: grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.green.shade100.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child: Image.network(
                              "https://s2.coinmarketcap.com/static/img/coins/64x64/1.png"),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "BTC",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text("Bitcoin")
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "\$ 50,000 USD",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "+2.5%",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Top Cryptocurrency",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    TextButton(onPressed: () {}, child: const Text("View All"))
                  ],
                ),
                const Expanded(child: CryptoListView())
              ],
            ),
          ),
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: BottomCard(),
          ),
        ],
      )),
    );
  }
}
