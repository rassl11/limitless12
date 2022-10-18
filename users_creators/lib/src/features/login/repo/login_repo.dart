import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_creators/src/core/constants/repositories_keys.dart';
import 'package:users_creators/src/features/login/domain/auth_model.dart';
import 'package:users_creators/src/features/login/domain/user_login.dart';
import 'package:users_creators/src/features/login/domain/user_signup.dart';
import 'package:users_creators/src/features/settings/presentation/profile/repo/profile_repo.dart';

class LoginRepo {
  final Dio _dio = Dio();
  final _baseUrl = dotenv.env['ENDPOINT'];

  Future login(UserLogin user) async {
    try {
      Response response =
          await _dio.post('$_baseUrl/auth/Login', data: user.toJson());
      if (response.statusCode == 200 && response.data != null) {
        var result = AuthModel.fromJson(response.data);
        await setAuthData(result);
        await ProfileRepo().getProfile();
        return result;
      }
    } catch (e) {
      return e;
    }
  }

  Future signup(UserSignUp user) async {
    try {
      Response response =
          await _dio.post('$_baseUrl/user/User/Register', data: user.toJson());
      log('User login status: ${response.statusCode} ${response.data}  ${user.toJson()}');
      if (response.statusCode == 200 && response.data != null) {}
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      GetIt.I<SharedPreferences>().clear();
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<AuthModel?> refreshToken() async {
    final authData = getAuthData();
    final response = await _dio.post('$_baseUrl/auth/RefreshToken', data: {
      'refreshToken': authData?.refreshToken,
      'accessToken': authData?.accessToken
    });

    if (response.statusCode == 200 && response.data != null) {
      var result = AuthModel.fromJson(response.data);
      log('Refresh result: ${response.data}');
      await setAuthData(result);
      return result;
    } else {
      return null;
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      Response response =
          await _dio.post('$_baseUrl/auth/ForgotPassword?email=$email');
      if (response.statusCode == 200) {
        setEmail(email);
        log('${response.data}');
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> verifyCode(String email, String code) async {
    try {
      Response response = await _dio.post('$_baseUrl/auth/VerifyCode',
          data: {"email": getEmail(), "code": code});
      if (response.statusCode == 200) {
        log('${response.data}');
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> changePassword(
      String email, String password, String confirmation) async {
    try {
      Response response = await _dio.post('$_baseUrl/auth/ChangePassword',
          data: {
            "email": getEmail(),
            "confirmPassword": confirmation,
            "newPassword": password
          });
      if (response.statusCode == 200) {
        log('${response.data}');
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  String? getEmail() {
    return GetIt.I<SharedPreferences>().getString('email');
  }

  Future setEmail(String email) async {
    await GetIt.I<SharedPreferences>().setString('email', email);
  }

  AuthModel? getAuthData() {
    final json =
        GetIt.I<SharedPreferences>().getString(RepositoriesKeys.authDataKey);
    return json != null ? AuthModel.fromJson(jsonDecode(json)) : null;
  }

  Future setAuthData(AuthModel authData) async {
    final json = jsonEncode(authData);
    await GetIt.I<SharedPreferences>()
        .setString(RepositoriesKeys.authDataKey, json);
  }
}
