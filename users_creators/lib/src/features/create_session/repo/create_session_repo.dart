import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:users_creators/src/features/create_session/entity/domain/create_exercise.dart';
import 'package:users_creators/src/features/create_session/entity/domain/get_exercise.dart';
import '../../../core/dio/interceptors/auth_interceptor.dart';
import '../entity/domain/create_session.dart';
import '../entity/domain/exercise_model.dart';
import '../entity/domain/get_session_by_id.dart';

class CreateSessionRepo {
  final Dio _dio = Dio();
  final _baseUrl = dotenv.env['ENDPOINT'];

  CreateSessionRepo() {
    _dio.interceptors.add(AuthInterceptor());
  }

  Future<CreateExercise?> createExercise(CreateExercise exercise) async {
    try {
      Response response = await _dio.post(
          '$_baseUrl/session/Exercise/CreateNewExercise',
          data: exercise.toJson());
      if (response.statusCode == 200 && response.data != null) {}
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<GetExerciseInfo> getExerciseInfo() async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/session/ExerciseInfo/GetExerciseInfo/',
      );
      if (response.statusCode == 200 && response.data != null) {
        final result = GetExerciseInfo.fromJson((response.data));
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }

  Future<List<ExerciseModel>> getUserExercise(String value) async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/session/Exercise/GetExerciseByUser/$value',
      );
      if (response.statusCode == 200 && response.data != null) {
        List<ExerciseModel> result = (response.data as List)
            .map((e) => ExerciseModel.fromJson(e))
            .toList();
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }

  Future<List<ExerciseModel>> getMyExercise() async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/session/Exercise/GetMyExercise',
      );
      if (response.statusCode == 200 && response.data != null) {
        List<ExerciseModel> result = (response.data as List)
            .map((e) => ExerciseModel.fromJson(e))
            .toList();
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }

  Future<List<ExerciseModel>> getBasicExercise(int page) async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/session/Exercise/GetBasicExercise?page=$page&size=150',
      );
      if (response.statusCode == 200 && response.data != null) {
        List<ExerciseModel> result = (response.data as List)
            .map((e) => ExerciseModel.fromJson(e))
            .toList();
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }

  Future<bool> deleteExerciseById(String exerciseId) async {
    try {
      Response response = await _dio.delete(
        '$_baseUrl/session/Exercise/DeleteExercise/$exerciseId',
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<List<ExerciseModel>> searchExercise(String value) async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/session/Exercise/Search/$value',
      );
      if (response.statusCode == 200 && response.data != null) {
        List<ExerciseModel> result = (response.data as List)
            .map((e) => ExerciseModel.fromJson(e))
            .toList();
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }

  Future<bool> createSession(CreateEditSession createSession) async {
    try {
  
      Response response = await _dio.post(
        '$_baseUrl/session/Session/CreateSession',
        data: createSession.toJson(),
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<bool> editSession(CreateEditSession editSessionModel) async {
    try {
      print(editSessionModel.toJson());
      Response response = await _dio.put(
        '$_baseUrl/session/Session/UpdateSession', 
        data: editSessionModel.toJson(),
      );

      if (response.statusCode == 200) {
        return true;
      }
    
    } catch (e) {
      log(e.toString());
    }
    return false;

  }

  Future<bool> setWorkingMax({
    required String exerciseId,
    required int repMax,
  }) async {
    try {
      Response response = await _dio.put(
        '$_baseUrl/session/Exercise/SetExerciseRepMax',
        data: FormData.fromMap({
          'exerciseId': exerciseId,
          'repMax': repMax,
        }),
      );

      if (response.statusCode == 200 && response.data != null) {
        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<GetSessionById> getSessionById(String sessionId) async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/session/Session/GetSessionById/$sessionId',
        options: Options(contentType: 'application/json'),
      );
      if (response.statusCode == 200 && response.data != null) {
        return GetSessionById.fromJson((response.data));
      }
    } catch (e) {
      log(e.toString());
    }

    throw Exception();
  }


}
