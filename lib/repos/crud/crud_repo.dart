import 'package:dartz/dartz.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';

abstract class CrudRepo<Model> {
  Future<Either<Failure, List<Model>>> saveItem(Model item,
      {bool Function(Model item)? filter});
  Future<Either<Failure, List<Model>>> removeItem(Model item,
      {bool Function(Model item)? filter});
  Future<Either<Failure, bool>> findItem(Model item,
      {bool Function(Model item)? filter});
  Future<Either<Failure, List<Model>>> setItems(List<Model> items);
  Future<Either<Failure, List<Model>>> getItems();
  Future<Either<Failure, List<Model>>> clearItems();
}
