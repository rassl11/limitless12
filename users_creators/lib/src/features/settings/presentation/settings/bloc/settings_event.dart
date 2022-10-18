part of 'settings_bloc.dart';

@freezed
 class SettingsEvent with _$SettingsEvent{
  const factory SettingsEvent.logOut() = _LogOut;
  const factory SettingsEvent.editSettings({required Settings settings}) = _EditSettings;
  const factory SettingsEvent.getSettings() = _GetSettings;
  const factory SettingsEvent.deleteAccount() = _DeleteAccount;
}