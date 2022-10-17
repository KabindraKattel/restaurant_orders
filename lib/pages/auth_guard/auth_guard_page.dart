import 'dart:async';

import 'package:check_connectivity/check_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/extensions/new_version_extension.dart';
import 'package:restaurant_orders/core/pages/will_pop_page.dart';
import 'package:restaurant_orders/core/resources/color_constants.dart';
import 'package:restaurant_orders/core/widgets/my_error.dart';
import 'package:restaurant_orders/main.dart';
import 'package:restaurant_orders/pages/auth_guard/widgets/login/login_screen.dart';
import 'package:restaurant_orders/pages/landing/landing_screen.dart';
import 'package:restaurant_orders/state_management/auth_guard/auth_providers.dart';

import '../../core/widgets/loading.dart';

class AuthGuardPage extends ConsumerStatefulWidget {
  const AuthGuardPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthGuardPage> createState() => _AuthGuardPageState();
}

class _AuthGuardPageState extends ConsumerState<AuthGuardPage> {
  StreamSubscription? _subscription;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _subscription = ref
          .read(watchConnectionStatusChangesProvider)()
          .listen((hasConnection) {
        if (hasConnection) {
          if (!newVersionAlertShown) {
            newVersion.showAlertDialogIfNecessary(context: context);
            newVersionAlertShown = true;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopPage(
      child: Consumer(builder: (context, ref, child) {
        final authState = ref.watch(authNotifierProvider);
        return Scaffold(
          backgroundColor: ColorConstants.kWhite,
          body: authState.when(
            loading: () => const SafeArea(child: Loading()),
            authenticated: () {
              FlutterNativeSplash.remove();
              return const LandingScreen();
            },
            unAuthenticated: () {
              FlutterNativeSplash.remove();
              return const LoginScreen();
            },
            error: (failure, onRetry) {
              FlutterNativeSplash.remove();
              return SafeArea(
                child: MyErrorWidget(
                  failure: failure,
                  onRetry: onRetry,
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
