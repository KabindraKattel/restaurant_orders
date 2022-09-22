import 'package:restaurant_orders/models/models.dart';
import 'package:restaurant_orders/repos/crud/crud_repo.dart';
import 'package:restaurant_orders/state_management/cart/find_cart_item_state.dart';
import 'package:restaurant_orders/state_management/shared/cancelable_state_notifier.dart';

class FindCartItemNotifier
    extends CancelableStateNotifier<FindCartItemState, List<MenuItemModel>> {
  final CrudRepo<MenuItemModel> _repo;
  final MenuItemModel item;

  FindCartItemNotifier(this._repo, this.item)
      : super(FindCartItemState.initial()) {
    find();
  }

  Future<void> find() async {
    state = state.copyWith(await _repo.findItem(item,
        filter: (i) =>
            i.iNum != null && item.iNum != null && i.iNum == item.iNum));
  }
}
