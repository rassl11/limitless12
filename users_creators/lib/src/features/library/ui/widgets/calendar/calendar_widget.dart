import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/library/bloc/my_sessions/my_sessions_bloc.dart';
import 'package:users_creators/src/features/library/bloc/my_sessions/my_sessions_event.dart';
import 'package:users_creators/src/features/library/bloc/my_sessions/my_sessions_state.dart';
import 'package:users_creators/src/features/library/ui/widgets/template/session_info.dart';

import '../sessions.dart';
import 'calendar_item.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE4E4E4).withOpacity(0.2),
      child: Padding(
        padding: EdgeInsets.only(left: 14.r, right: 14.r, top: 14.r),
        child: Column(
          children: [
            const Sessions(),
            Expanded(
              child: RefreshIndicator(
                color: ColorsLimitless.brandColor,
                onRefresh: () async {
                  context
                      .read<MySessionsCalendarBloc>()
                      .add(LoadSessionCalendarEvent());
                },
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: .9.sh),
                    child: BlocBuilder<MySessionsCalendarBloc,
                        MySessionCalendarState>(
                      builder: (context, state) {
                        if (state is LoadingSessionsState) {
                          return AppLoadingWidget(paddingTop: .2.sh);
                        }
                        if (state is EmptySessionsState) {
                          return Column(
                            children: [
                              SizedBox(height: .2.sh),
                              Text(
                                'No sessions yet',
                                style: TextStyle(
                                    fontFamily: 'SF Pro',
                                    fontSize: 12.sp,
                                    color: ColorsLimitless.textColor),
                              ),
                            ],
                          );
                        }
                        if (state is ErrorSessionsState) {
                          return Column(
                            children: [
                              SizedBox(height: .2.sh),
                              const Text('Something went wrong'),
                            ],
                          );
                        }
                        if (state is LoadedSessionsState) {
                          return ListView.separated(
                            itemCount: state.loadedSessions.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(
                              top: 12.h,
                              bottom: 32.h,
                            ),
                            separatorBuilder: (_, __) => SizedBox(height: 3.h),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  showSessionInfo(
                                      context, state.loadedSessions[index].id);
                                },
                                child: CalendarItem(
                                    session: state.loadedSessions[index]),
                              );
                            },
                          );
                        }
                        return const Offstage();
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
