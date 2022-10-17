import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';
import 'package:restaurant_orders/models/models.dart';

part 'menu_items_state.freezed.dart';

@freezed
class MenuItemsState with _$MenuItemsState {
  const factory MenuItemsState.initial() = MenuItemsInitial;
  const factory MenuItemsState.loading() = MenuItemsLoading;
  const factory MenuItemsState.data({required List<MenuItemModel> menuItems}) =
      MenuItemsData;
  const factory MenuItemsState.error(
      Failure failure, Future<void> Function()? onRetry) = MenuItemsError;
}
