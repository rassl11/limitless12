import 'package:users_creators/src/features/discover/domain/tag.dart';

class DiscoverCategory {
  String category;
  List<Tag> tags;

  DiscoverCategory({required this.category, required this.tags});

}

final List<DiscoverCategory> categories = [
  DiscoverCategory(category: 'Popular search', tags: [
    Tag(tag: 'BuildMuscle', isSelected: false),
    Tag(tag: 'BuildMuscle BuildMuscle BuildMuscle', isSelected: false),
    Tag(tag: 'Build', isSelected: false),
    Tag(tag: 'BuildMuscle', isSelected: false),
    Tag(tag: 'BuildMuscle', isSelected: false),
    Tag(tag: 'BuildMuscle BuildMuscle', isSelected: false),
    Tag(tag: 'BuildMuscle', isSelected: false),
    Tag(tag: 'BuildMuscle', isSelected: false),
  ]),
  DiscoverCategory(category: 'All tags', tags: [
    Tag(tag: 'BuildMuscle', isSelected: false),
    Tag(tag: 'BuildMuscle BuildMuscle', isSelected: false),
    Tag(tag: 'Build', isSelected: false),
    Tag(tag: 'BuildMuscle', isSelected: false),
    Tag(tag: 'BuildMuscle', isSelected: false),
    Tag(tag: 'BuildMuscle BuildMuscle', isSelected: false),
    Tag(tag: 'BuildMuscle', isSelected: false),
    Tag(tag: 'BuildMuscle', isSelected: false),
  ]),
];