part of 'creator_onboarding_bloc.dart';


@freezed
class CreatorOnboardingState with _$CreatorOnboardingState{
  const factory CreatorOnboardingState.idle({
    required bool canGoNext, 
    required bool isFirstPage, 
    required bool isLastPage,
    required int pagesLength,
    required int currentPage, 
    required bool canBeSkipped,
    required List<Tag> allTags,
    required List<String> userTags,
    required Creator creator,
    required bool isLoading
    }) = _Idle;
}