import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/repos/auth/auth_repo_impl.dart';

import '../../repos/auth/auth_repo.dart';
import '../global_providers.dart';
import 'auth_guard_notifier.dart';
import 'auth_state.dart';

final authRepositoryProvider =
    Provider<AuthRepo>((ref) => AuthRepoImpl(ref.watch(httpClientProvider)));
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(ref.watch(authRepositoryProvider)));
