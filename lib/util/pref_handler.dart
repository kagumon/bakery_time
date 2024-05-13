import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHandler {
  static final PreferencesHandler instance = PreferencesHandler._internal();
  factory PreferencesHandler()=>instance;
  PreferencesHandler._internal();
  
  late final SharedPreferences _pref;
  SharedPreferences get pref => _pref;

  Future<void> initSharedPreferences() async {
    _pref =  await SharedPreferences.getInstance();
  }
}