import 'package:avatar_view/avatar_view.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/core/widgets/dialogs/date_picker.dart';
import 'package:users_creators/src/features/library/bloc/my_sessions/my_sessions_bloc.dart';
import 'package:users_creators/src/features/library/bloc/my_sessions/my_sessions_event.dart';
import 'package:users_creators/src/features/library/entity/domain/session_model.dart';

class CalendarItem extends StatelessWidget {
  const CalendarItem({Key? key, required this.session}) : super(key: key);
  final SessionModel session;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarView(
                  radius: 20,
                  avatarType: AvatarType.CIRCLE,
                  backgroundColor: ColorsLimitless.greyDark,
                  imagePath: session.userAvatarUrl ?? '',
                  placeHolder: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 20,
                  ),
                  errorWidget: const Icon(
                    Icons.error,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 12.r,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      session.name ?? '',
                      style: TextStyle(
                        color: ColorsLimitless.greyDark,
                        fontSize: 20.sp,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    SizedBox(
                      width: 0.6.sw,
                      child: Row(
                        children: [
                          _CardBottomRow(
                            img: 'assets/icons/creator/FitnessWeightsLibrary.svg',
                            value: ('${session.exercises?.length ?? 0} Exercises').toString(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 8),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 40.h,
              width: 45.w,
              decoration: const BoxDecoration(
                  color: ColorsLimitless.brandColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12), bottomRight: Radius.circular(12))),
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'assets/icons/creator/workout_calendar.svg',
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  showSessionDatePicker(
                      context,
                      (date) => context.read<MySessionsOptionsBloc>().add(SetSessionToDateEvent(
                          sessionId: session.id,
                          date: date,
                          onSuccess: () => {},
                          onError: () => {})));
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CardBottomRow extends StatelessWidget {
  final String value;
  final String img;

  const _CardBottomRow({
    Key? key,
    required this.value,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          img,
          fit: BoxFit.cover,
          width: 12.0.w,
          height: 12.0.h,
        ),
        SizedBox(width: 4.w),
        Text(
          value,
          style: TextStyle(
            fontSize: 13.sp,
            color: const Color(0xFF777E91),
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
