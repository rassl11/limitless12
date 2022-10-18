import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/dropdown/user_drop_down_event.dart';
import 'package:users_creators/src/features/creator/bloc/dropdown/user_drop_down_state.dart';



class UserDropDownBloc extends Bloc<UserDropDownEvent, UserDropDownState> {
  UserDropDownBloc() : super((ClosedPopup())) {
    on<UserOpenAboutEvent>((event, emit) async {
      emit(ShowAboutState());
      try {} catch (_) {}
    });
    on<UserCloseAboutEvent>((event, emit) async {
      emit(ClosedPopup());
        try {} catch (_) {}
    });

    on<UserOpenSocialMediaEvent>((event, emit) async {
      emit(ShowSocialMediaState());
        try {} catch (_) {}
    });

    on<UserCloseSocialMediaEvent>((event, emit) async {
      emit(ClosedPopup());
        try {} catch (_) {}
    });
  
  }
}
