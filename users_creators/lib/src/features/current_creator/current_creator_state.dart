import 'package:users_creators/src/features/creator/entity/domain/creator_data.dart';

abstract class CurrentCreatorState {}

class HaveCurrentCreatorState extends CurrentCreatorState {
  final CreatorProfile creatorProfile;

  HaveCurrentCreatorState({required this.creatorProfile});
}

class DoNotHaveCurrentCreatorState extends CurrentCreatorState {}
