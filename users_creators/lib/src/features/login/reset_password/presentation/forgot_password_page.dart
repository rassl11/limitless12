import 'package:auto_route/auto_route.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/login/bloc/login_bloc.dart';
import 'package:users_creators/src/features/login/presentation/ui/widgets/login_text_field.dart';
import 'package:users_creators/src/features/login/reset_password/presentation/widgets/reset_password_page_view.dart';

class ForgotPasswordPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  ForgotPasswordPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.map(initial: (value) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          body: Form(
            key: _formKey,
            child: ResetPasswordPageView(
              button: 'Send verification code',
              subTitle: 'Enter your email, we will send a verification code to email',
              content: LoginTextField(
                suffix: null,
                color: ColorsLimitless.greyTextField,
                controller: emailController,
                label: 'Email',
                validator: (String? value) {
                  if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailController.text)) {
                    return "Email is not valid";
                  }
                  return null;
                },
              ),
              title: 'Reset Password',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<LoginBloc>(context).add(LoginEvent.resetPassword(email: emailController.text));
                  context.router.navigateNamed('/verify-code-page');
                }
              },
            ),
          ),
        );
      }, loading: (value) {
        return const AppLoadingWidget();
      }, signedIn: (v) {
        return const AppLoadingWidget();
      });
    });
  }
}
