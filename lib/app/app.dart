import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../packages/common/config/config.dart';
import '../packages/common/config/size_config.dart';
import '../packages/common/config/ui_config.dart';
import '../routes/router.dart';

class App extends ConsumerStatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  dynamic navRouteData;
  double defaultTxtScaleFactor = 1.0;
  double largerTxtScaleFactor = 1.3;
  final double _uiWidth = 375;
  final double _uiHeight = 812;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return _appWidget(context);
  }

  _appWidget(BuildContext context) {
    final botToastBuilder = BotToastInit();
    final router = ref.watch(goRouterProvider);
    return ScreenUtilInit(
        designSize: Size(_uiWidth, _uiHeight),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            debugShowMaterialGrid: false,
            builder: (context, child) {
              child = botToastBuilder(context, child);
              UiConfig.appContext = context;
              SizeConfig.init(context);
              return child;
            },
            theme: ThemeData.light().copyWith(
                appBarTheme: AppBarTheme(
                    backgroundColor: white,
                    elevation: 0,
                    titleTextStyle: GoogleFonts.poppins(
                        color: kDarkColor, fontWeight: FontWeight.w700),
                    iconTheme: IconThemeData(color: black)),
                scaffoldBackgroundColor: grey,
                iconTheme: const IconThemeData(color: Colors.black),
                textTheme:
                    GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                        .apply(
                  displayColor: Colors.black,
                  bodyColor: Colors.black,
                )),
            debugShowCheckedModeBanner: false,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            routerDelegate: router.routerDelegate,
          );
        });
  }
}
