// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:components/buttons/app_buttons.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/core/config/router.dart';
import 'package:users_creators/src/core/constants/validation.dart';
import 'package:users_creators/src/features/bottom/bottom_bar_page.dart';
import 'package:users_creators/src/features/login/bloc/login_bloc.dart';
import 'package:users_creators/src/features/login/domain/user_login.dart'
    as user;

import '../widgets/login_text_field.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginBloc((value) {
      context.router.navigateNamed('/bottom-bar-page');
    }, (e) {
      ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
          const SnackBar(
              content:
                  Text("Can't authorize. Please check email or password")));

      // _scaffoldKey.currentState!.showSnackBar(const SnackBar(content: Text("Can't authorize. Please check email or password")));
    });
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: BlocBuilder<LoginBloc, LoginState>(
                bloc: loginBloc,
                builder: (context, state) {
                  return state.map(
                    initial: (Initial value) {
                      return SafeArea(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 23.r, vertical: 10.r),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                const Expanded(child: SizedBox()),
                                SvgPicture.asset(
                                    'assets/icons/top_panel/logo.svg',
                                    height: 22.r),
                                const Expanded(
                                  child: SizedBox(),
                                )
                              ]),
                              const Expanded(child: SizedBox()),
                              Text(
                                'LOGIN'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'SF Pro',
                                    fontSize: 26.sp,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 37.h,
                              ),
                              LoginTextField(
                                  suffix: null,
                                  color: ColorsLimitless.greyTextField,
                                  controller: emailController,
                                  label: 'Email',
                                  validator: (String? value) {
                                    if (!RegExp(emailValidation)
                                        .hasMatch(emailController.text)) {
                                      return "Email is not valid";
                                    }
                                    return null;
                                  }),
                              SizedBox(
                                height: 14.h,
                              ),
                              LoginTextField(
                                  obscureText: _passwordVisible,
                                  suffix: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/login/hide.svg',
                                      height: 16.r,
                                    ),
                                  ),
                                  color: ColorsLimitless.greyTextField,
                                  controller: passwordController,
                                  label: 'Password',
                                  validator: (value) => value!.isEmpty
                                      ? 'Password cannot be blank'
                                      : null),
                              SizedBox(
                                height: 22.h,
                              ),
                              AppButtons().redButton(context, 'Login', () {
                                if (_formKey.currentState!.validate()) {
                                  loginBloc.add(LoginEvent.login(
                                      userLogin: user.UserLogin(
                                          password: passwordController.text,
                                          email: emailController.text)));
                                }
                              }),
                              SizedBox(
                                height: 14.h,
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    context.router
                                        .navigateNamed('/forgot-password-page');
                                  },
                                  child: Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                        fontFamily: 'SF Pro',
                                        fontSize: 12.sp,
                                        letterSpacing: 0.5,
                                        color: ColorsLimitless.brandColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.r,
                              ),
                              const Expanded(
                                child: SizedBox(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don’t have an account? ',
                                    style: TextStyle(
                                        fontFamily: 'SF Pro',
                                        letterSpacing: 0.5,
                                        fontSize: 12.sp,
                                        color: ColorsLimitless.greyMedium,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  GestureDetector(
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: ColorsLimitless.brandColor,
                                          fontFamily: 'SF Pro',
                                          fontSize: 12.sp,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    onTap: () {
                                      context.router
                                          .navigateNamed('/user-sign-up');
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ));
                    },
                    loading: (Loading value) {
                      return const Center(
                        child: CircularProgressIndicator(
                            color: ColorsLimitless.brandColor),
                      );
                    },
                    signedIn: (SignedIn value) {
                      return const Center(
                        child: CircularProgressIndicator(
                            color: ColorsLimitless.brandColor),
                      );
                    },
                  );
                }),
          ),
        ),
      ),
    );
  }
}
