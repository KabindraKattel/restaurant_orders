import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';

part 'state.freezed.dart';

@freezed
class SaveCartOrderState with _$SaveCartOrderState {
  const factory SaveCartOrderState.initial() = SaveCartOrderInitial;
  const factory SaveCartOrderState.loading() = SaveCartOrderLoading;
  const factory SaveCartOrderState.success(String? tableNum) =
      SaveCartOrderSuccess;
  const factory SaveCartOrderState.error(
      Failure failure, Future<void> Function()? onRetry) = SaveCartOrderError;
}
