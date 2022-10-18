import 'package:components/common_widgets/scroll_behavior.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/core/helpers/comon_helpers.dart';
import 'package:users_creators/src/features/calendar/session/domain/session.dart';
import 'package:users_creators/src/features/calendar/widgets/session/excercise_widget.dart';

class SessionPlan extends StatelessWidget {
  final Session session;
  const SessionPlan({Key? key, required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groups = session.exercises!.groupBy((m) => m.groupId);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Session plan',
            style: TextStyle(
                color: ColorsLimitless.greyMedium,
                fontFamily: "SF Pro",
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                fontSize: 16.r),
          ),
          ScrollConfiguration(
            behavior: AppScrollBehavior(),
            child: ListView.builder(
              padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: groups.values.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    child: ExerciseWidget(
                      exercises: groups.values.elementAt(index),
                      quarterTurns: groups.values.elementAt(index).length == 1 ? 0 : 3,
                      index:index,
                    ),
                    onTap: () {},
                  );
                })),
          ),
        ],
      ),
    );
  }

  // final exercises = [
  //   Exercise(
  //       groupId: '0',
  //       title: 'title',
  //       imageUrl: null,
  //       orderNumber: 2,
  //       restIntervalSec: 8,

  //       sets: [Set(orderNumber: 2, reps: 5, weight: 20)]),
  //   Exercise(
  //       groupId: '1',
  //       title: 'title',
  //       imageUrl: null,
  //       orderNumber: 2,
  //       restIntervalSec: 8,

  //       sets: [Set(orderNumber: 2, reps: 5, weight: 20)]),
  //   Exercise(
  //     groupId: '2',
  //       title: 'title',
  //       imageUrl: null,
  //       restIntervalSec: 8,
  //       orderNumber: 2,
  //       sets: [Set(orderNumber: 2, reps: 5, weight: 20)]),
  //   Exercise(
  //       groupId: '1',
  //       title: 'title',
  //       imageUrl: null,
  //       restIntervalSec: 8,
  //       orderNumber: 2,
  //       sets: [Set(orderNumber: 2, reps: 5, weight: 20)]),
  //   Exercise(
  //       title: 'title',
  //       imageUrl: null,
  //       groupId: '2',
  //       orderNumber: 2,
  //       restIntervalSec: 8,
  //       sets: [Set(orderNumber: 2, reps: 5, weight: 20)]),
  // ];
}
