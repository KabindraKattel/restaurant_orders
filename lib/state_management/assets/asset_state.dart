import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';
import 'package:restaurant_orders/models/assets_model.dart';

part 'asset_state.freezed.dart';

@freezed
class AssetState with _$AssetState {
  const factory AssetState.loading() = AssetLoading;
  const factory AssetState.data(List<AssetModel> model) = AssetSuccess;
  const factory AssetState.error(
      Failure failure, Future<void> Function()? onRetry) = AssetError;
}
