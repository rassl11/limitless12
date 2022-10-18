import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:users_creators/src/features/discover/domain/discover_creator.dart';
import 'package:users_creators/src/features/discover/domain/popular_tag.dart';
import 'package:users_creators/src/features/discover/domain/result_search.dart';

import '../../../core/dio/interceptors/auth_interceptor.dart';

class DiscoverRepo {
  final Dio _dio = Dio();
  final _baseUrl = dotenv.env['ENDPOINT'];

  DiscoverRepo() {
    _dio.interceptors.add(AuthInterceptor());
  }

  Future<List<DiscoverCreator>> search(String value) async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/user/Discovery/Search/$value',
      );
      if (response.statusCode == 200 && response.data != null) {
        List<DiscoverCreator> result = (response.data as List)
            .map((e) => DiscoverCreator.fromJson(e))
            .toList();
        return result;
      }
      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<DiscoverCreator>> getMostPopularPersons() async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/user/Discovery/GetMostPopularPersons',
      );
      if (response.statusCode == 200 && response.data != null) {
        List<DiscoverCreator> result = (response.data as List)
            .map((e) => DiscoverCreator.fromJson(e))
            .toList();
        return result;
      }
      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<PopularTag>> get4MostPopularTag() async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/user/Discovery/Get4MostPopularTag',
      );
      if (response.statusCode == 200 && response.data != null) {
        List<PopularTag> result =
            (response.data as List).map((e) => PopularTag.fromJson(e)).toList();
        return result;
      }
      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<DiscoverCreator>> getNewCreators() async {
    try {
      Response response = await _dio.get(
        '$_baseUrl/user/Discovery/GetNewCreators',
      );
      if (response.statusCode == 200 && response.data != null) {
        List<DiscoverCreator> result = (response.data as List)
            .map((e) => DiscoverCreator.fromJson(e))
            .toList();
        return result;
      }
      return [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<List<ResultSearch>> searchByTag(String value) async {
    try {
      Response response = await _dio.get(
        'http://limitless-dev-alb-1844744495.us-east-1.elb.amazonaws.com/user/Discovery/SearchByTag?tagName$value',
      );
      if (response.statusCode == 200 && response.data != null) {
        List<ResultSearch> result = (response.data as List)
            .map((e) => ResultSearch.fromJson(e))
            .toList();
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }

  Future<List<ResultSearch>> searchByName(String value) async {
    try {
      Response response = await _dio.get(
        'http://limitless-dev-alb-1844744495.us-east-1.elb.amazonaws.com/user/Discovery/Search/$value',
      );
      if (response.statusCode == 200 && response.data != null) {
        List<ResultSearch> result = (response.data as List)
            .map((e) => ResultSearch.fromJson(e))
            .toList();
        return result;
      }
    } catch (e) {
      log(e.toString());
    }
    throw Exception();
  }
}
