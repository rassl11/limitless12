part of 'discover_bloc.dart';

@freezed
 class DiscoverEvent with _$DiscoverEvent{
  const factory DiscoverEvent.initial() = _Initial;
  const factory DiscoverEvent.search({required String value}) = _Search;
  const factory DiscoverEvent.getByTag({required String value}) = _GetByTag;
}