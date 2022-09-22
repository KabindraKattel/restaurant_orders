import 'package:dartz/dartz.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';
import 'package:restaurant_orders/models/models.dart';

class FindCartItemState {
  final Either<Failure, MenuItemModel> cartItem;
  const FindCartItemState._(this.cartItem);

  factory FindCartItemState.initial() => FindCartItemState._(
      Left(DataLocateFailure(message: DataNotFoundException().message)));

  FindCartItemState copyWith(Either<Failure, MenuItemModel> cartItems) {
    return FindCartItemState._(cartItems);
  }

  @override
  String toString() {
    return '${cartItem.fold((l) => null, (r) => r)}';
  }
}
