import 'package:components/common_widgets/carousel/page_view_indicator.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class AppPageViewIndicator extends StatelessWidget {
  const AppPageViewIndicator({
    Key? key,
    required this.pageIndexNotifier,
    required this.length,
    this.activeColor = ColorsLimitless.brandColor, this.color = ColorsLimitless.greyDark
  }) : super(key: key);

  final ValueNotifier<int> pageIndexNotifier;
  final int length;
  final Color activeColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      indicatorPadding: const EdgeInsets.all(0.0),
      normalBuilder: (animationController, index) => PageViewDot(
        isActive: false,
        activeColor: activeColor, color: color,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController!,
          curve: Curves.ease,
        ),
        child: PageViewDot(
          isActive: true,
          activeColor: activeColor,
          color: color
        ),
      ),
    );
  }
}

class PageViewDot extends StatelessWidget{
  final bool isActive;
  final Color activeColor;
  final Color color;

  const PageViewDot({Key? key, required this.isActive, required this.activeColor, required this.color }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 30,
        height: 2,
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          color: isActive ? activeColor : color,
        ),
      ),
    );
  }

}