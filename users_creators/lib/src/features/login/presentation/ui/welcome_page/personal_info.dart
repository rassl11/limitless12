import 'package:auto_route/auto_route.dart';
import 'package:components/buttons/app_buttons.dart';
import 'package:components/common_widgets/header/top_panel.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:users_creators/src/core/config/router.dart';
import 'package:users_creators/src/core/widgets/dialogs/date_picker.dart';
import 'package:users_creators/src/features/settings/presentation/profile/bloc/profile_bloc.dart';
import 'package:users_creators/src/features/settings/presentation/profile/domain/edited_user.dart';

import '../widgets/login_text_field.dart';

class PersonalInfoPage extends StatefulWidget {
  final String username;

  const PersonalInfoPage({super.key, required this.username});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  int pageIndex1SelectedValue = 0;
  int pageIndex2SelectedValue = 0;

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    bool isNextBtnActive = false;
    if (currentPage == 0) {
      if (firstNameController.text.isNotEmpty &&
          lastNameController.text.isNotEmpty &&
          dateController.text.isNotEmpty) {
        isNextBtnActive = true;
      }
    } else {
      isNextBtnActive = true;
    }

    void unfocus() => FocusManager.instance.primaryFocus?.unfocus();

    return GestureDetector(
      onTap: unfocus,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  bottom: 32.h,
                  top: 10.h,
                ),
                child: Column(
                  children: [
                    TopPanel(
                      onTap: () {
                        if (currentPage == 0) {
                          context.router.navigateBack();
                        } else {
                          setState(() {
                            currentPage -= 1;
                          });
                        }
                      },
                    ),
                    SizedBox(height: 53.h),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (currentPage == 0)
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Welcome!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        letterSpacing: 0.7,
                                        fontFamily: "SF Pro",
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.italic,
                                        color: const Color(0xFF353945),
                                      ),
                                    ),
                                    Text(
                                      ' Fill out your details below.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "SF Pro",
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF777E91),
                                      ),
                                    ),
                                    SizedBox(height: 16.h),
                                    LoginTextField(
                                      suffix: null,
                                      color: ColorsLimitless.greyTextField,
                                      controller: firstNameController,
                                      label: 'First name',
                                      validator: null,
                                    ),
                                    SizedBox(height: 20.h),
                                    LoginTextField(
                                      suffix: null,
                                      color: ColorsLimitless.greyTextField,
                                      controller: lastNameController,
                                      label: 'Last name',
                                      validator: null,
                                    ),
                                    SizedBox(height: 20.h),
                                    _TextFieldDate(
                                        controller: dateController,
                                        onPickedDate: (date) {
                                          unfocus();
                                          setState(
                                            () => dateController.text = date,
                                          );
                                        }),
                                  ],
                                )
                              else if (currentPage == 1)
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Mesure your progress',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "SF Pro",
                                        letterSpacing: 0.7,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.italic,
                                        color: const Color(0xFF353945),
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      'We’ll default your training prescriptions to the unit of your choice',
                                      style: TextStyle(
                                        fontFamily: "SF Pro",
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF777E91),
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    _RadioBtnWidget(
                                      title: 'Imperial / US (lb)',
                                      isActive: pageIndex1SelectedValue == 0,
                                      onTap: () {
                                        setState(() {
                                          pageIndex1SelectedValue = 0;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 18.h),
                                    _RadioBtnWidget(
                                      title: 'Metric system (kg)',
                                      isActive: pageIndex1SelectedValue == 1,
                                      onTap: () {
                                        setState(() {
                                          pageIndex1SelectedValue = 1;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              else
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'What is you biological gender',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "SF Pro",
                                        letterSpacing: 0.7,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.italic,
                                        color: const Color(0xFF353945),
                                      ),
                                    ),
                                    SizedBox(height: 44.h),
                                    _RadioBtnWidget(
                                      title: 'Male',
                                      isActive: pageIndex2SelectedValue == 0,
                                      onTap: () {
                                        setState(() {
                                          pageIndex2SelectedValue = 0;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 18.h),
                                    _RadioBtnWidget(
                                      title: 'Female',
                                      isActive: pageIndex2SelectedValue == 1,
                                      onTap: () {
                                        setState(() {
                                          pageIndex2SelectedValue = 1;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 18.h),
                                    _RadioBtnWidget(
                                      title: 'I prefer not to say',
                                      isActive: pageIndex2SelectedValue == 2,
                                      onTap: () {
                                        setState(() {
                                          pageIndex2SelectedValue = 2;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    bottom: 24.h,
                  ),
                  child: AppButtons().redButton(
                    context,
                    'Next',
                    !isNextBtnActive
                        ? null
                        : () {
                            final profileBloc =
                                BlocProvider.of<ProfileBloc>(context);

                            if (currentPage < 2) {
                              if (currentPage == 0) {
                                profileBloc.add(
                                  ProfileEvent.editUser(
                                    editedUser: EditedUser(
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      dateOfBirth: dateController.text,
                                    ),
                                  ),
                                );
                              } else if (currentPage == 1) {
                                profileBloc.add(
                                  ProfileEvent.editUser(
                                    editedUser: EditedUser(
                                      isMetric: pageIndex1SelectedValue == 1,
                                    ),
                                  ),
                                );
                              }
                              setState(() => currentPage++);
                            } else {
                              profileBloc.add(
                                ProfileEvent.editUser(
                                  editedUser: EditedUser(
                                    gender: pageIndex2SelectedValue,
                                  ),
                                ),
                              );
                              context.router.navigate(
                                WelcomeUserPageRoute(username: widget.username),
                              );
                            }
                          },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextFieldDate extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onPickedDate;

  const _TextFieldDate({
    required this.controller,
    required this.onPickedDate,
  });

  void onDateTapped(DateTime date) {
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formattedDate = formatter.format(date);
    onPickedDate(formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Colors.transparent),
    );

    return SizedBox(
      height: 48.r,
      child: Stack(
        children: [
          TextFormField(
            controller: controller,
            cursorColor: ColorsLimitless.greyDark,
            style: TextStyle(
              fontFamily: "SF Pro",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF000000),
            ),
            readOnly: true,
            onTap: () =>
                showSessionDatePicker(context, (date) => onDateTapped(date)),
            decoration: InputDecoration(
              hintText: 'Date of Birth',
              hintStyle: TextStyle(
                fontFamily: 'SF Pro',
                letterSpacing: 0.5,
                fontSize: 14.sp,
                color: ColorsLimitless.greyMedium,
                fontWeight: FontWeight.w400,
              ),
              fillColor: ColorsLimitless.greyTextField,
              filled: true,
              focusedBorder: border,
              enabledBorder: border,
              border: border,
            ),
          ),
          Positioned(
            child: GestureDetector(
              onTap: () =>
                  showSessionDatePicker(context, (date) => onDateTapped(date)),
              child: Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    'assets/icons/welcome_page/welcome_calendar.svg',
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RadioBtnWidget extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _RadioBtnWidget({
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: isActive ? const Color(0xffE94359) : const Color(0xffB1B5C4),
          ),
        ),
        padding: EdgeInsets.all(15.h),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3.0,
                  color: isActive
                      ? const Color(0xffE94359)
                      : const Color(0xffB1B5C4),
                ),
              ),
              child: Visibility(
                visible: isActive,
                child: Center(
                  child: Container(
                    width: 9.w,
                    height: 9.w,
                    decoration: const BoxDecoration(
                      color: Color(0xffE94359),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 18.w),
            Text(
              title,
              style: TextStyle(
                fontFamily: "SF Pro",
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF353945),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
