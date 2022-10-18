import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:users_creators/src/features/calendar/session/domain/date_session.dart';
import 'package:users_creators/src/features/calendar/session/domain/session.dart';

import '../../../../core/dio/interceptors/auth_interceptor.dart';

class SessionRepo {
  final Dio _dio = Dio();
  final _baseUrl = dotenv.env['ENDPOINT'];

  SessionRepo() {
    _dio.interceptors.add(AuthInterceptor());
  }

  Future<List<Session>> getSessions(DateTime sessionDate) async {
    try {
      final date = DateFormat('yyyy-MM-dd').format(sessionDate);
      Response response = await _dio.get(
        '$_baseUrl/chronic/Calendar/GetSessionsByDate?date=$date',
      );
      if (response.statusCode == 200 && response.data != null) {
        var result = (response.data as List).map((e) => Session.fromJson(e)).toList();
        return result;
      }
      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future getUserSubscription() async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/user/Subscription/GetUserSubscription',
      );
      // if (response.statusCode == 200 && response.data != null) {
      //   return [];
      // }
      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future getSessionByRange(DateTime firstDate, DateTime lastDate) async {
    try {
      final from = DateFormat('yyyy-MM-dd').format(firstDate);
      final to = DateFormat('yyyy-MM-dd').format(lastDate);
      Response response = await _dio.get(
        '$_baseUrl/chronic/Calendar/GetSessionsByDateRange?from=$from&to=$to',
      );
      if (response.statusCode == 200 && response.data != null) {
        List<DateSession> result = (response.data as List).map((e) => DateSession.fromJson(e)).toList();

        return result;
      }
      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<bool> deleteSession(String sessionId) async {
    try {
      Response response = await _dio.delete(
        '$_baseUrl/session/Session/Delete?sessionId=$sessionId',
      );
      if (response.statusCode == 200 && response.data != null) {
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> copySession(String sessionId, DateTime dateTime) async {
    try {
      final date = DateFormat('yyyy-MM-dd').format(dateTime);
      Response response = await _dio.post(
        '$_baseUrl/session/Session/Copy?sessionId=$sessionId&date=$date',
      );
      if (response.statusCode == 200 && response.data != null) {
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> moveSession(String sessionId, DateTime dateTime) async {
    try {
      final date = DateFormat('yyyy-MM-dd').format(dateTime);
      Response response = await _dio.post(
        '$_baseUrl/chronic/Calendar/MoveSessionDate?sessionId=$sessionId&date=$date',
      );
      if (response.statusCode == 200 && response.data != null) {
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
