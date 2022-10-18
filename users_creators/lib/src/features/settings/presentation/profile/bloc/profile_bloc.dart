import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users_creators/src/core/constants/common.dart';
import 'package:users_creators/src/features/onboarding_creator/repo/creating_onboarding_repo.dart';
import 'package:users_creators/src/features/settings/presentation/profile/domain/edited_user.dart';
import 'package:users_creators/src/features/settings/presentation/profile/repo/profile_repo.dart';

import '../../../../login/repo/login_repo.dart';
import '../domain/profile.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final repo = ProfileRepo();
  ProfileBloc()
      : super(ProfileState.initial(
            isCreator: LoginRepo().getAuthData()!.role == UserRole.creator,
            profile: ProfileRepo().getProfileData()!)) {
    on((event, emit) async {
      if (event is _ReloadRole) {
        emit(Initial(
            isCreator: LoginRepo().getAuthData()!.role == UserRole.creator,
            profile: repo.getProfileData()!));
      }
      if (event is _EditUser) {
        emit(const ProfileState.loading());
        bool edited = await repo.editUser(event.editedUser);
        if (edited) {
          log('Edited user: ${event.editedUser.toJson().toString()}');
        }
        emit(ProfileState.initial(
            isCreator: LoginRepo().getAuthData()!.role == UserRole.creator,
            profile: repo.getProfileData()!));
      }
      if (event is _GetProfile) {
        emit(const ProfileState.loading());
        Profile profile = await repo.getProfile();
        emit(ProfileState.initial(
            profile: profile,
            isCreator: LoginRepo().getAuthData()!.role == UserRole.creator));
      }
      if (event is _UploadUserPhoto) {
        emit(const ProfileState.loading());
        await CreatorOnboardingRepo().uploadUserPhoto(event.photo);
        emit(ProfileState.initial(
            profile: repo.getProfileData()!,
            isCreator: LoginRepo().getAuthData()!.role == UserRole.creator));
      }
    });
  }
}
