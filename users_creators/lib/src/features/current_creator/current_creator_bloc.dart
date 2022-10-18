import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/core/constants/common.dart';
import 'package:users_creators/src/core/repositories/follow_repository.dart';
import 'package:users_creators/src/features/creator/entity/domain/creator_data.dart';
import 'package:users_creators/src/features/creator/repo/creator_repo.dart';
import 'package:users_creators/src/features/current_creator/current_creator_event.dart';
import 'package:users_creators/src/features/current_creator/current_creator_repo.dart';
import 'package:users_creators/src/features/current_creator/current_creator_state.dart';
import 'package:users_creators/src/features/followed/domain/followed.dart';
import 'package:users_creators/src/features/login/repo/login_repo.dart';

class CurrentCreatorBloc extends Bloc<CurrentCreatorEvent, CurrentCreatorState> {
  CurrentCreatorBloc() : super(DoNotHaveCurrentCreatorState()) {
    var creatorRepository = CreatorRepository();
    var currentCreatorRepository = CurrentCreatorRepository();
    var followRepository = FollowRepository();
    var loginRepository = LoginRepo();

    on<SetCurrentCreatorEvent>((event, emit) async {
      final CreatorProfile creatorProfile = await creatorRepository.search(event.currentCreatorId!);
      await currentCreatorRepository.setCurrentCreator(creatorProfile);
      emit(HaveCurrentCreatorState(creatorProfile: creatorProfile));
    });

    on<GetCurrentCreatorEvent>((event, emit) async {
      CreatorProfile? creatorProfile = currentCreatorRepository.getCurrentCreator();
      if (creatorProfile != null) {
        emit(HaveCurrentCreatorState(creatorProfile: creatorProfile));
      } else {
        emit(DoNotHaveCurrentCreatorState());
      }
    });

    on<FetchCurrentCreatorEvent>((event, emit) async {
      if (loginRepository.getAuthData() == null) {
        return;
      }
      if (loginRepository.getAuthData()!.role == UserRole.creator) {
        final CreatorProfile creatorProfile = await creatorRepository.search(loginRepository.getAuthData()!.id);
        await currentCreatorRepository.setCurrentCreator(creatorProfile);
        emit(HaveCurrentCreatorState(creatorProfile: creatorProfile));
      }
      if (loginRepository.getAuthData()!.role != UserRole.user) {
        CreatorProfile? creatorProfile = currentCreatorRepository.getCurrentCreator();
        if (creatorProfile != null) {
          emit(HaveCurrentCreatorState(creatorProfile: creatorProfile));
        } else {
          List<AllFollowed?> followed = await followRepository.getAllFollowed();

          var lastFollowed = followed.last;
          if (followed.isNotEmpty && followed.last != null) {
            final CreatorProfile creatorProfile = await creatorRepository.search(lastFollowed!.id!);
            await currentCreatorRepository.setCurrentCreator(creatorProfile);
            emit(HaveCurrentCreatorState(creatorProfile: creatorProfile));
          } else {
            emit(DoNotHaveCurrentCreatorState());
          }
        }
      }
    });

    on<SetLastFollowedAsCurrentCreatorEvent>((event, emit) async {
      List<AllFollowed?> followed = await followRepository.getAllFollowed();
      var lastFollowed = followed.last;
      if (lastFollowed != null) {
        final CreatorProfile creatorProfile = await creatorRepository.search(lastFollowed.id!);
        await currentCreatorRepository.setCurrentCreator(creatorProfile);
        emit(HaveCurrentCreatorState(creatorProfile: creatorProfile));
      } else {
        emit(DoNotHaveCurrentCreatorState());
      }
    });
  }
}
