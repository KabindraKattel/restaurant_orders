import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/repos/auth/auth_repo.dart';
import 'package:restaurant_orders/state_management/auth_guard/signin/signin_state.dart';

class SignInNotifier extends StateNotifier<SignInState> {
  final AuthRepo _repo;
  SignInNotifier(this._repo) : super(const SignInInitial());

  Future<void> signInWithCredentials(
      {required String mobileNumber, required String fPin}) async {
    state = const SignInSubmitting();
    final failureOrAuthenticated =
        await _repo.signInWithCredentials(mobileNo: mobileNumber, fPin: fPin);
    state = failureOrAuthenticated.fold((failure) {
      return SignInError(
        failure,
        () async =>
            signInWithCredentials(mobileNumber: mobileNumber, fPin: fPin),
      );
    }, (_) => const SignInAuthenticated());
  }
}
