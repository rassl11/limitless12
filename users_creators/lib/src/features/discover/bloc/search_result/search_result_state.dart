abstract class SearchResultState {
  static String name = '';
  static void changeName(tag) {
     name = tag;
  }
}

class FoundResultHashTagState extends SearchResultState {
  List? list;

  FoundResultHashTagState({
    required this.list,
  });
}

class FoundResultNameState extends SearchResultState {
  List? list;

  FoundResultNameState({
    required this.list,
  });
}

class EmptyResultState extends SearchResultState {}

class LoadingResultState extends SearchResultState {}

class ErrorResultState extends SearchResultState {}
