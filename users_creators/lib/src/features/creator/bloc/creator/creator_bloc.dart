import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_event.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_state.dart';
import 'package:users_creators/src/features/creator/entity/domain/creator_data.dart';
import 'package:users_creators/src/features/creator/entity/domain/creator_tags.dart';
import 'package:users_creators/src/features/creator/repo/creator_repo.dart';
import 'package:users_creators/src/features/login/repo/login_repo.dart';

class CreatorProfileBloc extends Bloc<CreatorProfileEvent, CreatorProfileState> {
  CreatorProfileBloc() : super(EmptyProfileState()) {
    var creatorRepository = CreatorRepository();
    on<CreatorProfileLoadEvent>((event, emit) async {
      emit(LoadingCreatorProfileState());
      try {
        final CreatorProfile profile = await creatorRepository.search(event.creatorId);
        final List<CreatorTags> tags = await creatorRepository.getCreatorTags(event.creatorId);
        if (LoginRepo().getAuthData()!.id != event.creatorId) {
          emit(LoadedOtherCreatorProfileState(
            tags: tags,
            data: profile,
          ));
        } else {
          emit(LoadedMyCreatorProfileState(
            tags: tags,
            data: profile,
          ));
        }
      } catch (_) {
        emit(ErrorCreatorProfile());
      }
    });
    on<CurrentCreatorProfileLoadEvent>((event, emit) async {
      emit(LoadingCreatorProfileState());
      try {
        final CreatorProfile profile = await creatorRepository.search(event.creatorId);
        final List<CreatorTags> tags = await creatorRepository.getCreatorTags(event.creatorId);
        if (LoginRepo().getAuthData()!.id != event.creatorId) {
          emit(LoadedCurrentCreatorProfileState(
            tags: tags,
            data: profile,
          ));
        } else {
          emit(LoadedMyCreatorProfileState(
            tags: tags,
            data: profile,
          ));
        }
      } catch (_) {
        emit(ErrorCreatorProfile());
      }
    });
  }
}
