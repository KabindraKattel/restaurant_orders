import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/exceptions_and_failures/exceptions_and_failures.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated() = Authenticated;
  const factory AuthState.unAuthenticated() = UnAuthenticated;
  const factory AuthState.error(
      Failure failure, Future<void> Function()? onRetry) = AuthError;
}
