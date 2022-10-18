abstract class SubscribeEvent {}

class FollowEvent extends SubscribeEvent {}

class UnFollowEvent extends SubscribeEvent {}

class LoadingFollowersEvent extends SubscribeEvent {
  final String creatorId;

  LoadingFollowersEvent(this.creatorId);
}
