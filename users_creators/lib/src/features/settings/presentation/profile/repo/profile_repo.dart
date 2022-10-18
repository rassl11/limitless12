import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_creators/src/core/constants/repositories_keys.dart';
import 'package:users_creators/src/features/login/repo/login_repo.dart';
import 'package:users_creators/src/features/settings/presentation/profile/domain/edit_password.dart';
import 'package:users_creators/src/features/settings/presentation/profile/domain/edited_user.dart';
import 'package:users_creators/src/features/settings/presentation/profile/domain/profile.dart';

import '../../../../../core/dio/interceptors/auth_interceptor.dart';

class ProfileRepo {
  final Dio _dio = Dio();
  final _baseUrl = dotenv.env['ENDPOINT'];
  final loginRepo = LoginRepo();

  ProfileRepo() {
    _dio.interceptors.add(AuthInterceptor());
  }

  Future<bool> editUser(EditedUser user) async {
    try {
      Response response = await _dio.post('$_baseUrl/user/User/updateUser', data: user);
      if (response.statusCode == 200 && response.data != null) {
        await getProfile();
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> changePassword(EditPassword editPassword) async {
    try {
      Response response = await _dio.post('$_baseUrl/auth/changePassword',
          data: {"password": editPassword.password, "confirmPassword": editPassword.confirmPassword, "newPassword": editPassword.newPassword});
      if (response.statusCode == 200 && response.data != null) {
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future getProfile() async {
    try {
      var userId = loginRepo.getAuthData()!.id;
      Response response = await _dio.get(
        '$_baseUrl/user/Profile/GetProfile/{$userId}',
      );
      if (response.statusCode == 200 && response.data != null) {
        var result = Profile.fromJson(response.data);
        log('User profile: ${result.toJson()}');
        await setProfileData(result);
        return result;
      }
    } catch (e) {
      log(e.toString());
      return e;
    }
  }

  Profile? getProfileData() {
    final json = GetIt.I<SharedPreferences>().getString(RepositoriesKeys.profileKey);
    return json != null ? Profile.fromJson(jsonDecode(json)) : null;
  }

  Future setProfileData(Profile settings) async {
    final json = jsonEncode(settings);
    await GetIt.I<SharedPreferences>().setString(RepositoriesKeys.profileKey, json);
  }
}
