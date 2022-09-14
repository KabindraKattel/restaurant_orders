import 'package:check_connectivity/src/layers/domain/repository/check_connectivity_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class CheckConnectivityRepoImpl implements CheckConnectivityRepo {
  @override
  Future<bool> check() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return _getStatusFromType(connectivityResult);
  }

  bool _getStatusFromType(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  @override
  Stream<bool> watch() {
    return Connectivity()
        .onConnectivityChanged
        .map((event) => _getStatusFromType(event));
  }
}
