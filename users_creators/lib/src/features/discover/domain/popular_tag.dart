import 'package:users_creators/src/features/discover/domain/discover_creator.dart';
import 'package:json_annotation/json_annotation.dart';
// ignore: depend_on_referenced_packages
import 'package:copy_with_extension/copy_with_extension.dart';
part 'popular_tag.g.dart';

@CopyWith()
@JsonSerializable()
class PopularTag{
  String? tagName;
  List<DiscoverCreator>? creators;
  
  PopularTag({this.tagName, this.creators});

  factory PopularTag.fromJson(Map<String, dynamic> json) =>
      _$PopularTagFromJson(json); 

  Map<String, dynamic> toJson() => _$PopularTagToJson(this);
}