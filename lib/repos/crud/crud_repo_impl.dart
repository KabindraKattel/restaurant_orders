import 'package:dartz/dartz.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';

import 'crud_repo.dart';

class CrudRepoImpl<Model> implements CrudRepo<Model> {
  final List<Model> _items = [];

  @override
  Future<Either<Failure, Model>> findItem(Model item,
      {bool Function(Model item)? filter}) async {
    try {
      return Right(_items
          .firstWhere((element) => filter?.call(element) ?? element == item));
    } on StateError {
      return const Left(CrudFailure());
    } on Exception {
      return const Left(OtherFailure());
    }
  }

  @override
  Future<Either<Failure, List<Model>>> saveItem(Model item,
      {bool Function(Model item)? filter}) async {
    return (await findItem(item, filter: filter)).fold((l) {
      if (l is CrudFailure) {
        return Right(_items..add(item));
      }
      return Left(l);
    }, (found) async {
      try {
        return Right(_items);
      } on Exception {
        return const Left(OtherFailure());
      }
    });
  }

  @override
  Future<Either<Failure, List<Model>>> removeItem(Model item,
      {bool Function(Model item)? filter}) async {
    try {
      return Right(_items
        ..removeWhere((element) => filter?.call(element) ?? element == item));
    } on Exception {
      return const Left(OtherFailure());
    }
  }

  @override
  Future<Either<Failure, List<Model>>> setItems(List<Model> items) async {
    try {
      _items.clear();
      _items.addAll(items);
      return Right(_items);
    } on Exception {
      return Left(OtherFailure());
    }
  }

  @override
  Future<Either<Failure, List<Model>>> clearItems() async {
    try {
      _items.clear();
      return Right(_items);
    } on Exception {
      return Left(OtherFailure());
    }
  }

  @override
  Future<Either<Failure, List<Model>>> getItems() async {
    try {
      return Right(_items);
    } on Exception {
      return const Left(OtherFailure());
    }
  }
}
