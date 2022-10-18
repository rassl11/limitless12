import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_creators/src/core/constants/repositories_keys.dart';
import 'package:users_creators/src/features/creator/entity/domain/creator_data.dart';

class CurrentCreatorRepository {
  CurrentCreatorRepository();

  CreatorProfile? getCurrentCreator() {
    final json = GetIt.I<SharedPreferences>().getString(RepositoriesKeys.currentCreatorKey);
    return json != null ? CreatorProfile.fromJson(jsonDecode(json)) : null;
  }

  Future setCurrentCreator(CreatorProfile followed) async {
    final json = jsonEncode(followed);
    await GetIt.I<SharedPreferences>().setString(RepositoriesKeys.currentCreatorKey, json);
  }
}
