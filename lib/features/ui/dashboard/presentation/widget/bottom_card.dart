import 'package:flutter/material.dart';
import 'package:gweiland_project/packages/common/config/config.dart';
import 'package:gweiland_project/packages/common/config/size_config.dart';
import 'package:gweiland_project/routes/router_path.dart';

class IconNavigation {
  IconData icon;
  String routerPath;
  IconNavigation(this.icon, this.routerPath);
}

// ignore: must_be_immutable
class BottomCard extends StatelessWidget {
  BottomCard({super.key});
  List<IconNavigation> listOfIcons = [
    IconNavigation(Icons.shopping_cart_checkout_rounded, RouterPath.DASHBOARD),
    IconNavigation(Icons.currency_exchange, RouterPath.DASHBOARD),
    IconNavigation(Icons.rocket_launch_sharp, RouterPath.DASHBOARD),
    IconNavigation(Icons.wallet, RouterPath.DASHBOARD)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.screenWidth! * .155,
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            InkWell(
              onTap: () async {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: SizeConfig.screenWidth! * .029,
                        right: SizeConfig.screenWidth! * .0422,
                        left: SizeConfig.screenWidth! * .0422,
                      ),
                      width: SizeConfig.screenWidth! * .128,
                      height: SizeConfig.screenWidth! * .014),
                  Icon(
                    listOfIcons[0].icon,
                    size: 22,
                    color: grey,
                  ),
                  const Text(
                    "E-shop",
                    style: TextStyle(color: grey),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: SizeConfig.screenWidth! * .029,
                        right: SizeConfig.screenWidth! * .0422,
                        left: SizeConfig.screenWidth! * .0422,
                      ),
                      width: SizeConfig.screenWidth! * .128,
                      height: SizeConfig.screenWidth! * .014

                      // decoration: BoxDecoration(
                      //   color: primary,
                      //   borderRadius: const BorderRadius.vertical(
                      //     bottom: Radius.circular(10),
                      //   ),
                      // ),
                      ),
                  Icon(
                    listOfIcons[1].icon,
                    size: 22,
                    color: grey,
                  ),
                  const Text(
                    "Exchange",
                    style: TextStyle(color: grey),
                  ),
                ],
              ),
            ),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.transparent,
              isExtended: true,
              child: Image.network(
                  "https://e7.pngegg.com/pngimages/725/301/png-clipart-70th-golden-globe-awards-71st-golden-globe-awards-wall-street-miscellaneous-globe.png"),
            ),
            InkWell(
              onTap: () async {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: SizeConfig.screenWidth! * .029,
                        right: SizeConfig.screenWidth! * .0422,
                        left: SizeConfig.screenWidth! * .0422,
                      ),
                      width: SizeConfig.screenWidth! * .128,
                      height: SizeConfig.screenWidth! * .014

                      // decoration: BoxDecoration(
                      //   color: primary,
                      //   borderRadius: const BorderRadius.vertical(
                      //     bottom: Radius.circular(10),
                      //   ),
                      // ),
                      ),
                  Icon(
                    listOfIcons[2].icon,
                    size: 22,
                    color: grey,
                  ),
                  const Text(
                    "LaunchPad",
                    style: TextStyle(color: grey),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(
                        bottom: SizeConfig.screenWidth! * .029,
                        right: SizeConfig.screenWidth! * .0422,
                        left: SizeConfig.screenWidth! * .0422,
                      ),
                      width: SizeConfig.screenWidth! * .128,
                      height: SizeConfig.screenWidth! * .014

                      // decoration: BoxDecoration(
                      //   color: primary,
                      //   borderRadius: const BorderRadius.vertical(
                      //     bottom: Radius.circular(10),
                      //   ),
                      // ),
                      ),
                  Icon(
                    listOfIcons[3].icon,
                    size: 22,
                    color: grey,
                  ),
                  const Text(
                    "Wallet",
                    style: TextStyle(color: grey),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
