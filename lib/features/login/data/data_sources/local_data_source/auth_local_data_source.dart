import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken({
    required String token,
  });
  Future<String?> getToken();
  Future<void> removeToken();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  AuthLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;
  static const String _tokenKey = 'token_key';

  @override
  Future<String?> getToken() async {
    return sharedPreferences.getString(_tokenKey);
  }

  @override
  Future<void> removeToken() async {
    await sharedPreferences.remove(_tokenKey);
  }

  @override
  Future<void> saveToken({
    required String token,
  }) async {
    await sharedPreferences.setString(_tokenKey, token);
  }
}
