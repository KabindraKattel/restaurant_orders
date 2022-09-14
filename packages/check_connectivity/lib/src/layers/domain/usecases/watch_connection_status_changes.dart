import 'package:check_connectivity/src/core/usecases/listenable_usecase.dart';

import '../repository/check_connectivity_repo.dart';

class WatchConnectionStatusChanges implements ListenableUseCase<bool> {
  final CheckConnectivityRepo repo;

  WatchConnectionStatusChanges(this.repo);

  @override
  Stream<bool> call() {
    return repo.watch();
  }
}
