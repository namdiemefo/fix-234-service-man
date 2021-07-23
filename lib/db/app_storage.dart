import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:service_man/api/models/auth/response/login_response_model.dart';

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

  Future<void> persistUser(LoginResponseModel loginResponseModel) async {
    await _storage.write(key: 'technician', value: json.encode(loginResponseModel.toJson()));
  }

  Future<LoginResponseModel> getUser() async {
    LoginResponseModel loginResponseModel;
    String value = await _storage.read(key: 'technician');
    if (value != null) {
      loginResponseModel = json.decode(value);
    }
    return loginResponseModel;
  }

  Future<String> getToken(TokenType type) async {
    if (type == TokenType.ACCESS) {
      return await _storage.read(key: _keys);
    }
    return '';
  }

}