import 'package:avatar_view/avatar_view.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/core/widgets/dialogs/date_picker.dart';
import 'package:users_creators/src/features/library/ui/widgets/template/session_info.dart';

import '../../../../calendar/bloc/calendar_bloc.dart';
import '../../../../calendar/session/bloc/session_bloc.dart';
import '../../../bloc/my_sessions/my_sessions_bloc.dart';
import '../../../bloc/my_sessions/my_sessions_event.dart';
import '../../../entity/domain/template_model.dart';
import 'template_settings.dart';

class TemplateItem extends StatelessWidget {
  const TemplateItem({Key? key, required this.template}) : super(key: key);
  final TemplateModel template;

  Future showSettings(BuildContext context, String sessionId) {
    return showModalBottomSheet(
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      context: context,
      builder: (_) {
        return TemplateSettings(
          sessionId: sessionId,
          baseContext: context,
          template: template,
        );
      },
    );
  }

  void onSessionSettedToDate(BuildContext context, DateTime date) {
    context.read<MySessionsOptionsBloc>().add(SetSessionToDateEvent(
        sessionId: template.id,
        date: date,
        onSuccess: () {
          BlocProvider.of<CalendarBloc>(context).add(CalendarEvent.selectDay(
              day: DateTime.now().day,
              month: DateTime.now().month,
              year: DateTime.now().year));
          BlocProvider.of<SessionBloc>(context)
              .add(SessionEvent.getSessions(date: DateTime.now()));

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ColorsLimitless.textColor,
              content: Text(
                'Session has added to calendar',
                style: TextStyle(
                    fontFamily: 'SF Pro', fontSize: 12.sp, color: Colors.white),
              ),
            ),
          );
        },
        onError: () => {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: ColorsLimitless.textColor,
                  content: Text(
                    'Error happens. Please, try again later',
                    style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 12.sp,
                        color: Colors.white),
                  ),
                ),
              )
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: BorderSide(color: Colors.grey[100]!),
          ),
          margin: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.all(12.0.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarView(
                  radius: 20,
                  avatarType: AvatarType.CIRCLE,
                  backgroundColor: ColorsLimitless.greyDark,
                  imagePath: template.userAvatarUrl ?? '',
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(template.name ?? '',
                      overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w800,
                            fontStyle: FontStyle.italic,
                            fontSize: 20.sp,
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: 0.56.sw,
                        child: Row(
                          children: [
                            _CardBottomRow(
                              value: "${template.exerciseCount} Exercises",
                              img:
                                  'assets/icons/creator/TrendsHotFlameCreatorWorkout.svg',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          showSessionInfo(context, template.id);
        },
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 54, 0, 8),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 40.h,
            width: 45.w,
            decoration: const BoxDecoration(
                color: ColorsLimitless.brandColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
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
                    context, (date) => onSessionSettedToDate(context, date));
              },
            ),
          ),
        ),
      ),
      Positioned(
          top: 12.w,
          right: 12.w,
          child: Row(
            children: [
              GestureDetector(
                child: SizedBox(
                  child: SvgPicture.asset(
                    'assets/icons/start_session/settings.svg',
                    height: 25.r,
                    color: ColorsLimitless.greyDark,
                  ),
                ),
                onTap: () {
                  showSettings(context, template.id);
                },
              ),
            ],
          )),
    ]);
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
