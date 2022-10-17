import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/state_management/shared/provider.dart';

import 'asset_notifier.dart';
import 'asset_state.dart';

final assetNotifierProvider =
    StateNotifierProvider.autoDispose<AssetNotifier, AssetState>((ref) {
  return AssetNotifier(ref.watch(assetRepoProvider));
});
