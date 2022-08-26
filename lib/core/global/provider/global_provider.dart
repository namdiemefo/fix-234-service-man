import 'package:flutter/cupertino.dart';
import 'package:service_man/db/app_storage.dart';
import 'package:service_man/helpers/di/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalProvider extends ChangeNotifier {
  bool _signInStatus;
  final AppStorage _appStorage = locator<AppStorage>();
  int _technicians = 1;

  int get technicians => _technicians;

  addTechnicians () {
    _technicians ++;
    notifyListeners();
  }

  removeTechnicians() {
    _technicians == 1 ? _technicians = _technicians : _technicians--;
    notifyListeners();
  }

  bool get signInStatus {
    return _signInStatus ?? false;
  }

  set signInStatus(bool value) {
    _signInStatus = value;
    notifyListeners();
  }

  Future getOnBoardingStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool status = preferences.getBool('sign_in_status');
    String token = await _appStorage.getToken(TokenType.ACCESS);
    if (token != null) {
      signInStatus = true;
    }
    return;
  }

  Future setOnBoardingStatus(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('sign_in_status', value);
    getOnBoardingStatus();
    return;
  }

}