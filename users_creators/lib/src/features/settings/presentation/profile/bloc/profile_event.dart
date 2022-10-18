part of 'profile_bloc.dart';

@freezed
 class ProfileEvent with _$ProfileEvent{
  const factory ProfileEvent.reloadRole() = _ReloadRole;
  const factory ProfileEvent.getProfile() = _GetProfile;
  const factory ProfileEvent.editUser({required EditedUser editedUser}) = _EditUser;
  const factory ProfileEvent.uploadUserPhoto({required File photo}) = _UploadUserPhoto;
}