import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/pages/auth_guard/auth_guard_page.dart';

import 'core/utils/file_utils.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late final PackageInfo packageInfo;
late final NewVersionPlus newVersion;
bool newVersionAlertShown = false;

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  Lottie.traceEnabled = true;
  packageInfo = await PackageInfo.fromPlatform();
  newVersion = NewVersionPlus(

      ///for testing
      // androidId: 'org.telegram.messenger',
      );
  Hive.init(await FileUtils.getCacheDirPath());
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.openLazyBox<Map>(CacheManager.kAppCache);
  runApp(
    const ProviderScope(
      // observers: [AppLocalStateLogger()],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: StringConstants.kAppName,
      theme: ThemeData(
        primarySwatch: ColorConstants.kPrimaryColor.toMaterialColor(),
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(320, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.autoScale(720, name: DESKTOP),
        ],
        // breakpointsLandscape: const [
        //   ResponsiveBreakpoint.autoScale(480, name: MOBILE),
        //   ResponsiveBreakpoint.resize(1024, name: TABLET),
        //   ResponsiveBreakpoint.resize(1280, name: DESKTOP),
        // ],
      ),
      home: const AuthGuardPage(),
      // const MyHomePage(title: 'Order List'),
    );
  }
}
