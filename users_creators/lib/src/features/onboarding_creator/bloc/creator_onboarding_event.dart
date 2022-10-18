part of 'creator_onboarding_bloc.dart';

@freezed
 class CreatorOnboardingEvent with _$CreatorOnboardingEvent{
  const factory CreatorOnboardingEvent.addCreatorInfo({required Creator creator, required bool canGoNext}) = _AddCreatorInfo;
  const factory CreatorOnboardingEvent.changePage({required int pageNumber, required Creator creator, required bool canGoNext}) = _ChangePage;
  const factory CreatorOnboardingEvent.uploadUserPhoto({required File photo}) = _UploadUserPhoto;
  const factory CreatorOnboardingEvent.uploadCoverImage({required File photo}) = _UploadCoverImage;
  const factory CreatorOnboardingEvent.becameCreator({required Creator creator}) = _BecameCreator;
  const factory CreatorOnboardingEvent.getAllTags() = _GetAllTags;
  const factory CreatorOnboardingEvent.setTags({required List<String> tags}) = _SetTags;
  const factory CreatorOnboardingEvent.addTags({required List<String> tags}) = _AddTags;
}