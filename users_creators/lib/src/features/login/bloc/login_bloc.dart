import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:users_creators/src/features/login/domain/auth_model.dart';
import 'package:users_creators/src/features/login/domain/user_login.dart';
import 'package:users_creators/src/features/login/domain/user_signup.dart';
import 'package:users_creators/src/features/login/repo/login_repo.dart';
import 'package:users_creators/src/features/settings/presentation/profile/domain/profile.dart';
import 'package:users_creators/src/features/settings/presentation/profile/repo/profile_repo.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

@singleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  void Function(String)? loggedIn;
  void Function(Object)? showError;
  final LoginRepo loginRepo = LoginRepo();

  LoginBloc(this.loggedIn, this.showError)
      : super(const LoginState.initial(email: '', hasErrors: false)) {
    on((event, emit) async {
      if (event is _Login) {
        try {
          emit(const LoginState.loading());
          AuthModel model = await loginRepo.login(event.userLogin);
          Profile? user = ProfileRepo().getProfileData();
          if (user != null) {
            loggedIn!(model.accessToken!);

            emit(const LoginState.loading());
          } else {
            emit(const LoginState.initial(email: '', hasErrors: false));
          }
        } catch (e) {
          showError!(e);
          emit(const LoginState.initial(email: '', hasErrors: false));
        }
      }
      if (event is _SignUp) {
        try {
          emit(const LoginState.loading());
          await loginRepo.signup(event.userSignUp);
          emit(const LoginState.signedIn());

          AuthModel model = await loginRepo.login(
            UserLogin(
              email: event.userSignUp.email,
              password: event.userSignUp.password,
            ),
          );

          Profile? user = ProfileRepo().getProfileData();
          if (user != null) {
            loggedIn!(model.accessToken!);
            emit(const LoginState.loading());
          } else {
            emit(const LoginState.initial(email: '', hasErrors: false));
          }
        } catch (e) {
          showError!(e);
        }
      }
      if (event is _ResetPassword) {
        try {
          emit(const LoginState.loading());
          bool success = await loginRepo.resetPassword(event.email);
          if (success) {
            emit(LoginState.initial(email: event.email, hasErrors: false));
          } else {
            emit(LoginState.initial(email: event.email, hasErrors: true));
          }
        } catch (e) {
          showError!(e);
        }
      }
      if (event is _Verify) {
        try {
          emit(const LoginState.loading());
          bool success = await loginRepo.verifyCode(event.email, event.code);
          if (success) {
            emit(LoginState.initial(email: event.email, hasErrors: false));
            loggedIn!('');
          } else {
            emit(LoginState.initial(email: event.email, hasErrors: true));
            showError!('');
          }
        } catch (e) {
          emit(LoginState.initial(email: event.email, hasErrors: true));
        }
      }
      if (event is _SetNewPassword) {
        try {
          emit(const LoginState.loading());
          bool success = await loginRepo.changePassword(
              event.email, event.password, event.confirmPassword);
          if (success) {
            emit(LoginState.initial(email: event.email, hasErrors: false));
          } else {
            emit(LoginState.initial(email: event.email, hasErrors: true));
          }
        } catch (e) {
          emit(LoginState.initial(email: event.email, hasErrors: true));
        }
      }
    });
  }
}
