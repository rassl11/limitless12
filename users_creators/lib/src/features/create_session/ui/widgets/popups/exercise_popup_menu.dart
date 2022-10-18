import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/core/config/router.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/popups/percent_calculator.dart';

Future showPercentCalculatorDialog(BuildContext context) async {
  return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
          child: const Center(child: PercentCalculator()),
        );
      });
}

void showExercisePopupMenu(
    BuildContext context, Offset offset, int index) async {
  double left = offset.dx;
  double top = offset.dy;
  await showMenu(
    context: context,
    position: RelativeRect.fromLTRB(left, top + 10, 23, 0),
    items: [
      PopupMenuItem<String>(
        onTap: () => context.router.push(ExerciseListPageRoute(
            indexOfExercise: index, swap: true, trainingSessionPart: false)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/icons/create_session/swap.svg'),
            const SizedBox(width: 10),
            const Text(
              'Swap',
              style: TextStyle(
                  color: Color(0xFF353945),
                  fontFamily: 'SF Pro',
                  fontSize: 14,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      PopupMenuItem<String>(
        onTap: () {
          context.router.navigateNamed('/history-page');
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/icons/create_session/history.svg'),
            const SizedBox(width: 10),
            const Text(
              'History',
              style: TextStyle(
                  color: Color(0xFF353945),
                  fontFamily: 'SF Pro',
                  fontSize: 14,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      PopupMenuItem<String>(
        padding: EdgeInsets.only(right: 10.r),
        child: ListTile(
          minLeadingWidth : 0,
          horizontalTitleGap : 10.r,
          leading: SvgPicture.asset('assets/icons/create_session/procent.svg',
          height: 15.r,
          ),
          title:const Text(
              'Percent calculator',
              style: TextStyle(
                  color: Color(0xFF353945),
                  fontFamily: 'SF Pro',
                  fontSize: 14,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w400),
            ),
          onTap: () {
            Navigator.pop(
              context,
            );

            showDialog(
                useSafeArea: false,
                context: context,
                builder: (context) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                    child: const Center(child: PercentCalculator()),
                  );
                });
          },
        ),
      ),
    ],
    elevation: 8.0,
  );
}
