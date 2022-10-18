import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users_creators/src/features/discover/domain/discover_creator.dart';
import 'package:users_creators/src/features/discover/domain/popular_tag.dart';
import 'package:users_creators/src/features/discover/repo/discover_repo.dart';
import 'package:users_creators/src/features/onboarding_creator/repo/creating_onboarding_repo.dart';

import '../../onboarding_creator/domain/tag.dart';

part 'discover_bloc.freezed.dart';
part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final discoverRepo = DiscoverRepo();
  DiscoverBloc() : super(const DiscoverState.loading()) {
    on((event, emit) async {
      if (event is _Initial) {
        emit(const DiscoverState.loading());
        List<DiscoverCreator> creators =
            await discoverRepo.getMostPopularPersons();
        List<PopularTag> tags = await discoverRepo.get4MostPopularTag();
        List<Tag> tag = await CreatorOnboardingRepo().getAllTags();
        List<DiscoverCreator> newCreators =
            await DiscoverRepo().getNewCreators();
        emit(DiscoverState.initial(
            creators: creators,
            tags: tags,
            tag: tag,
            newCreators: newCreators));
      }
    });
  }
}
