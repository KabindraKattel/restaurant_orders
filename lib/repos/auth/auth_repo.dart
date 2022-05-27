import 'package:dartz/dartz.dart';
import 'package:restaurant_orders/core/exceptions_and_failures/exceptions_and_failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> isUserSignedIn();

  Future<Either<Failure, void>> signInWithCredentials({
    required String mobileNo,
    required String fPin,
  });

  Future<Either<Failure, void>> signOut();
}
