import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:users_creators/src/core/dio/interceptors/auth_interceptor.dart';
import 'package:users_creators/src/features/library/entity/domain/session_model.dart';
import 'package:users_creators/src/features/library/entity/domain/template_model.dart';
import 'package:users_creators/src/features/login/repo/login_repo.dart';

class MySessionsRepository {
  final Dio _dio = Dio();
  final _baseUrl = dotenv.env['ENDPOINT'];

  MySessionsRepository() {
    _dio.interceptors.add(AuthInterceptor());
  }

  Future<List<SessionModel>> getUserSessions() async {
    try {
      Response response =
          await _dio.get('$_baseUrl/session/Library/GetSessions');
      if (response.statusCode == 200 && response.data != null) {
        List<SessionModel> result = (response.data as List)
            .map((e) => SessionModel.fromJson(e))
            .toList();
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }

  Future<List<TemplateModel>> getUserTemplates() async {
    try {
      final String userId = LoginRepo().getAuthData()!.id;
      Response response = await _dio.get(
        '$_baseUrl/session/Session/GetSessionsByUserId/$userId',
      );
      if (response.statusCode == 200 && response.data != null) {
        List<TemplateModel> result = (response.data as List)
            .map((e) => TemplateModel.fromJson(e))
            .toList();
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }

  Future<bool> deleteSession(String sessionId) async {
    try {
      Response response = await _dio.delete(
        '$_baseUrl/session/Session/Delete?sessionId=$sessionId',
      );
      if (response.statusCode == 200 && response.data != null) {
        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<bool> setSessionToDate(String sessionId, DateTime date) async {
    try {
      final DateFormat formatter = DateFormat('MM/dd/yyyy');
      final String formattedDate = formatter.format(date);

      Response response = await _dio.post(
        '$_baseUrl/chronic/Calendar/SetSessionDate?sessionId=$sessionId&date=$formattedDate',
      );
      if (response.statusCode == 200 && response.data != null) {
        return true;
      }
    } catch (exception) {
      log(exception.toString());
    }
    return false;
  }

  Future<SessionModel> getSessionById(String id) async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/session/Session/GetSessionById/$id',
      );
      if (response.statusCode == 200 && response.data != null) {
        final result = SessionModel.fromJson((response.data));
        return result;
      }
    } catch (exception) {
      log(exception.toString());
    }
    throw Exception();
  }

  Future<bool> copySession(String id) async {
    try {
      Response response = await _dio.post(
        '$_baseUrl/session/Session/CopySession?sessionId=$id',
      );
      if (response.statusCode == 200 && response.data != null) {
        return true;
      }
    } catch (exception) {
      log(exception.toString());
    }
    return false;
  }
}
