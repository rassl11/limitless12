import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/bottom/widgets/discover_bottom_bar_item.dart';
import 'package:users_creators/src/features/followed/bloc/followed_bloc.dart';
import 'package:users_creators/src/features/followed/bloc/followed_event.dart';
import 'package:users_creators/src/features/followed/bloc/followed_state.dart';
import 'package:users_creators/src/features/library/ui/discover_list.dart';
import 'package:users_creators/src/features/login/repo/login_repo.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget(
      {Key? key, required this.controller, required this.initialPage})
      : super(key: key);
  final PageController controller;
  final int initialPage;

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int? currentsPage;

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  void showFollowed() {
    showModalBottomSheet(
        barrierColor: const Color(0xFF142A4B).withOpacity(0.35),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r))),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: BlocBuilder<FollowedBloc, FollowedState>(
              builder: (context, state) {
                if (state is LoadedAllFollowedState) {
                  return Container(
                    height: 0.87.sh,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          topRight: Radius.circular(15.r)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.r, vertical: 10.r),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.r,
                          ),
                          Container(
                            width: 64.r,
                            height: 4.5.r,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.r),
                                color: const Color(0xFFAFB3C1)),
                          ),
                          SizedBox(
                            height: 10.r,
                          ),
                          SizedBox(
                            height: 0.7.sh,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.followed?.length,
                              itemBuilder: (_, index) {
                                return DiscoverListWidget(
                                  followed: state.followed ?? [],
                                  index: index,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.r),
                            child: Material(
                              borderRadius: BorderRadius.circular(6.r),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(6.r),
                                splashFactory: InkRipple.splashFactory,
                                splashColor: const Color(0xFFBA4454),
                                child: Ink(
                                  padding: EdgeInsets.zero,
                                  height: 0.055.sh,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      color: const Color(0xFFE94359)),
                                  child: Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/creator/discover.svg'),
                                        SizedBox(
                                          width: 7.r,
                                        ),
                                        Text(
                                          'Discover',
                                          style: TextStyle(
                                              color: const Color(0xFFFCFCFD),
                                              fontFamily: "SF Pro",
                                              letterSpacing: 0.5,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  context.router
                                      .navigateNamed('/discover-page');
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                if (state is LoadingAllFollowedState) {
                  return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        height: 0.87.sh,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.r),
                              topRight: Radius.circular(15.r)),
                          color: Colors.white,
                        ),
                        child: const AppLoadingWidget(),
                      ));
                }
                return const Text('ERROR');
              },
            ),
          );
        });
  }

  @override
  void initState() {
    currentsPage = widget.initialPage;
    widget.controller.addListener(() {
      setState(() {
        currentsPage = widget.controller.page!.floor();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var loginRepo = LoginRepo();
    return Container(
      height: 0.11.sh,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.r),
            topLeft: Radius.circular(15.r),
          )),
      child: Padding(
        padding: EdgeInsets.only(
            top: 10.r,
            bottom: MediaQuery.of(context).padding.bottom > 1 ? 20.r : 10.r,
            left: 5.r,
            right: 5.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomBarItem(
              title: 'Calendar',
              icon: 'assets/icons/dashboard/calendar.svg',
              onLongPress: () {},
              onTap: () {
                setState(() {
                  currentsPage = 0;
                  widget.controller.jumpToPage(0);
                });
              },
              isActive: currentsPage == 0,
            ),
            BottomBarItem(
              onLongPress: () {},
              title: 'Chat',
              icon: 'assets/icons/dashboard/chat.svg',
              onTap: () {
                setState(() {
                  currentsPage = 1;
                  widget.controller.jumpToPage(1);
                });
              },
              isActive: currentsPage == 1,
            ),
            DiscoverBottomBarItem(
              onLongPress: () {
                context.read<FollowedBloc>().add(GetFollowedEvent());
                showFollowed();
              },
              onTap: () {
                setState(() {
                  currentsPage = 2;
                  widget.controller.jumpToPage(2);
                });
              },
              isActive: currentsPage == 2,
            ),
            BottomBarItem(
              onLongPress: () {},
              title: 'Library',
              icon: 'assets/icons/dashboard/library.svg',
              onTap: () {
                setState(() {
                  currentsPage = 3;
                  widget.controller.jumpToPage(3);
                });
              },
              isActive: currentsPage == 3,
            ),
            BottomBarItem(
              onLongPress: () {},
              title: 'Dashboard',
              icon: 'assets/icons/dashboard/result.svg',
              onTap: () {
                setState(() {
                  currentsPage = 4;
                  widget.controller.jumpToPage(4);
                });
              },
              isActive: currentsPage == 4,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final bool isCenterIcon;
  final String icon;
  final String title;
  final Function onTap;
  final bool isActive;
  final Function? onLongPress;

  const BottomBarItem(
      {Key? key,
      required this.icon,
      this.title = '',
      required this.onTap,
      this.isCenterIcon = false,
      required this.isActive,
      required this.onLongPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusNode: FocusNode(),
      onTap: () => onTap(),
      onLongPress: () => onLongPress!(),
      child: Center(
          child: isCenterIcon
              ? Stack(
                  children: [
                    Image.asset(icon),
                    Positioned(
                      top: 1.r,
                      right: 2.r,
                      child: Align(
                        child: Container(
                          padding: EdgeInsets.all(5.r),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                        ),
                      ),
                    )
                  ],
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(icon,
                        color: isActive
                            ? ColorsLimitless.greyDark
                            : ColorsLimitless.greyLight),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'SF Pro',
                          color: isActive
                              ? ColorsLimitless.greyDark
                              : ColorsLimitless.greyLight),
                    ),
                  ],
                )),
    );
  }
}
