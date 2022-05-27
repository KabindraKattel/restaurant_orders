import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/failures.dart';

part 'signin_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = SignInInitial;
  const factory SignInState.submitting() = SignInSubmitting;
  const factory SignInState.authenticated() = SignInAuthenticated;
  const factory SignInState.error(
      Failure failure, Future<void> Function()? onRetry) = SignInError;
}
