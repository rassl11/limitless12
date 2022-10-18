import 'package:auto_route/auto_route.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_state.dart';
import 'package:users_creators/src/features/creator/bloc/dropdown/user_drop_down_event.dart';
import 'package:users_creators/src/features/creator/ui/widgets/manage_line_widget.dart';

import '../../bloc/dropdown/user_drop_down_bloc.dart';
import '../../bloc/dropdown/user_drop_down_state.dart';
import '../../bloc/subscribe/user_subscribe_bloc.dart';
import '../../bloc/subscribe/user_subscribe_state.dart';
import '../widgets/about_popup.dart';
import '../widgets/creator_account_widget.dart';
import '../widgets/social_media.dart';
import '../widgets/subscribe_line_widget.dart';
import '../widgets/tab_bar_creator.dart';
import '../widgets/tab_bar_view_creator/tab_bar_view_creator.dart';

class CreatorPage extends StatefulWidget {
  const CreatorPage({Key? key}) : super(key: key);

  @override
  State<CreatorPage> createState() => _CreatorPageState();
}

class _CreatorPageState extends State<CreatorPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userSubscribeBloc = context.read<UserSubscribeBloc>();
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<CreatorProfileBloc, CreatorProfileState>(
          builder: (context, creatorState) {
            return BlocBuilder<UserSubscribeBloc, UserSubscribeState>(
              builder: (context, stateSub) {
                return BlocBuilder<UserDropDownBloc, UserDropDownState>(
                    builder: (context, state) {
                  if (creatorState is LoadingCreatorProfileState) {
                    return const AppLoadingWidget();
                  }
                  if (creatorState is LoadedOtherCreatorProfileState) {
                    return GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.r),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 17.r),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                context.router.navigateBack();
                                              },
                                              child: SvgPicture.asset(
                                                  'assets/icons/creator/left_arrow.svg'),
                                            ),
                                            const Expanded(child: SizedBox()),
                                            Text(
                                              'Creator profile',
                                              style: TextStyle(
                                                  fontFamily: 'SF Pro',
                                                  fontSize: 15.sp,
                                                  letterSpacing: 0.6,
                                                  color:
                                                      const Color(0xFF353945),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              width: 17.r,
                                            ),
                                            const Expanded(child: SizedBox()),
                                          ],
                                        ),
                                        Divider(
                                          height: 15.r,
                                        ),
                                        SizedBox(
                                          height: 5.r,
                                        )
                                      ],
                                    ),
                                  ),
                                  const CreatorAccount(),
                                  SizedBox(
                                    height: 15.r,
                                  ),
                                  SubscribeLine(
                                    tikTok: creatorState.data.tikTok,
                                    youtube: creatorState.data.youtube,
                                    instagram: creatorState.data.instagram,
                                    followStatus: creatorState.data.isFollowed,
                                    userId: creatorState.data.id!,
                                  ),
                                  SizedBox(
                                    height: 10.r,
                                  ),
                                  TabBarCreator(
                                    tabController: _tabController,
                                  ),
                                  Expanded(
                                      child: TabBarViewCreator(
                                    tabController: _tabController,
                                    creatorId: creatorState.data.id ?? '',
                                    fullName:
                                        '${creatorState.data.firstName} ${creatorState.data.lastName}',
                                  )),
                                ],
                              ),
                            ),
                            if (state is ShowAboutState ||
                                state is ShowSocialMediaState)
                              if (state is ShowAboutState)
                                AboutPopup(
                                  stateSub: stateSub,
                                ),
                            if (state is ShowSocialMediaState)
                              SocialMediaPopup(
                                instagram: creatorState.data.instagram,
                                tikTok: creatorState.data.tikTok,
                                youtube: creatorState.data.youtube,
                                bloc: userSubscribeBloc,
                                stateSub: stateSub,
                              ),
                            if (state is ClosedPopup) const SizedBox()
                          ],
                        ),
                      ),
                      onTap: () {
                        if (state is ShowAboutState) {
                          context
                              .read<UserDropDownBloc>()
                              .add(UserCloseAboutEvent());
                        } else if (state is ShowSocialMediaState) {
                          context
                              .read<UserDropDownBloc>()
                              .add(UserCloseSocialMediaEvent());
                        }
                      },
                    );
                  }
                  if (creatorState is LoadedCurrentCreatorProfileState) {
                    return GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.r),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 17.r),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 5.r,
                                        )
                                      ],
                                    ),
                                  ),
                                  const CreatorAccount(),
                                  SizedBox(
                                    height: 15.r,
                                  ),
                                  SubscribeLine(
                                    tikTok: creatorState.data.tikTok,
                                    youtube: creatorState.data.youtube,
                                    instagram: creatorState.data.instagram,
                                    followStatus: creatorState.data.isFollowed,
                                    userId: creatorState.data.id!,
                                  ),
                                  SizedBox(
                                    height: 10.r,
                                  ),
                                  TabBarCreator(
                                    tabController: _tabController,
                                  ),
                                  Expanded(
                                      child: TabBarViewCreator(
                                    tabController: _tabController,
                                    creatorId: creatorState.data.id ?? '',
                                    fullName:
                                        '${creatorState.data.firstName} ${creatorState.data.lastName}',
                                  )),
                                ],
                              ),
                            ),
                            if (state is ShowAboutState ||
                                state is ShowSocialMediaState)
                              if (state is ShowAboutState)
                                AboutPopup(
                                  stateSub: stateSub,
                                ),
                            if (state is ShowSocialMediaState)
                              SocialMediaPopup(
                                instagram: creatorState.data.instagram,
                                tikTok: creatorState.data.tikTok,
                                youtube: creatorState.data.youtube,
                                bloc: userSubscribeBloc,
                                stateSub: stateSub,
                              ),
                            if (state is ClosedPopup) const SizedBox()
                          ],
                        ),
                      ),
                      onTap: () {
                        if (state is ShowAboutState) {
                          context
                              .read<UserDropDownBloc>()
                              .add(UserCloseAboutEvent());
                        } else if (state is ShowSocialMediaState) {
                          context
                              .read<UserDropDownBloc>()
                              .add(UserCloseSocialMediaEvent());
                        }
                      },
                    );
                  }
                  if (creatorState is LoadedMyCreatorProfileState) {
                    return GestureDetector(
                      child: Container(
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.r),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 17.r),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 5.r,
                                        )
                                      ],
                                    ),
                                  ),
                                  const CreatorAccount(),
                                  SizedBox(
                                    height: 15.r,
                                  ),
                                  ManageLine(
                                    tikTok: creatorState.data.tikTok,
                                    youtube: creatorState.data.youtube,
                                    instagram: creatorState.data.instagram,
                                    followStatus: creatorState.data.isFollowed,
                                    userId: creatorState.data.id!,
                                  ),
                                  SizedBox(
                                    height: 10.r,
                                  ),
                                  TabBarCreator(
                                    tabController: _tabController,
                                  ),
                                  Expanded(
                                      child: TabBarViewCreator(
                                    tabController: _tabController,
                                    creatorId: creatorState.data.id ?? '',
                                    fullName:
                                        '${creatorState.data.firstName} ${creatorState.data.lastName}',
                                  )),
                                ],
                              ),
                            ),
                            if (state is ShowAboutState ||
                                state is ShowSocialMediaState)
                              if (state is ShowAboutState)
                                AboutPopup(
                                  stateSub: stateSub,
                                ),
                            if (state is ShowSocialMediaState)
                              SocialMediaPopup(
                                instagram: creatorState.data.instagram,
                                tikTok: creatorState.data.tikTok,
                                youtube: creatorState.data.youtube,
                                bloc: userSubscribeBloc,
                                stateSub: stateSub,
                              ),
                            if (state is ClosedPopup) const SizedBox()
                          ],
                        ),
                      ),
                      onTap: () {
                        if (state is ShowAboutState) {
                          context
                              .read<UserDropDownBloc>()
                              .add(UserCloseAboutEvent());
                        } else if (state is ShowSocialMediaState) {
                          context
                              .read<UserDropDownBloc>()
                              .add(UserCloseSocialMediaEvent());
                        }
                      },
                    );
                  }
                  return const SizedBox.shrink();
                });
              },
            );
          },
        ),
      ),
    );
  }
}
