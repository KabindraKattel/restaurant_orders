import 'package:check_connectivity/src/core/usecases/usecase.dart';
import 'package:check_connectivity/src/layers/domain/repository/check_connectivity_repo.dart';

class GetConnectionStatus implements UseCase<bool> {
  final CheckConnectivityRepo repo;

  GetConnectionStatus(this.repo);

  @override
  Future<bool> call() {
    return repo.check();
  }
}
