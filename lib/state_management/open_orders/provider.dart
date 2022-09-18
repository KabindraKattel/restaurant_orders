import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_orders/state_management/shared/provider.dart';

import 'notifier.dart';
import 'state.dart';

final openOrdersNotifierProvider =
    StateNotifierProvider.autoDispose<OpenOrdersNotifier, OpenOrdersState>(
        (ref) => OpenOrdersNotifier(ref.watch(orderRepoProvider)));
