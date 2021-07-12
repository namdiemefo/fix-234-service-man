import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalProvider extends ChangeNotifier {
  bool _signInStatus;

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
    signInStatus = status;
    return;
  }

  Future setOnBoardingStatus(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool('sign_in_status', value);
    getOnBoardingStatus();
    return;
  }

}