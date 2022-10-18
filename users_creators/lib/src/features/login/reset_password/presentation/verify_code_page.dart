import 'package:auto_route/auto_route.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:users_creators/src/features/login/bloc/login_bloc.dart';
import 'package:users_creators/src/features/login/reset_password/presentation/widgets/reset_password_page_view.dart';

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({Key? key}) : super(key: key);

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  TextEditingController codeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    final login = LoginBloc((v) {
      context.router.navigateNamed('/new-password-page');
    }, (e) {
      setState(() {
        hasError = true;
      });
    });
    return BlocBuilder<LoginBloc, LoginState>(
        bloc: login,
        builder: (context, state) {
          return state.map(
            loading: (v) => const AppLoadingWidget(),
            signedIn: (v) => const AppLoadingWidget(),
            initial: (value) {
              return Scaffold(
                key: _scaffoldKey,
                backgroundColor: Colors.white,
                body: Form(
                  key: _formKey,
                  child: ResetPasswordPageView(
                      button: 'Continue',
                      subTitle:
                          'Please enter the code we just sent to your e-mail',
                      content: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: PinCodeTextField(
                              autoDisposeControllers: false,
                              controller: codeController,
                              appContext: context,
                              keyboardType: TextInputType.number,
                              showCursor: false,
                              validator: (String? value) {
                                if ((value?.length != 4 && value != null)) {
                                  return "The code is not correct";
                                }
                                return null;
                              },
                              length: 4,
                              enableActiveFill: true,
                              onChanged: (String value) {},
                              pinTheme: PinTheme(
                                  borderRadius: BorderRadius.circular(6),
                                  borderWidth: 1,
                                  inactiveColor: ColorsLimitless.greyTextField,
                                  inactiveFillColor:
                                      ColorsLimitless.greyTextField,
                                  activeFillColor:
                                      ColorsLimitless.greyTextField,
                                  activeColor: ColorsLimitless.greyTextField,
                                  selectedFillColor:
                                      ColorsLimitless.greyTextField,
                                  errorBorderColor: ColorsLimitless.brandColor,
                                  selectedColor: ColorsLimitless.greyTextField,
                                  fieldHeight: 56.h,
                                  fieldWidth: 56.w,
                                  shape: PinCodeFieldShape.box),
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          if (hasError)
                            const Text(
                              'The code is not correct',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  letterSpacing: 0.8,
                                  color: ColorsLimitless.brandColor,
                                  fontFamily: 'SF Pro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )
                        ],
                      ),
                      title: 'Verify Code',
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          login.add(LoginEvent.verify(
                              code: codeController.text, email: value.email));
                        }
                      }),
                ),
              );
            },
          );
        });
  }
}
