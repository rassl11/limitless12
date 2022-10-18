import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intercom_flutter/intercom_flutter.dart';
import 'package:users_creators/src/core/config/router.dart';
import 'package:users_creators/src/features/settings/presentation/profile/bloc/profile_bloc.dart';
import 'package:users_creators/src/features/settings/presentation/profile/presentation/widgets/feedback_dialog.dart';
import 'package:users_creators/src/features/settings/presentation/profile/presentation/widgets/profile_item_widget.dart';
import 'package:users_creators/src/features/settings/presentation/profile/presentation/widgets/remove_ads.dart';
import 'package:users_creators/src/features/settings/presentation/profile/presentation/widgets/remove_ads_dialog.dart';
import 'package:users_creators/src/features/settings/presentation/subscription/widgets/subscription_widget.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(const ProfileEvent.getProfile());
    BlocProvider.of<ProfileBloc>(context).add(const ProfileEvent.reloadRole());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
      return state.map(initial: (state) {
        return Scaffold(
            key: _scaffoldKey,
            backgroundColor: ColorsLimitless.backgroundColor,
            resizeToAvoidBottomInset: false,
            body: Column(children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.r, vertical: 10.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  child: SvgPicture.asset(
                                    'assets/icons/top_panel_library/left_arrow.svg',
                                    height: 15.r,
                                  ),
                                  onTap: () {
                                    context.navigateBack();
                                  },
                                ),
                                SizedBox(
                                  width: 15.r,
                                ),
                                state.profile.avatarUrl!.isEmpty
                                    ? Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: ColorsLimitless.greyLight
                                                .withOpacity(0.3)),
                                      )
                                    : Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  state.profile.avatarUrl!,
                                                ))),
                                      ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  '${state.profile.firstName ?? ''} ${state.profile.lastName ?? ''}',
                                  style: TextStyle(
                                      color: ColorsLimitless.greyDark,
                                      fontFamily: 'SF Pro',
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                context.router
                                    .navigateNamed('/edit-profile-page');
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/settings/edit.svg',
                                height: 17.r,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13.r),
                child: Column(
                  children: [
                    if (!state.isCreator)
                      const SubscriptionWidget(
                        isSubscribed: false,
                      ),
                    SizedBox(
                      height: 28.r,
                    ),
                    if (state.isCreator)
                      ProfileItemWidget(
                        icon: 'assets/icons/settings/profile.svg',
                        title: 'Profile',
                        onTap: () {
                          context.router.push(
                            UserWebViewPageRoute(appBarTitle: 'Profile'),
                          );
                        },
                        showArrow: true,
                      ),
                    if (state.isCreator)
                      SizedBox(
                        height: 10.r,
                      ),
                    if (state.isCreator)
                      ProfileItemWidget(
                        icon: 'assets/icons/settings/payments.svg',
                        title: 'Payments',
                        onTap: () {},
                        showArrow: true,
                      ),
                    if (state.isCreator)
                      SizedBox(
                        height: 10.r,
                      ),
                    ProfileItemWidget(
                      icon: 'assets/icons/settings/settings.svg',
                      title: 'Settings',
                      onTap: () {
                        context.router.pushNamed('/settings-page');
                      },
                      showArrow: true,
                    ),
                    SizedBox(
                      height: 10.r,
                    ),
                    ProfileItemWidget(
                      icon: 'assets/icons/settings/support.svg',
                      title: 'Support',
                      onTap: () {
                        Intercom.instance.loginUnidentifiedUser();
                        Intercom.instance.displayMessenger();
                      },
                    ),
                    SizedBox(
                      height: 10.r,
                    ),
                    if (!state.isCreator)
                      ProfileItemWidget(
                        icon: 'assets/icons/settings/creator.svg',
                        title: 'Become a creator',
                        onTap: () {
                          context.router.navigateNamed('/welcome-page');
                        },
                      ),
                    if (!state.isCreator)
                      SizedBox(
                        height: 10.r,
                      ),
                    ProfileItemWidget(
                      icon: 'assets/icons/settings/feedback.svg',
                      title: 'Share your feedback',
                      onTap: () {
                        showDialog(
                            useSafeArea: false,
                            context: context,
                            builder: (context) {
                              return Container(
                                  height: 200,
                                  color:
                                      const Color(0xFF142A4B).withOpacity(0.25),
                                  child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 1.5, sigmaY: 1.5),
                                      child: const FeedbackDialog()));
                            });
                      },
                    ),
                    SizedBox(
                        height: 10.r,
                      ),
                    ProfileItemWidget(
                      icon: 'assets/icons/settings/remove_ads.svg',
                      title: 'Remove ads',
                      onTap: () {
                         showDialog(
                            useSafeArea: false,
                            context: context,
                            builder: (context) {
                              return Container(
                                  height: 300,
                                  color:
                                      const Color(0xFF142A4B).withOpacity(0.25),
                                  child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 1.5, sigmaY: 1.5),
                                      child: const RemoveAds()));
                            });
                      },
                    
                    )
                  ],
                ),
              ),
            ]));
      }, loading: (state) {
        return const AppLoadingWidget();
      });
    });
  }
}
