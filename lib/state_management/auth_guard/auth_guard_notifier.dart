import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/repos/auth/auth_repo.dart';

import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepo _iAuthRepo;
  AuthNotifier(this._iAuthRepo) : super(const AuthState.loading()) {
    isUserLoggedIn();
  }

  Future<void> isUserLoggedIn() async {
    state = const AuthState.loading();
    var failureOrSignedIn = await _iAuthRepo.isUserSignedIn();
    state = failureOrSignedIn.fold(
      (failure) => AuthState.error(failure, () async => isUserLoggedIn()),
      (signedIn) => signedIn
          ? const AuthState.authenticated()
          : const AuthState.unAuthenticated(),
    );
  }

  Future<void> getCurrentUser() async {
    state = const AuthState.loading();
    state = (await _iAuthRepo.isUserSignedIn()).fold(
      (failure) => AuthState.error(failure, () async => getCurrentUser()),
      (signedIn) => signedIn
          ? const AuthState.authenticated()
          : const AuthState.unAuthenticated(),
    );
  }

  Future<void> logOut() async {
    state = const AuthState.loading();
    state = (await _iAuthRepo.signOut()).fold(
      (failure) => AuthState.error(failure, () => logOut()),
      (_) => const AuthState.unAuthenticated(),
    );
  }
}
