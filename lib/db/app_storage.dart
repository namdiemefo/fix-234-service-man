import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum TokenType { ACCESS }

class AppStorage {
  final _storage = FlutterSecureStorage();
  String _keys = 'access';


  Future<void> persistToken(Map<TokenType, String> token) async {
    if (token.isNotEmpty) {
      token.forEach((key, value) async {
        await _storage.write(
            key: _keys,
            value: value ?? '');
      });
    }
    return;
  }

  Future<String> getToken(TokenType type) async {
    if (type == TokenType.ACCESS) {
      return await _storage.read(key: _keys);
    }
    return '';
  }

}