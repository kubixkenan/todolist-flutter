abstract class ILocalStorageService {
  Future<bool> setString(String key, String value);
  Future<String> getString(String key);
}
