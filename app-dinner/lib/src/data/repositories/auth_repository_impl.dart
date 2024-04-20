import 'package:Lopy/src/domain/repositories/auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FlutterSecureStorage _secureStorage;
  final String _key = "token";

  AuthRepositoryImpl(this._secureStorage);

  @override
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _key, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await _secureStorage.read(key: _key);
  }

  @override
  Future<void> removeToken() async {
    await _secureStorage.delete(key: _key);
  }
}
