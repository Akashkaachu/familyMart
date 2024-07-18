import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceClass {
  static const userLoggedKey = "LOGGEDINKEY";
  static const userIdKey = 'userIdKey';
  static const userAccessTokenKey = 'userAccessToken';
  static const userRefreshTokenKey = 'userRefreshToken';

//set
  static Future<bool> saveUserLoggedInFun(bool userLogged) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setBool(userLoggedKey, userLogged);
  }

  //set   userId
  static Future<bool> saveUserId(String userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userIdKey, userId);
  }

  //set accesToken
  static Future<bool> saveuserAccessToken(String accessToken) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userAccessTokenKey, accessToken);
  }

  //set  accesToken
  static Future<bool> saveuserRefreshToken(String refreshToken) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userRefreshTokenKey, refreshToken);
  }

  ////////////////////////////Get
  static Future<bool?> getUserLoggedFun() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(userLoggedKey);
  }

  static Future<String?> getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userIdKey);
  }

  //
  static Future<String?> getuserAccessToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userAccessTokenKey);
  }

  static Future<String?> getuserRefreshToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(userRefreshTokenKey);
  }
}
