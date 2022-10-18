part of 'profile_bloc.dart';


@freezed
class ProfileState with _$ProfileState{
  const factory ProfileState.initial({required bool isCreator,  required Profile profile}) = Initial;
  const factory ProfileState.loading() = Loading;
}