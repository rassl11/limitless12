import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users_creators/src/features/onboarding_creator/domain/creator.dart';
import 'package:users_creators/src/features/onboarding_creator/repo/creating_onboarding_repo.dart';
import 'package:users_creators/src/features/settings/presentation/profile/domain/profile.dart';
import 'package:users_creators/src/features/settings/presentation/profile/repo/profile_repo.dart';

import '../domain/tag.dart';

part 'creator_onboarding_event.dart';
part 'creator_onboarding_state.dart';
part 'creator_onboarding_bloc.freezed.dart';

class CreatorOnboardingBloc
    extends Bloc<CreatorOnboardingEvent, CreatorOnboardingState> {
  final PageController pageController;
  final int pagesLength;
  final repo = CreatorOnboardingRepo();

  CreatorOnboardingBloc(
      {required this.pagesLength, required this.pageController})
      : super(CreatorOnboardingState.idle(
            canGoNext: false,
            creator: Creator(),
            currentPage: 0,
            isFirstPage: true,
            isLastPage: false,
            canBeSkipped: false,
            pagesLength: pagesLength,
            userTags: [],
            allTags: [],
            isLoading: false)) {
    on((event, emit) async {
      if (event is _AddCreatorInfo) {
        if (state is _Idle) {
          emit(state.copyWith(
              canGoNext: event.canGoNext, creator: event.creator));
        }
        log(state.creator.toJson().toString());
      }
      if (event is _ChangePage) {
        await pageController.animateToPage(event.pageNumber,
            duration: const Duration(milliseconds: 300), curve: Curves.ease);

        bool canGoNext() {
          return event.canGoNext;
        }

        if (state is _Idle) {
          emit(state.copyWith(
            canGoNext: canGoNext(),
            currentPage: event.pageNumber,
            isFirstPage: _isFirstPage(event.pageNumber),
            isLastPage: _isLastPage(event.pageNumber),
            canBeSkipped: false,
          ));
        }
      }
      if (event is _UploadUserPhoto) {
        emit(state.copyWith(isLoading: true));
        await repo.uploadUserPhoto(event.photo);
        emit(state.copyWith(isLoading: false));
      }
      if (event is _UploadCoverImage) {
        emit(state.copyWith(isLoading: true));
        await repo.uploadCoverPhoto(event.photo);
        emit(state.copyWith(isLoading: false));
      }
      if (event is _BecameCreator) {
        if (state is _Idle) {
          emit(state.copyWith(isLoading: true));
        }
        Profile user = ProfileRepo().getProfileData()!;
        await repo.becomeCreator(
          event.creator.copyWith(
            gender: user.gender,
            isMetric: true,
            userName: user.userName,
            email: user.email,
          ),
        );
        if (state is _Idle) {
          emit(state.copyWith(isLoading: false));
        }
      }
      if (event is _GetAllTags) {
        emit(state.copyWith(isLoading: true));
        final tags = await repo.getAllTags();
        emit(state.copyWith(allTags: tags, isLoading: false));
      }
      if (event is _SetTags) {
        if (state is _Idle) {
          emit(state.copyWith(isLoading: true));
        }
        bool added = await repo.addTags(event.tags);
        if (state is _Idle) {
          emit(state.copyWith(isLoading: false));
        }
        if (added) {
          log('${event.tags.toString()} was added');
        }
      }
      if (event is _AddTags) {
        emit(state.copyWith(userTags: event.tags));
      }
    });
  }

  bool _isFirstPage(int page) {
    return page == 0;
  }

  bool _isLastPage(int page) {
    return page == pagesLength;
  }
}
