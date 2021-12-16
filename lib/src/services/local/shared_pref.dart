import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  SharedPref._();

  static late SharedPreferences _instance;

  static init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance => _instance;
}