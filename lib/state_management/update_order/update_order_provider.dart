import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'update_order_state.dart';

final updateOrderStateProvider = StateProvider.autoDispose<UpdateOrderState>(
  (ref) => const UpdateOrderState.select(),
);
