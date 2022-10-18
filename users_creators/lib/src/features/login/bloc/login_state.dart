part of 'login_bloc.dart';


@freezed
class LoginState with _$LoginState{
  const factory LoginState.initial({required String email, required bool hasErrors}) = Initial;
  const factory LoginState.signedIn() = SignedIn;
  const factory LoginState.loading() = Loading;
}