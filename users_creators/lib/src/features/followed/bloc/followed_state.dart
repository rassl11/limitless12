import 'package:users_creators/src/features/followed/domain/followed.dart';

abstract class FollowedState {}

abstract class AllFollowedState extends FollowedState {}

class LoadingAllFollowedState extends AllFollowedState {}

class LoadedAllFollowedState extends AllFollowedState {
  final List<AllFollowed>? followed;

  LoadedAllFollowedState({required this.followed});
}
