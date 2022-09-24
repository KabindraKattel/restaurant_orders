import 'package:dartz/dartz.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/failures.dart';
import 'package:restaurant_orders/models/open_order_model.dart';
import 'package:restaurant_orders/models/order_details_model.dart';

abstract class OrderRepo {
  Future<Either<Failure, List<OpenOrderModel>>> get openOrders;
  Future<Either<Failure, List<OrderDetailModel>>> getOrderDetails(
      String tableNum);
  Future<Either<Failure, void>> saveOrders(
    String tableNum,
    String iNum,
    double quantity,
  );
}
