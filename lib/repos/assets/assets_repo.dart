import 'package:dartz/dartz.dart';
import 'package:restaurant_orders/models/assets_model.dart';

import '../../core/exceptions_and_failures/exceptions_and_failures.dart';

abstract class AssetRepo {
  Future<Either<Failure, List<AssetModel>>> fetchAssets();
}
