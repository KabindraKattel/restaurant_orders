import 'package:connectivity_plus/connectivity_plus.dart';

import 'check_connectivity.dart';

class CheckConnectivityImpl implements CheckConnectivity {
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
