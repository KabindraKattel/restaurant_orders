import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/pages/auth_guard/auth_guard_page.dart';

import 'core/utils/file_utils.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late final PackageInfo packageInfo;

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  Lottie.traceEnabled = true;
  packageInfo = await PackageInfo.fromPlatform();
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: true,
      title: StringConstants.kAppName,
      theme: ThemeData(
        primarySwatch: ColorConstants.kPrimaryColor.toMaterialColor(),
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.autoScale(800, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
      ),
      home: const AuthGuardPage(),
      // const MyHomePage(title: 'Order List'),
    );
  }
}
