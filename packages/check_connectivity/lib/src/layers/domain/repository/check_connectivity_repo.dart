abstract class CheckConnectivityRepo {
  Future<bool> check();

  Stream<bool> watch();
}
