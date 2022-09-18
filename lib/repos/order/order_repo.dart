import 'package:dartz/dartz.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/failures.dart';
import 'package:restaurant_orders/models/open_order_model.dart';

abstract class OrderRepo {
  Future<Either<Failure, List<OpenOrderModel>>> get openOrders;
}
