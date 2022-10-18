part of 'edit_password_block.dart';

@freezed
class EditPasswordEvent with _$EditPasswordEvent {
  const factory EditPasswordEvent.editPassword(
      {required EditPassword editPassword}) = _onEditPassword;
}
