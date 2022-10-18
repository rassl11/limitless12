import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:users_creators/src/core/dio/interceptors/auth_interceptor.dart';
import 'package:users_creators/src/features/training_session/bloc/swap_exercise/swap_exercise_bloc.dart';
import 'package:users_creators/src/features/training_session/entity/done_session_model.dart';
import 'package:users_creators/src/features/training_session/entity/start_session.dart';
import 'package:users_creators/src/features/training_session/entity/swap_session_model.dart';

class TrainingSessionRepo {
  final Dio _dio = Dio();
  final _baseUrl = dotenv.env['ENDPOINT'];

  TrainingSessionRepo() {
    _dio.interceptors.add(AuthInterceptor());
  }

  Future<StartSessionModel> startSession(String id) async {
    try {
      Response response = await _dio.post(
        '$_baseUrl/session/Training/StartSession?sessionId=$id',
      );
      if (response.statusCode == 200 && response.data != null) {
        final result = StartSessionModel.fromJson((response.data));
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }

  Future<DoneSessionModel?> executeSession(DoneSessionModel doneSessionModel) async {
    try {
      Response response = await _dio.post(
          '$_baseUrl/session/Training/ExecuteSession',
          data: doneSessionModel.toJson());
      if (response.statusCode == 200 && response.data != null) {}
    } catch (e) {
        throw Exception();
    }
    
  }

    Future<SwapExercise?> swapTrainingExercise(SwapExercise swapExerciseModel) async {
    try {
      print(swapExerciseModel.toJson());
      Response response = await _dio.post(
          '$_baseUrl/session/Training/SwapExercise',
          data: swapExerciseModel.toJson());
      if (response.statusCode == 200 && response.data != null) {}
    } catch (e) {
        throw Exception();
    }
    
  }
}
