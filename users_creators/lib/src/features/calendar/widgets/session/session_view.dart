import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:users_creators/src/features/calendar/widgets/session/result_session_card.dart';
import 'package:users_creators/src/features/calendar/widgets/session/session_card.dart';
import 'package:users_creators/src/features/calendar/widgets/session/session_plan.dart';

import '../../session/domain/session.dart';

class SessionView extends StatelessWidget {
  SessionView({Key? key, required this.sessions, required this.pageController})
      : super(key: key);
  final List<Session> sessions;
  final PageController pageController;
  final ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageController,
        physics: const ClampingScrollPhysics(),
        onPageChanged: (index) => pageIndexNotifier.value = index,
        itemCount: sessions.length,
        itemBuilder: (context, i) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                SmoothPageIndicator(
                    controller: pageController,
                    count: sessions.length,
                    effect: const ScrollingDotsEffect(
                      activeDotColor: ColorsLimitless.greyDark,
                      dotColor: ColorsLimitless.greyLight,
                      activeStrokeWidth: 1,
                      activeDotScale: 1,
                      maxVisibleDots: 7,
                      radius: 8,
                      spacing: 10,
                      dotHeight: 2,
                      dotWidth: 30,
                    )),
                    SizedBox(height: 16.r,),
                sessions[i].isExecuted == true
                    ? Center(
                        child: ResultSessionCard(
                          session: sessions[i],
                          light: true,
                        ),
                      )
                    : SessionCard(
                        session: sessions[i],
                      ),
                SessionPlan(
                  session: sessions[i],
                )
              ],
            ),
          );
        });
  }
}
