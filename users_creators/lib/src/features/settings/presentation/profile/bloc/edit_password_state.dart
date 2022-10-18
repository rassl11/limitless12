part of 'edit_password_block.dart';

@freezed
class EditPasswordState with _$EditPasswordState {
  const factory EditPasswordState.initial() = Initial;
  const factory EditPasswordState.loading() = Loading;
  const factory EditPasswordState.error() = Error;
  const factory EditPasswordState.success() = Success;
}
