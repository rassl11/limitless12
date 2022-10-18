// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:components/buttons/app_buttons.dart';
import 'package:components/common_widgets/header/top_panel.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/core/config/router.dart';
import 'package:users_creators/src/core/constants/validation.dart';
import 'package:users_creators/src/features/login/bloc/login_bloc.dart';
import 'package:users_creators/src/features/login/domain/user_signup.dart'
    as user;

import '../widgets/login_text_field.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({Key? key}) : super(key: key);

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _passwordVisible = true;
  bool _confirmPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginBloc((value) {
      context.router.navigate(
        PersonalInfoPageRoute(username: userNameController.text),
      );
    }, (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Can't authorize. Please check email or password")));
    });
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
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
                                TopPanel(),
                                const Expanded(child: SizedBox()),
                                Text(
                                  'Sign Up'.toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 26.sp,
                                      letterSpacing: 0.5,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: 37.h,
                                ),
                                LoginTextField(
                                    suffix: null,
                                    color: ColorsLimitless.greyTextField,
                                    controller: userNameController,
                                    label: 'My.Limitlesspro.io/Username',
                                    textInputType: TextInputType.name,
                                    validator: (String? value) {
                                      if ((value != null && value.isEmpty) ||
                                          value!.contains(' ')) {
                                        return "Username must be not empty and without whitespaces";
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: 14.h,
                                ),
                                LoginTextField(
                                    suffix: null,
                                    color: ColorsLimitless.greyTextField,
                                    controller: emailController,
                                    label: 'Email',
                                    textInputType: TextInputType.emailAddress,
                                    validator: (String? value) {
                                      if (!RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
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
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    validator: (String? value) {
                                      if (!RegExp(passwordValidation)
                                          .hasMatch(passwordController.text)) {
                                        return "Password is not secure";
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: 14.h,
                                ),
                                LoginTextField(
                                    obscureText: _confirmPasswordVisible,
                                    suffix: InkWell(
                                      onTap: () {
                                        setState(() {
                                          _confirmPasswordVisible =
                                              !_confirmPasswordVisible;
                                        });
                                      },
                                      child: SvgPicture.asset(
                                        'assets/icons/login/hide.svg',
                                        height: 16.r,
                                      ),
                                    ),
                                    color: ColorsLimitless.greyTextField,
                                    controller: confirmPasswordController,
                                    label: 'Confirm Password',
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    validator: (String? value) {
                                      if (passwordController.text !=
                                          confirmPasswordController.text) {
                                        return "Confirm password is not same as password";
                                      }
                                      return null;
                                    }),
                                SizedBox(
                                  height: 22.h,
                                ),
                                AppButtons().redButton(context, 'Sign Up',
                                    () async {
                                  if (_formKey.currentState!.validate()) {
                                    loginBloc.add(
                                      LoginEvent.signup(
                                        userSignUp: user.UserSignUp(
                                          email: emailController.text.trim(),
                                          username:
                                              userNameController.text.trim(),
                                          password: passwordController.text,
                                        ),
                                      ),
                                    );
                                  }
                                }),
                                SizedBox(
                                  height: 14.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Already have an account?',
                                      style: TextStyle(
                                          fontFamily: 'SF Pro',
                                          fontSize: 13.sp,
                                          color: ColorsLimitless.greyMedium,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 5.r,
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                            color: ColorsLimitless.brandColor,
                                            fontFamily: 'SF Pro',
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      onTap: () {
                                        context.router
                                            .navigateNamed('/user-login');
                                      },
                                    ),
                                  ],
                                ),
                                const Expanded(
                                  child: SizedBox(),
                                ),
                                Text.rich(
                                    TextSpan(
                                      text:
                                          'By continuing forwards, you agree to Limitless\'s  ',
                                      style: TextStyle(
                                          fontFamily: 'SF Pro',
                                          height: 1.6,
                                          letterSpacing: 0.5,
                                          fontSize: 12.sp,
                                          color: ColorsLimitless.greyMedium,
                                          fontWeight: FontWeight.w400),
                                      children: const [
                                        TextSpan(
                                            text: 'Privacy Policy',
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                            )),
                                        TextSpan(text: ' and'),
                                        TextSpan(
                                            text: ' Terms & Conditions',
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                            )),
                                      ],
                                    ),
                                    textAlign: TextAlign.center)
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    loading: (Loading value) {
                      return const AppLoadingWidget();
                    },
                    signedIn: (SignedIn value) {
                      return const AppLoadingWidget();
                    },
                  );
                }),
          ),
        ),
      ),
    );
  }
}
