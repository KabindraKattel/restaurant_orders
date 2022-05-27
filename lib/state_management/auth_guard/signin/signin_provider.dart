import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/state_management/auth_guard/signin/signin_notifier.dart';
import 'package:restaurant_orders/state_management/auth_guard/signin/signin_state.dart';

import '../auth_providers.dart';

final signInNotifierProvider =
    StateNotifierProvider<SignInNotifier, SignInState>(
        (ref) => SignInNotifier(ref.watch(authRepositoryProvider)));
