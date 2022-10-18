abstract class CreatorProfileEvent {}

class CreatorProfileLoadEvent extends CreatorProfileEvent {
  final String creatorId;

  CreatorProfileLoadEvent(this.creatorId);
}

class CurrentCreatorProfileLoadEvent extends CreatorProfileEvent {
  final String creatorId;

  CurrentCreatorProfileLoadEvent(this.creatorId);
}
