abstract class IApiService {
  Future<dynamic> get(String url);
  Future<dynamic> post(String url, dynamic body);
  Future<dynamic> put(String url);
  Future<dynamic> delete(String url);
}
