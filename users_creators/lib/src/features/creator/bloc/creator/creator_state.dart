import 'package:users_creators/src/features/creator/entity/domain/creator_data.dart';
import 'package:users_creators/src/features/creator/entity/domain/creator_tags.dart';

abstract class CreatorProfileState {}

abstract class LoadedCreatorProfileState extends CreatorProfileState {
  final CreatorProfile data;
  final List<CreatorTags>? tags;

  LoadedCreatorProfileState({required this.data, required this.tags});
}

class LoadingCreatorProfileState extends CreatorProfileState {}

class LoadedOtherCreatorProfileState extends LoadedCreatorProfileState {
  LoadedOtherCreatorProfileState({required super.data, required super.tags});
}

class LoadedCurrentCreatorProfileState extends LoadedCreatorProfileState {
  LoadedCurrentCreatorProfileState({required super.data, required super.tags});
}

class LoadedMyCreatorProfileState extends LoadedCreatorProfileState {
  LoadedMyCreatorProfileState({required super.data, required super.tags});
}

class EmptyProfileState extends CreatorProfileState {}

class ErrorCreatorProfile extends CreatorProfileState {}
