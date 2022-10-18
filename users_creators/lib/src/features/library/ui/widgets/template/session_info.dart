import 'dart:ui';

import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/core/helpers/comon_helpers.dart';
import 'package:users_creators/src/features/library/bloc/get_session_id/get_session_bloc.dart';
import 'package:users_creators/src/features/library/bloc/get_session_id/get_session_event.dart';
import 'package:users_creators/src/features/library/bloc/get_session_id/get_session_state.dart';
import 'package:users_creators/src/features/library/entity/domain/session_model.dart';
import 'package:users_creators/src/features/library/ui/widgets/template/multi_exercise_card_template.dart';
import 'package:users_creators/src/features/library/ui/widgets/template/single_exercise_card_template.dart';

void showSessionInfo(BuildContext context, String sessionId) {
  context.read<GetSessionBloc>().add(GetSessionEvent(sessionId: sessionId));
  showDialog(
      useSafeArea: false,
      context: context,
      barrierColor: const Color(0xFF142A4B).withOpacity(0.25),
      builder: (context) {
        return Container(
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFF142A4B).withOpacity(0.25),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                child: Center(
                    child: SessionInfo(
                  sessionId: sessionId,
                ))));
      });
}

class SessionInfo extends StatelessWidget {
  const SessionInfo({Key? key, required this.sessionId}) : super(key: key);
  final String sessionId;

  List<Widget> produceExerciseCards(GotSessionState state) {
    List<Widget> result = [];
    final groups = state.session.exercises!.groupBy((m) => m.groupId);
    for (int index = 0; index < groups.length; index++) {
      List<SessionExerciseModel> currentGroup = groups.values.elementAt(index);

      switch (currentGroup.length) {
        case 0:
          result.add(const SizedBox());
          break;
        case 1:
          result.add(SingleExerciseCardTemplate(
            exercise: currentGroup,
            index: index,
          ));
          break;
        case 2:
          result.add(
              MultiExerciseCardTemplate(index: index, exercise: currentGroup));
          break;
        case 3:
          result.add(MultiExerciseCardTemplate(
            index: index,
            exercise: currentGroup,
          ));
          break;
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSessionBloc, GetSessionState>(
      builder: (context, state) {
        if (state is LoadingGettingState) {
          return const AppLoadingWidget();
        }
        if (state is GotSessionState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.r),
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r)),
                  width: 1.sw,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 25.r, horizontal: 25.r),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            state.session.userAvatarUrl == null ||
                                    state.session.userAvatarUrl == ''
                                ? const CircleAvatar(
                                    backgroundColor: ColorsLimitless.greyDark,
                                    child: Text(''),
                                  )
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        '${state.session.userAvatarUrl}'),
                                  ),
                            SizedBox(
                              width: 9.r,
                            ),
                            Expanded(
                                child: Text(
                              '${state.session.name}',
                              style: TextStyle(
                                  fontFamily: 'SF Pro',
                                  fontSize: 16.sp,
                                  color: ColorsLimitless.textColor,
                                  fontWeight: FontWeight.w700),
                            )),
                            GestureDetector(
                              child: SvgPicture.asset(
                                  'assets/icons/workout_popup/close.svg'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.r,
                        ),
                        Wrap(
                          runSpacing: 10,
                          children: produceExerciseCards(state),
                        ),
                      ],
                    ),
                  )),
            ),
          );
        }
        if (state is EmptySessionState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.white,
                child: const Center(
                  child: Text('No session yet'),
                ),
              ),
            ],
          );
        }
        if (state is ErrorGettingState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text('Error has been happened'),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
