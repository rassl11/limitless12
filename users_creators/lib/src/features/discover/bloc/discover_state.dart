part of 'discover_bloc.dart';

@freezed
class DiscoverState with _$DiscoverState {
  const factory DiscoverState.initial(
      {required List<DiscoverCreator> creators,
      required List<PopularTag> tags,
      required List<Tag> tag,
      required List<DiscoverCreator> newCreators}) = Initial;
  const factory DiscoverState.loading() = Loading;
}
