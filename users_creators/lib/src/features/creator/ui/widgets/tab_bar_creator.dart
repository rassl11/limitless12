import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../tab_elements_creator.dart';


class TabBarCreator extends StatelessWidget {
  const TabBarCreator({ Key? key,required this.tabController }) : super(key: key);
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      splashBorderRadius: BorderRadius.circular(5.r),
      unselectedLabelColor: const Color(0xFFB1B5C3),
      labelPadding: EdgeInsets.only(bottom: 10.r),
      indicatorColor: Colors.black,
      labelColor: Colors.black,
      controller: tabController,
      tabs: TabElementsCreator.views
    );
  }
}