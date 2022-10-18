import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:users_creators/src/core/dio/interceptors/auth_interceptor.dart';
import 'package:users_creators/src/features/onboarding_creator/domain/creator.dart';
import 'package:users_creators/src/features/onboarding_creator/domain/tag.dart';
import 'package:users_creators/src/features/settings/presentation/profile/repo/profile_repo.dart';

import '../../login/repo/login_repo.dart';

class CreatorOnboardingRepo {
  final Dio _dio = Dio();
  final _baseUrl = dotenv.env['ENDPOINT'];
  final loginRepo = LoginRepo();

  CreatorOnboardingRepo() {
    _dio.interceptors.add(AuthInterceptor());
  }

  Future<bool> becomeCreator(Creator user) async {
    try {
      var response = await _dio.post('$_baseUrl/user/User/BecomeCreator',
          data: user.toJson());

      if (response.statusCode == 200 && response.data != null) {
        log('Creator status: ${response.data}');
        await loginRepo.refreshToken();
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> uploadCoverPhoto(File photo) async {
    try {
      String fileName = photo.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(photo.path, filename: fileName),
      });
      Response response = await _dio.post(
        '$_baseUrl/user/User/UploadCoverImage',
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
          followRedirects: false,
          validateStatus: (status) {
            return status != null && status < 500;
          },
        ),
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

  Future<bool> uploadUserPhoto(File photo) async {
    try {
      String fileName = photo.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          photo.path,
          filename: fileName,
        ),
      });

      Response response = await _dio.post('$_baseUrl/user/User/UploadUserPhoto',
          data: formData, options: Options(contentType: 'multipart/form-data'));
      if (response.statusCode == 200) {
        await ProfileRepo().getProfile();
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<List<Tag>> getAllTags() async {
    try {
      Response response = await _dio.get('$_baseUrl/user/Tags/GetAllTags');
      if (response.statusCode == 200 && response.data != null) {
        var result =
            (response.data as List).map((e) => Tag.fromJson(e)).toList();
        return result;
      }
      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<bool> addTags(List<String> tags) async {
    try {
      Response response =
          await _dio.post('$_baseUrl/user/Tags/SetTags', data: tags);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
