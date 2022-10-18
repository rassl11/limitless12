abstract class CurrentCreatorEvent {}

class SetCurrentCreatorEvent extends CurrentCreatorEvent {
  final String? currentCreatorId;

  SetCurrentCreatorEvent(this.currentCreatorId);
}

class SetLastFollowedAsCurrentCreatorEvent extends CurrentCreatorEvent {}

class GetCurrentCreatorEvent extends CurrentCreatorEvent {}

class FetchCurrentCreatorEvent extends CurrentCreatorEvent {}
