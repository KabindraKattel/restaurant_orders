import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/repos/auth/auth_repo_impl.dart';
import 'package:restaurant_orders/repos/auth/auth_repo_local_impl.dart';

import '../../repos/auth/auth_repo.dart';
import '../global_providers.dart';
import 'auth_guard_notifier.dart';
import 'auth_state.dart';

final authRepositoryProvider = Provider<AuthRepo>((ref) =>
    !ref.watch(configProvider)
        ? AuthRepoImpl(ref.watch(connectivityProvider))
        : AuthRepoLocalImpl(ref.watch(connectivityProvider)));
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(ref.watch(authRepositoryProvider)));
