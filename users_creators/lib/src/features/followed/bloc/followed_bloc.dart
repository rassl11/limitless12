import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/core/repositories/follow_repository.dart';
import 'package:users_creators/src/features/followed/bloc/followed_event.dart';
import 'package:users_creators/src/features/followed/bloc/followed_state.dart';
import 'package:users_creators/src/features/followed/domain/followed.dart';

class FollowedBloc extends Bloc<FollowedEvent, FollowedState> {
  FollowedBloc() : super(LoadingAllFollowedState()) {
    var followedRepository = FollowRepository();

    on<GetFollowedEvent>((event, emit) async {
      emit(LoadingAllFollowedState());

      final List<AllFollowed> loadedFollowers = await followedRepository.getAllFollowed();
      emit((LoadedAllFollowedState(followed: loadedFollowers)));
    });
  }
}
