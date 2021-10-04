import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager{
  Future<void> savePhoneCode(int token) async{

    final pref = await SharedPreferences.getInstance();

    await pref.setInt("code", token);

  }
  Future<int?> getPhoneCode() async{

    final pref = await SharedPreferences.getInstance();
    return await pref.getInt("code");
  }

}