import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    Key? key,
    required TabController tabController,
    required this.tabs,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      splashBorderRadius: BorderRadius.circular(5.r),
      unselectedLabelColor: const Color(0xFFB1B5C3),
      indicatorColor: Colors.black,
      labelColor: Colors.black,
      controller: _tabController,
      tabs: tabs,
    );
  }
}
