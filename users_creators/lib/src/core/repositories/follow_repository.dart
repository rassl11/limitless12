import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:users_creators/src/core/dio/interceptors/auth_interceptor.dart';
import 'package:users_creators/src/features/followed/domain/followed.dart';

class FollowRepository {
  final String lastFollowedKey = 'LastFollowedKey';
  final Dio _dio = Dio();
  final _baseUrl = dotenv.env['ENDPOINT'];

  FollowRepository() {
    _dio.interceptors.add(AuthInterceptor());
  }

  Future<bool> follow(String value) async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/user/Follow/FollowUser/$value',
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<bool> unFollow(String value) async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/user/Follow/UnfollowUser/$value',
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<List<AllFollowed>> getAllFollowed() async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/user/Follow/GetAllFollowed',
      );
      if (response.statusCode == 200 && response.data != null) {
        List<AllFollowed> result = (response.data as List).map((e) => AllFollowed.fromJson(e)).toList();

        return result;
      }
    } catch (exception) {
      log(exception.toString());
    }
    throw Exception();
  }
}
