import 'dart:async';

import 'package:async/async.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/exceptions_and_failures/exceptions_and_failures.dart';

typedef FutureModelBuilder<Model> = Future<Either<Failure, Model>> Function();

class CancelableStateNotifier<State, Model> extends StateNotifier<State> {
  CancelableOperation<Either<Failure, Model>>? _cancelableOperation;
  CancelableStateNotifier(State initial) : super(initial);

  Future<Either<Failure, Model>> run(
      FutureModelBuilder<Model> modelBuilder) async {
    _cancelableOperation = CancelableOperation.fromFuture(modelBuilder(),
        onCancel: () => Left(TimeoutFailure()));
    return await _cancelableOperation!.value;
  }

  @override
  void dispose() {
    _cancelableOperation?.cancel();
    super.dispose();
  }
}
