import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users_creators/src/features/settings/presentation/profile/domain/edit_password.dart';

import '../domain/edit_password.dart';
import '../repo/profile_repo.dart';

part 'edit_password_block.freezed.dart';
part 'edit_password_event.dart';
part 'edit_password_state.dart';

class EditPasswordBloc extends Bloc<EditPasswordEvent, EditPasswordState> {
  final repo = ProfileRepo();

  EditPasswordBloc() : super(const EditPasswordState.initial()) {
    on((event, emit) async {
      if (event is _onEditPassword) {
        emit(const EditPasswordState.loading());
        bool edited = await repo.changePassword(event.editPassword);
        if (edited) {
          log('Edited user: ${event.editPassword.toJson().toString()}');
          emit(const EditPasswordState.success());
        } else {
          emit(const EditPasswordState.error());
        }
      }
    });
  }
}
