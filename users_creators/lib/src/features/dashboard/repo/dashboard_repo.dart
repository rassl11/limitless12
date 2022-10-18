import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:users_creators/src/features/dashboard/entity/model/get_hours.dart';
import 'package:users_creators/src/features/dashboard/entity/model/get_reps.dart';
import 'package:users_creators/src/features/dashboard/entity/model/get_summary_model.dart';
import 'package:users_creators/src/features/dashboard/entity/model/get_volume.dart';
import '../../../core/dio/interceptors/auth_interceptor.dart';

class DashboardRepo {
  final Dio _dio = Dio();
  final _baseUrl = dotenv.env['ENDPOINT'];

  DashboardRepo() {
    _dio.interceptors.add(AuthInterceptor());
  }

  Future<GetSummaryModel> getSummary(int value) async {
    try {
      Response response = await _dio
          .get('$_baseUrl/chronic/Dashboard/GetSummary?timeRange=$value');
      if (response.statusCode == 200 && response.data != null) {
        final result = GetSummaryModel.fromJson((response.data));
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }

  Future<GetVolume> getVolume(int value) async {
    try {
      Response response = await _dio
          .get('$_baseUrl/chronic/Dashboard/GetVolume?timeRange=$value');
      if (response.statusCode == 200 && response.data != null) {
        final result = GetVolume.fromJson((response.data));
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }

  Future<GetHours> getHours(int value) async {
    try {
      Response response = await _dio
          .get('$_baseUrl/chronic/Dashboard/GetHours?timeRange=$value');
      if (response.statusCode == 200 && response.data != null) {
        final result = GetHours.fromJson((response.data));
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }

  Future<GetReps> getReps(int value) async {
    try {
      Response response = await _dio
          .get('$_baseUrl/chronic/Dashboard/GetRepeats?timeRange=$value');
      if (response.statusCode == 200 && response.data != null) {
        final result = GetReps.fromJson((response.data));
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }
}
