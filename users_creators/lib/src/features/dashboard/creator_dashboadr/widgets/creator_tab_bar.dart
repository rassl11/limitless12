import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatorTabBar extends StatefulWidget {
  const CreatorTabBar({Key? key}) : super(key: key);

  @override
  _CreatorTabBarState createState() => _CreatorTabBarState();
}

class _CreatorTabBarState extends State<CreatorTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 38.r,
        decoration: BoxDecoration(
            color: ColorsLimitless.grayNeutrals,
            borderRadius: BorderRadius.circular(5.r)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.r, vertical: 3.r),
          child: TabBar(
              isScrollable: false,
              labelColor: ColorsLimitless.textColor,
              labelPadding: EdgeInsets.only(
                top: 2.h,
                left: 10.w,
                right: 10.w,
              ),
              unselectedLabelColor: ColorsLimitless.greyLight,
              indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.r)),
              controller: _tabController,
              tabs: [
                Center(
                  child: Text(
                    'Training',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  'Analytics',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
