import 'package:check_connectivity/src/layers/data/repository/check_connectivity_repo_impl.dart';
import 'package:check_connectivity/src/layers/domain/repository/check_connectivity_repo.dart';
import 'package:check_connectivity/src/layers/domain/usecases/get_connection_status.dart';
import 'package:check_connectivity/src/layers/domain/usecases/watch_connection_status_changes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _checkConnectivityRepoProvider =
    Provider<CheckConnectivityRepo>((ref) => CheckConnectivityRepoImpl());

final getConnectionStatusProvider = Provider<GetConnectionStatus>(
  (ref) => GetConnectionStatus(
    ref.watch<CheckConnectivityRepo>(
      _checkConnectivityRepoProvider,
    ),
  ),
);

final watchConnectionStatusChangesProvider =
    Provider<WatchConnectionStatusChanges>(
  (ref) => WatchConnectionStatusChanges(
    ref.watch<CheckConnectivityRepo>(
      _checkConnectivityRepoProvider,
    ),
  ),
);
