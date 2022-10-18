import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users_creators/src/features/discover/bloc/search_result/search_result_event.dart';
import 'package:users_creators/src/features/discover/bloc/search_result/search_result_state.dart';
import 'package:users_creators/src/features/discover/domain/result_search.dart';
import 'package:users_creators/src/features/discover/repo/discover_repo.dart';

class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  final DiscoverRepo loadedInfo;

  SearchResultBloc({
    required this.loadedInfo,
  }) : super(EmptyResultState()) {
    on<FindResultHashTagEvent>((event, emit) async {
      emit(LoadingResultState());
      try {
        final loadedHashTag =
            await DiscoverRepo().searchByTag(SearchResultState.name);
        if (loadedHashTag.isEmpty) {
          emit(EmptyResultState());
        } else {
          emit(FoundResultNameState(
            list: loadedHashTag,
          ));
        }
      } catch (_) {
        emit(ErrorResultState());
      }
    });
    on<FindResultNameEvent>((event, emit) async {
      emit(LoadingResultState());
      try {
        Future<List<ResultSearch>> getName() =>
            loadedInfo.searchByName(SearchResultState.name);
        final loadedTag = await getName();
        if (loadedTag.isEmpty) {
          emit(EmptyResultState());
        } else {
          emit(FoundResultNameState(
            list: loadedTag,
          ));
        }
      } catch (_) {
        emit(ErrorResultState());
      }
    });
  }
}
