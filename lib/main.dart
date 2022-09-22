import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:restaurant_orders/core/extensions/color_extension.dart';
import 'package:restaurant_orders/core/resources/resources.dart';
import 'package:restaurant_orders/core/widgets/counter.dart';
import 'package:restaurant_orders/pages/auth_guard/auth_guard_page.dart';
import 'package:restaurant_orders/pages/create_order/create_order_page.dart';

import 'core/utils/file_utils.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
late final PackageInfo packageInfo;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Lottie.traceEnabled = true;
  packageInfo = await PackageInfo.fromPlatform();
  Hive.init(await FileUtils.getCacheDirPath());
  await Hive.openLazyBox<Map>(CacheManager.kAppCache);
  runApp(
    ProviderScope(
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
      title: StringConstants.kAppName,
      theme: ThemeData(
        primarySwatch: ColorConstants.kPrimaryColor.toMaterialColor(),
      ),
      home: const AuthGuardPage(),
      // const MyHomePage(title: 'Order List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool disable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.title,
          // style: const TextStyle(
          //   fontSize: StylesConstants.kHeadingSize,
          //   fontWeight: StylesConstants.kHeadingWeight,
          // ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CreateOrderPage())),
          ),
        ],
      ),
      body: Column(
        children: [
          if (!disable)
            Counter(
              initial: 1,
              onChanged: (val) {
                if (val == 0) {
                  disable = true;
                  setState(() {});
                }
              },
            ),
          Counter(
            initial: 2,
          ),
        ],
      ),
    );
  }
}
