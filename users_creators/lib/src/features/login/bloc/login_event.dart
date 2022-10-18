part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.login({required UserLogin userLogin}) = _Login;
  const factory LoginEvent.signup({required UserSignUp userSignUp}) = _SignUp;
  const factory LoginEvent.resetPassword({required String email}) =
      _ResetPassword;
  const factory LoginEvent.verify(
      {required String email, required String code}) = _Verify;
  const factory LoginEvent.setNewPassword(
      {required String email,
      required String password,
      required String confirmPassword}) = _SetNewPassword;
}
