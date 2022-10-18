import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:users_creators/src/features/login/repo/login_repo.dart';
import 'package:users_creators/src/features/settings/presentation/settings/domain/settings.dart';
import 'package:users_creators/src/features/settings/presentation/settings/repo/settings_repo.dart';

part 'settings_bloc.freezed.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepo settingsRepo = SettingsRepo();
  final LoginRepo loginRepo = LoginRepo();
  final Function logout;

  SettingsBloc(this.logout) : super(SettingsState.initial(settings: Settings())) {
    on((event, emit) async {
      if (event is _LogOut) {
        emit(const SettingsState.loading());
        bool loggedOut = await loginRepo.logout();
        if (loggedOut) {
          logout();
        }
      }
      if (event is _EditSettings) {
        emit(const SettingsState.loading());
        bool edited = await settingsRepo.editSettings(event.settings);
        if (edited) {
          emit(SettingsState.initial(settings: settingsRepo.getSettingsData()!));
        }
      }
      if (event is _GetSettings) {
        emit(const SettingsState.loading());
        await settingsRepo.getSettings();
        emit(SettingsState.initial(settings: settingsRepo.getSettingsData()!));
      }
      if(event is _DeleteAccount){
        emit(const SettingsState.loading());
        bool deleted = await settingsRepo.deleteAccount();
        if (deleted) {
          bool loggedOut = await loginRepo.logout();
          logout();
        }
      }
    });
  }
}
