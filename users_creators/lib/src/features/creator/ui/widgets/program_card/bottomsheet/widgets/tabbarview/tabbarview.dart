import 'package:flutter/material.dart';

import 'tab_1.dart';
import 'tab_2.dart';

class ProgramTabBarView extends StatelessWidget {
  final TabController controller;

  const ProgramTabBarView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: controller,
        children: const [
          Tab(child: ProgramTab1()),
          Tab(child: ProgramTab2()),
        ],
      ),
    );
  }
}
