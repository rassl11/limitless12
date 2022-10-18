import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../alert_dialog/alert_dialog.dart';
import 'widgets/tabbar.dart';
import 'widgets/tabbarview/tabbarview.dart';

showProgramBottomSheet(BuildContext context, int initialTab) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => _MainBody(initialTab: initialTab),
  );
}

class _MainBody extends StatefulWidget {
  final int initialTab;

  const _MainBody({
    Key? key,
    required this.initialTab,
  }) : super(key: key);

  @override
  State<_MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<_MainBody> with TickerProviderStateMixin {
  late final TabController _tabController;
  int currentTab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTab,
    );
    _tabController.addListener(() {
      setState(() {
        currentTab = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Container(
        height: MediaQuery.of(context).size.height * .9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Container(
                      width: 60.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffE6E8EC),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 37.h),
                ProgramTabBar(controller: _tabController),
                ProgramTabBarView(controller: _tabController),
              ],
            ),
            Visibility(
              visible: _tabController.index == 1,
              child: Positioned(
                bottom: 0,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    top: 14.h,
                    bottom: 28.h,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(8.r),
                    child: InkWell(
                      onTap: () => showProgramOnboardingDialog(context),
                      borderRadius: BorderRadius.circular(8.r),
                      splashFactory: InkRipple.splashFactory,
                      child: Ink(
                        padding: EdgeInsets.zero,
                        width: MediaQuery.of(context).size.width - 32.w,
                        height: 48.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: const Color(0xffE94359),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/creator/CalendarCheckCreatorProgram.svg',
                                width: 16.w,
                                height: 16.w,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                'ADD',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "SF Pro",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
