import 'dart:async';

import 'package:restaurant_orders/models/assets_model.dart';
import 'package:restaurant_orders/repos/assets/assets_repo.dart';
import 'package:restaurant_orders/state_management/shared/cancelable_state_notifier.dart';

import 'asset_state.dart';

class AssetNotifier
    extends CancelableStateNotifier<AssetState, List<AssetModel>> {
  final AssetRepo _repo;

  AssetNotifier(this._repo) : super(const AssetState.loading()) {
    fetchAssets();
  }

  Future<void> fetchAssets() async {
    state = const AssetState.loading();
    state = (await run(() => _repo.fetchAssets())).fold(
        (failure) => AssetState.error(failure, () async => fetchAssets()),
        (data) => AssetState.data(data));
  }
}
