import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/core/pages/will_pop_page.dart';
import 'package:restaurant_orders/core/resources/color_constants.dart';
import 'package:restaurant_orders/core/widgets/my_error.dart';
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
  @override
  Widget build(BuildContext context) {
    return WillPopPage(
      child: Consumer(builder: (context, ref, child) {
        final authState = ref.watch(authNotifierProvider);
        return Scaffold(
          backgroundColor: ColorConstants.kWhite,
          body: authState.when(
            loading: () => const Loading(),
            authenticated: () {
              return const LandingScreen();
            },
            unAuthenticated: () {
              return const LoginScreen();
            },
            error: (failure, onRetry) {
              return MyErrorWidget(
                failure: failure,
                onRetry: onRetry,
              );
            },
          ),
        );
      }),
    );
  }
}
