import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:users_creators/src/features/creator/entity/domain/creator_data.dart';
import 'package:users_creators/src/features/creator/entity/domain/creator_tags.dart';

import '../../../core/dio/interceptors/auth_interceptor.dart';
import '../entity/domain/creator_questionnaire.dart';

class CreatorRepository {
  final Dio _dio = Dio();
  final _baseUrl = dotenv.env['ENDPOINT'];

  CreatorRepository() {
    _dio.interceptors.add(AuthInterceptor());
  }

  Future<CreatorProfile> search(String value) async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/user/Profile/GetCreatorProfile/$value',
      );
      if (response.statusCode == 200 && response.data != null) {
        var result = CreatorProfile.fromJson(response.data);
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }

  Future<List<CreatorTags>> getCreatorTags(String value) async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/user/Tags/GetUserTagById/$value',
      );
      if (response.statusCode == 200 && response.data != null) {
        List<CreatorTags> result = (response.data as List)
            .map((e) => CreatorTags.fromJson(e))
            .toList();
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }

  Future<CreatorQuestionnaire> fetchCreatorServiceQuestionnaire(
      String value) async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/tools/UserQuestionnaire/GetByCreatorId',
        queryParameters: {'creatorId': value},
      );

      if (response.statusCode == 200 && response.data != null) {
        return CreatorQuestionnaire.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }

  // TODO:
  Future<bool> createCreatorServiceQuestionnaireAnswer({
    required String creatorId,
    required String selectedTag,
    required Map<String, String> questionAnswersMap,
    required Map<String, String> formAnswersMap,
    required String fullName,
  }) async {
    try {
      final splittedFullName = fullName.split(' ');

      final questions = <Map<String, String>>[];
      for (var question in questionAnswersMap.entries) {
        final splittedKey = question.key.split(' ');
        questions.add({
          'questionId': splittedKey.last,
          'answer': question.value,
        });
      }

      final formMap = {
        "creatorId": creatorId,
        "questions": questions,
        "coachService":
            "3fa85f64-5717-4562-b3fc-2c963f66afa6", // TODO: serviceId
        "clientGoalTag": selectedTag,
        "firstName": splittedFullName.first,
        "lastName": splittedFullName.last,
        "email": formAnswersMap[
            'Email'], // TODO: select country code --- Now without country code
        "phone": formAnswersMap['Phone']
      };

      return true;

      // Response response = await _dio.post(
      //   '$_baseUrl/tools/UserQuestionnaire/CreateQuestionnaireAnswer',
      //   data: FormData.fromMap(formMap),
      // );

      // if (response.statusCode == 200 && response.data != null) {
      //   return CreatorQuestionnaire.fromJson(response.data);
      // }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }
}
