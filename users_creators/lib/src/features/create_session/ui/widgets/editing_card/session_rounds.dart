import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/core/view_models/exercise_view_model.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_event.dart';

// ignore: must_be_immutable
class SessionRounds extends StatefulWidget {
  const SessionRounds({
    Key? key,
    required this.index,
    required this.exercise,
  }) : super(key: key);
  final int index;
  final ExerciseViewModel exercise;

  @override
  SessionRoundsState createState() => SessionRoundsState();
}

class SessionRoundsState extends State<SessionRounds> {
  int rounds = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Rounds',
            style: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 16.sp,
                letterSpacing: 0.5,
                color: ColorsLimitless.greyMedium,
                fontWeight: FontWeight.w600),
          ),
        ),
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: widget.exercise.round > 1
                        ? ColorsLimitless.brandColor
                        : const Color(0xFFECAAAA))),
            child: SvgPicture.asset(
              'assets/icons/create_session/minus.svg',
              color:
                  widget.exercise.round > 1 ? ColorsLimitless.brandColor : const Color(0xFFECAAAA),
            ),
          ),
          onTap: () {
            if (widget.exercise.round > 1) {
              widget.exercise.round--;
            }
            context.read<CreateSessionBloc>().add(
                SetRoundsEvent(groupId: widget.exercise.groupId, rounds: widget.exercise.round));
          },
        ),
        SizedBox(
          width: 10.r,
        ),
        Container(
            width: 60.r,
            height: 36.r,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE4E6EA)),
                borderRadius: BorderRadius.circular(6.r)),
            child: Center(
                child: Text(
              widget.exercise.round.toString(),
              style: TextStyle(
                  fontFamily: "SF Pro",
                  fontSize: 14.sp,
                  color: ColorsLimitless.textColor,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5),
            ))),
        SizedBox(
          width: 10.r,
        ),
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, border: Border.all(color: ColorsLimitless.brandColor)),
            child: SvgPicture.asset('assets/icons/create_session/plus.svg'),
          ),
          onTap: () {
            widget.exercise.round = widget.exercise.round + 1;
            context.read<CreateSessionBloc>().add(
                SetRoundsEvent(groupId: widget.exercise.groupId, rounds: widget.exercise.round));
          },
        ),
        SizedBox(
          width: 20.r,
        ),
      ],
    );
  }
}
