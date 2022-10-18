import 'package:users_creators/src/features/create_session/ui/widgets/history/exercise.dart';

class UserSubscribeState {
  static String follow = '';
  static void changeFollow(status) => follow = status;
  static String userId = '';
  static void changeUserId(id) => userId = id;
  static int checkFollowers = 0;
  static void changeFollowers(int fol) => checkFollowers = fol;

  int followers;
  UserSubscribeState({required this.followers});
}

class ErrorFollowState extends UserSubscribeState {
  ErrorFollowState({required super.followers});
}

class FollowState extends UserSubscribeState {
  FollowState({required super.followers});
}

class LoadingFollowersState extends UserSubscribeState {
  LoadingFollowersState({required super.followers});
}

class LoadedFollowersState extends UserSubscribeState{
  LoadedFollowersState({required super.followers});
}
