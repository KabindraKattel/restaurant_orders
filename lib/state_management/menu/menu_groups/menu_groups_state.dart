import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';
import 'package:restaurant_orders/models/models.dart';

part 'menu_groups_state.freezed.dart';

@freezed
class MenuGroupsState with _$MenuGroupsState {
  const factory MenuGroupsState.loading() = MenuGroupsLoading;
  const factory MenuGroupsState.data(
      {required List<MenuGroupModel> menuGroups}) = MenuGroupsData;
  const factory MenuGroupsState.error(
      Failure failure, Future<void> Function()? onRetry) = MenuGroupsError;
}
