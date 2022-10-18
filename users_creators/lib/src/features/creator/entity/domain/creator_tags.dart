import 'package:json_annotation/json_annotation.dart';
part 'creator_tags.g.dart';

@JsonSerializable()
class CreatorTags {
  String tagName;
  CreatorTags({required this.tagName});

  factory CreatorTags.fromJson(Map<String, dynamic> json) =>
      _$CreatorTagsFromJson(json);
}
