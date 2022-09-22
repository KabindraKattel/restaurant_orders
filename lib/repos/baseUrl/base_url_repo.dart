abstract class BaseUrlRepo {
  Future<String?> getBaseUrl();

  Future<String?> setBaseUrl({
    required String baseUrl,
  });
}
