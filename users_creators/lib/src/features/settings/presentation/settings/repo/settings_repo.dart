import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_creators/src/core/constants/repositories_keys.dart';
import 'package:users_creators/src/features/settings/presentation/settings/domain/settings.dart';

import '../../../../../core/dio/interceptors/auth_interceptor.dart';
import '../../../../login/repo/login_repo.dart';

class SettingsRepo {
  final Dio _dio = Dio();
  final _baseUrl = dotenv.env['ENDPOINT'];
  final loginRepo = LoginRepo();

  SettingsRepo() {
    _dio.interceptors.add(AuthInterceptor());
  }

  Future<bool> editSettings(Settings settings) async {
    try {
      Response response = await _dio.put('$_baseUrl/user/settings/updateSettings', data: settings.toJson());
      if (response.statusCode == 200 && response.data != null) {
        await getSettings();
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future getSettings() async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/user/settings/getSettings',
      );
      if (response.statusCode == 200 && response.data != null) {
        var result = Settings.fromJson(response.data);
        log('User settings: ${result.toJson()}');
        await setSettingsData(result);
        return result;
      }
    } catch (e) {
      log(e.toString());
      return e;
    }
  }

  Future<bool> deleteAccount() async {
    try{
      Response response = await _dio.delete(
        '$_baseUrl/user/Profile/Delete',
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Settings? getSettingsData() {
    final json = GetIt.I<SharedPreferences>().getString(RepositoriesKeys.settingsKey);
    return json != null ? Settings.fromJson(jsonDecode(json)) : null;
  }

  Future setSettingsData(Settings settings) async {
    final json = jsonEncode(settings);
    await GetIt.I<SharedPreferences>().setString(RepositoriesKeys.settingsKey, json);
  }
}
