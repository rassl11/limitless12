import 'package:auto_route/auto_route.dart';
import 'package:components/buttons/app_buttons.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/settings/presentation/profile/bloc/edit_password_block.dart';
import 'package:users_creators/src/features/settings/presentation/profile/domain/edit_password.dart';
import 'package:users_creators/src/features/settings/presentation/profile/presentation/widgets/edit_profile_text_field.dart';

import '../../../../../core/constants/validation.dart';

class EditPasswordPage extends StatefulWidget {
  const EditPasswordPage({Key? key}) : super(key: key);

  @override
  State<EditPasswordPage> createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _currentVisible = true;
  bool _newVisible = true;
  bool _confirmVisible = true;

  @override
  Widget build(BuildContext context) {
    isPasswordValid(value) {
      if (value == null ||
          !RegExp(passwordValidation)
              .hasMatch(value)) {
        return false;
      } else {
        return true;
      }
    }

    validatePassword(value) {
      if (!isPasswordValid(value)) {
        return "Value is not valid";
      }
      return null;
    }

    return Scaffold(
        body: BlocListener<EditPasswordBloc, EditPasswordState>(
            listener: (context, state) {
      if (state == const EditPasswordState.error()) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Can't change password. Wrong current password")));
      }
      if (state == const EditPasswordState.success()) {
        context.navigateBack();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text("Password successfully changed")));
      }
    }, child: BlocBuilder<EditPasswordBloc, EditPasswordState>(
                builder: (context, state) {
      var root = SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(children: [
                    GestureDetector(
                      child: SvgPicture.asset(
                        'assets/icons/top_panel/left_arrow.svg',
                        color: ColorsLimitless.greyDark,
                      ),
                      onTap: () {
                        context.router.navigateBack();
                      },
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      'Change password',
                      style: TextStyle(
                          color: ColorsLimitless.greyDark,
                          fontFamily: 'SF Pro',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 13.r,
                    ),
                    const Expanded(child: SizedBox())
                  ]),
                  SizedBox(
                    height: 35.r,
                  ),
                  EditProfileTextField(
                      hintText: '',
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            _currentVisible = !_currentVisible;
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/icons/login/hide.svg',
                          height: 16.r,
                        ),
                      ),
                      validate: (value) => validatePassword(value),
                      title: 'Current password',
                      obscureText: _currentVisible,
                      textEditingController: currentPasswordController,
                      onChanged: (value) {}),
                  EditProfileTextField(
                      hintText: '',
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            _newVisible = !_newVisible;
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/icons/login/hide.svg',
                          height: 16.r,
                        ),
                      ),
                      validate: (value) => validatePassword(value),
                      title: 'New password',
                      obscureText: _newVisible,
                      textEditingController: newPasswordController,
                      onChanged: (value) {}),
                  EditProfileTextField(
                      hintText: '',
                      suffix: InkWell(
                        onTap: () {
                          setState(() {
                            _confirmVisible = !_confirmVisible;
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/icons/login/hide.svg',
                          height: 16.r,
                        ),
                      ),
                      validate: (value) {
                        if (!isPasswordValid(newPasswordController.text) ||
                            !isPasswordValid(confirmPasswordController.text) ||
                            newPasswordController.text !=
                                confirmPasswordController.text) {
                          return "Confirm password does not match new password";
                        }
                        return null;
                      },
                      title: 'Confirm new password ',
                      obscureText: _confirmVisible,
                      textEditingController: confirmPasswordController,
                      onChanged: (value) {}),
                  const Expanded(child: SizedBox()),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: AppButtons().redButton(context, 'Save', () {
                        var isValid = _formKey.currentState!.validate();
                        if (isValid) {
                          var editPassword = EditPassword(
                              password: currentPasswordController.text,
                              newPassword: newPasswordController.text,
                              confirmPassword: confirmPasswordController.text);
                          BlocProvider.of<EditPasswordBloc>(context).add(
                              EditPasswordEvent.editPassword(
                                  editPassword: editPassword));
                        }
                      }))
                ],
              ),
            )),
      );

      return state.map(
          initial: (Initial value) => root,
          success: (Success value) => root,
          error: (Error value) => root,
          loading: (Loading value) => const AppLoadingWidget());
    })));
  }
}
