import 'package:auto_route/auto_route.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/core/constants/validation.dart';
import 'package:users_creators/src/features/login/bloc/login_bloc.dart';
import 'package:users_creators/src/features/login/presentation/ui/widgets/login_text_field.dart';
import 'package:users_creators/src/features/login/reset_password/presentation/widgets/reset_password_page_view.dart';

class NewPasswordPage extends StatefulWidget {
  NewPasswordPage({Key? key}) : super(key: key);

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {

 
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _passwordVisible = true;
  bool _confirmationVisible = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.map(
          initial: (value) {
            return Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: true,
              key: _scaffoldKey,
              body: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
                    child: Form(
                      key: _formKey,
                      child: ResetPasswordPageView(
                        button: 'Confirm New Password',
                        subTitle:
                            'Create a new password that is safe and easy to remember',
                        content: Column(
                          children: [
                            LoginTextField(
                                obscureText: _passwordVisible,
                                suffix: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/login/show_off.svg',
                                    height: 16.r,
                                  ),
                                ),
                                color: ColorsLimitless.greyTextField,
                                controller: passwordController,
                                label: 'New Password',
                                validator: (String? value) {
                                  if (!RegExp(
                                          passwordValidation)
                                      .hasMatch(passwordController.text)) {
                                    return "Password is not secure";
                                  }
                                  return null;
                                }),
                            SizedBox(
                              height: 16.h,
                            ),
                            LoginTextField(
                              obscureText: _confirmationVisible,
                              suffix: InkWell(
                                onTap: () {
                                  setState(() {
                                    _confirmationVisible =
                                        !_confirmationVisible;
                                  });
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/login/show_off.svg',
                                  height: 16.r,
                                ),
                              ),
                              color: ColorsLimitless.greyTextField,
                              controller: confirmPasswordController,
                              label: 'Confirm New Password',
                              validator: (String? value) {
                                if (passwordController.text !=
                                    confirmPasswordController.text) {
                                  return "Confirm password is not same as password";
                                }
                                return null;
                              },
                            )
                          ],
                        ),
                        title: 'New Password',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<LoginBloc>(context).add(
                                LoginEvent.setNewPassword(
                                    email: value.email,
                                    password: passwordController.text,
                                    confirmPassword:
                                        confirmPasswordController.text));
                            context.router
                                .navigateNamed('/password-changed-page');
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          loading: (v) => const AppLoadingWidget(),
          signedIn: (v) => const AppLoadingWidget());
    });
  }
}
