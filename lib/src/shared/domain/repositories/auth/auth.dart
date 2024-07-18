import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:ecommerce/src/shared/domain/core/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/src/core/helper/sharedpreferenc/sharedpreference.dart';
import 'package:ecommerce/src/shared/domain/models/user_data_model.dart';

class AuthRepository {
  String signupEndPoint = '/user/signup';
  String loginEndPoint = '/user/userlogin';
  Future<String> signup(UserModel modelClass) async {
    try {
      log(modelClass.toJson().toString());
      final response = await http.post(Uri.parse('$baseUrl$signupEndPoint'),
          headers: {
            'content-Type': 'application/json',
            'accept': 'application/json'
          },
          body: jsonEncode(modelClass.toJson()));
      log(response.toString());

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        log(data.toString());
        String usersId = data['data']['Users']['id'].toString();
        log(usersId);
        final accessToken = data['data']['AccessToken'];
        final refreshToken = data['data']['RefreshToken'];
        SharedPreferenceClass.saveUserId(usersId);
        SharedPreferenceClass.saveuserAccessToken(accessToken);
        SharedPreferenceClass.saveuserRefreshToken(refreshToken);
        SharedPreferenceClass.saveUserLoggedInFun(true);
        print('successfully stored user datas');
        return 'success';
      } else {
        final data = jsonDecode(response.body);
        print(data['error']);
        return data['error'];
      }
    } catch (e) {
      if (e is HttpException) {
        debugPrint('Post:: $e');
        return e.toString();
      } else {
        debugPrint('Get Request Error: $e');
        return e.toString();
      }
    }
  }

  Future<String> logIn(UserModel modelClass) async {
    try {
      log(modelClass.toJson().toString());
      final response = await http.post(Uri.parse('$baseUrl$loginEndPoint'),
          headers: {
            'content-Type': 'application/json',
            'accept': 'application/json'
          },
          body: jsonEncode(modelClass.toJson()));
      log(response.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        log(data.toString());
        String usersId = data['data']['Users']['id'].toString();
        log(usersId);
        final accessToken = data['data']['AccessToken'];
        final refreshToken = data['data']['RefreshToken'];
        SharedPreferenceClass.saveUserId(usersId);
        SharedPreferenceClass.saveuserAccessToken(accessToken);
        SharedPreferenceClass.saveuserRefreshToken(refreshToken);
        SharedPreferenceClass.saveUserLoggedInFun(true);
        print('successfully stored user datas');
        return 'success';
      } else {
        final data = jsonDecode(response.body);
        print(data['error']);
        return (data['error']);
      }
    } catch (e) {
      if (e is HttpException) {
        debugPrint('Post:: $e');
        return e.toString();
      } else {
        debugPrint('Get Request Error: $e');
        return e.toString();
      }
    }
  }
}
