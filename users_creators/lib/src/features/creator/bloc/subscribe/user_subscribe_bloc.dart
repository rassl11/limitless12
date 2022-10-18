import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/core/repositories/follow_repository.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_event.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_state.dart';
import 'package:users_creators/src/features/creator/repo/creator_repo.dart';

class UserSubscribeBloc extends Bloc<SubscribeEvent, UserSubscribeState> {
  UserSubscribeBloc() : super((LoadingFollowersState(followers: 0))) {
    on<LoadingFollowersEvent>(
      (event, emit) async {
        final follower = await CreatorRepository().search(event.creatorId);

        emit(UserSubscribeState(followers: follower.followers!));
      },
    );

    on<FollowEvent>((event, emit) async {
      try {
        emit(UserSubscribeState(followers: state.followers + 1));
        FollowRepository().follow(UserSubscribeState.userId);
      } catch (_) {}
    });

    on<UnFollowEvent>((event, emit) async {
      try {
        emit(UserSubscribeState(followers: state.followers - 1));
        FollowRepository().unFollow(UserSubscribeState.userId);
      } catch (_) {}
    });
  }
}
