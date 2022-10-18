import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info/package_info.dart';
import 'package:users_creators/src/core/constants/routes.dart';
import 'package:users_creators/src/features/settings/presentation/profile/bloc/profile_bloc.dart';
import 'package:users_creators/src/features/settings/presentation/settings/bloc/settings_bloc.dart';
import 'package:users_creators/src/features/settings/presentation/settings/domain/settings.dart';
import 'package:users_creators/src/features/settings/presentation/settings/widgets/delete_account.dart';
import 'package:users_creators/src/features/settings/presentation/settings/widgets/logout_dialog.dart';
import 'package:users_creators/src/features/settings/presentation/settings/widgets/settings_container.dart';
import 'package:users_creators/src/features/settings/presentation/settings/widgets/settings_item.dart';

import '../profile/domain/edited_user.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String version = '';

  @override
  void initState() {
    BlocProvider.of<SettingsBloc>(context)
        .add(const SettingsEvent.getSettings());
    PackageInfo.fromPlatform().then((value) {
      setState(() {
        version = value.version;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => SettingsBloc(() {
                  context.router.navigateNamed(Routes.userLoginRoot);
                })),
        BlocProvider(create: (context) => ProfileBloc()),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, value) {
        return value.map(initial: (profile) {
          return BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
            return state.map(initial: (state) {
              return Scaffold(
                backgroundColor: ColorsLimitless.backgroundColor,
                body: SafeArea(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        padding: EdgeInsets.only(top: 45.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8.r),
                                SettingsContainer(
                                  title: 'Workout',
                                  widgets: [
                                    SettingsItem(
                                      image: 'assets/icons/settings/units.svg',
                                      title: 'Units',
                                      showPicker: true,
                                      initialValue: profile.profile.isMetric!
                                          ? 'Metric'
                                          : 'Imperial',
                                      pickerItems: const ['Metric', 'Imperial'],
                                      select: (value) {
                                        BlocProvider.of<ProfileBloc>(context)
                                            .add(ProfileEvent.editUser(
                                                editedUser: EditedUser(
                                                    userName: profile
                                                        .profile.userName,
                                                    dateOfBirth: profile
                                                        .profile.dateOfBirth,
                                                    gender:
                                                        profile.profile.gender,
                                                    firstName: profile
                                                        .profile.firstName,
                                                    lastName: profile
                                                        .profile.lastName,
                                                    avatarUrl: profile
                                                        .profile.avatarUrl,
                                                    height:
                                                        profile.profile.height,
                                                    weight:
                                                        profile.profile.weight,
                                                    isMetric:
                                                        value == 'Metric')));
                                      },
                                    ),
                                    SettingsItem(
                                      image:
                                          'assets/icons/settings/calendar.svg',
                                      title: 'Start of the week',
                                      showPicker: true,
                                      initialValue:
                                          state.settings.startOfWeek == 0
                                              ? 'Sunday'
                                              : 'Monday',
                                      pickerItems: const ['Sunday', 'Monday'],
                                      select: (value) {
                                        BlocProvider.of<SettingsBloc>(context)
                                            .add(SettingsEvent.editSettings(
                                                settings: state.settings
                                                    .copyWith(
                                                        startOfWeek:
                                                            value == 'Sunday'
                                                                ? 0
                                                                : 1)));
                                      },
                                    ),
                                    SettingsItem(
                                      image: 'assets/icons/settings/sound.svg',
                                      title: 'Mute audio',
                                      hasSwitch: true,
                                    ),
                                  ],
                                ),
                                SettingsContainer(
                                  title: 'Notification',
                                  widgets: [
                                    SettingsItem(
                                      image:
                                          'assets/icons/settings/notifications.svg',
                                      title: 'Push notifications',
                                      hasSwitch: true,
                                    ),
                                    SettingsItem(
                                      image: 'assets/icons/settings/emails.svg',
                                      title: 'Emails',
                                      hasSwitch: true,
                                    ),
                                  ],
                                ),
                                SettingsContainer(
                                  title: 'Legal',
                                  widgets: [
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    SettingsItem(
                                      image:
                                          'assets/icons/settings/privacy_terms.svg',
                                      title: 'Privacy Policy',
                                      hasModalBottomSheet: true,
                                    ),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    SettingsItem(
                                      image:
                                          'assets/icons/settings/privacy_terms.svg',
                                      title: 'Terms of use',
                                      hasModalBottomSheet: true,
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                        useSafeArea: false,
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            height: 200,
                                            color: const Color(0xFF142A4B)
                                                .withOpacity(0.25),
                                            child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 1.5, sigmaY: 1.5),
                                                child:
                                                    const DeleteAccountDialog()),
                                          );
                                        });
                                  },
                                  child: SettingsContainer(
                                    widgets: [
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      SettingsItem(
                                          image:
                                              'assets/icons/settings/delete.svg',
                                          titleColor:
                                              ColorsLimitless.brandColor,
                                          title: 'Delete account'),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Version $version',
                                    style: TextStyle(
                                        color: ColorsLimitless.greyLight,
                                        fontFamily: 'SF Pro',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        showDialog(
                                            useSafeArea: false,
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                height: 190.r,
                                                color: const Color(0xFF142A4B)
                                                    .withOpacity(0.25),
                                                child: BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                        sigmaX: 1.5,
                                                        sigmaY: 1.5),
                                                    child: LogoutDialog()),
                                              );
                                            });
                                      },
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/settings/logout.svg',
                                            color: ColorsLimitless.brandColor,
                                            height: 14.r,
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Text('Logout',
                                              style: TextStyle(
                                                  color: ColorsLimitless
                                                      .brandColor,
                                                  fontFamily: 'SF Pro',
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500))
                                        ],
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          width: 1.sw,
                          color: Colors.white,
                          child: SafeArea(
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Settings',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'SF Pro',
                                              letterSpacing: 0.5,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: IconButton(
                                        onPressed: () {
                                          context.router.navigateBack();
                                        },
                                        icon: SvgPicture.asset(
                                          'assets/icons/top_panel/left_arrow.svg',
                                          color: Colors.black,
                                          height: 13.r,
                                        ),
                                      ),
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
              );
            }, loading: (state) {
              return const AppLoadingWidget();
            });
          });
        }, loading: (value) {
          return const AppLoadingWidget();
        });
      }),
    );
  }
}
