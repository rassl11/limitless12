import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/library/bloc/session/bloc.dart';
import 'package:users_creators/src/features/library/bloc/session/user_session_event.dart';
import 'package:users_creators/src/features/library/bloc/session/user_session_state.dart';

class Sessions extends StatelessWidget {
  const Sessions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserSessionState>(
      builder: (context, state) {
        return Padding(
            padding: EdgeInsets.only(left: 0.r, right: 0.r, top: 0.r, bottom: 5.r),
            child: Row(
              children: [
                Text(
                  'My Sessions',
                  style: TextStyle(
                      fontFamily: 'SF Pro',
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                GestureDetector(
                    child: SizedBox(
                      child: Text(
                        'Calendar',
                        style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w500,
                            color: state is UserLoadedCalendar
                                ? const Color(0xFFE94359)
                                : const Color(0xFFB1B5C3),
                            fontSize: 15.sp),
                      ),
                    ),
                    onTap: () {
                      context.read<UserBloc>().add(CalendarEvent());
                    }),
                SizedBox(
                  width: 15.r,
                ),
                GestureDetector(
                  child: SizedBox(
                    child: Text(
                      'Templates',
                      style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w500,
                          color: state is UserLoadedTemplates
                              ? const Color(0xFFE94359)
                              : const Color(0xFFB1B5C3),
                          fontSize: 15.sp),
                    ),
                  ),
                  onTap: () {
                    context.read<UserBloc>().add(TemplatesEvent());
                  },
                )
              ],
            ));
      },
    );
  }
}
