import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:users_creators/src/features/calendar/bloc/calendar_bloc.dart';
import 'package:users_creators/src/features/calendar/session/bloc/session_bloc.dart';
import 'package:users_creators/src/features/calendar/widgets/floating_action_button.dart';
import 'package:users_creators/src/features/calendar/widgets/session/no_session_widget.dart';
import 'package:users_creators/src/features/calendar/widgets/session/session_view.dart';
import 'package:users_creators/src/features/calendar/widgets/weekly_calendar/calendar_header.dart';
import 'package:users_creators/src/features/calendar/widgets/weekly_calendar/weekly_calendar.dart';

import '../discover/presentation/discover_content.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(builder: (context, state) {
      return state.map(
        loaded: (value) {
          return Scaffold(
              backgroundColor: Colors.white,
              floatingActionButton: const FloatingAction(),
              body: Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: SafeArea(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: ColorsLimitless.backgroundColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CalendarHeader(onTap: () {
                            BlocProvider.of<CalendarBloc>(context).add((CalendarEvent.selectDay(
                                day: DateTime.now().day,
                                month: DateTime.now().month,
                                year: DateTime.now().year)));
                            BlocProvider.of<SessionBloc>(context)
                                .add(SessionEvent.getSessions(date: DateTime.now()));
                          }),
                          WeeklyCalendar(
                            itemScrollController: value.itemScrollController,
                            initialScrollIndex: value.selectedDay - 4,
                          ),
                        
                          BlocBuilder<SessionBloc, SessionState>(builder: (context, session) {
                            return session.map(notSubscribed: (value) {
                              return const Expanded(
                                  child: DiscoverContent(
                                showHeader: false,
                                showBackButton: false,
                              ));
                            }, haveNoSession: (value) {
                              return const NoSessionWidget();
                            }, haveSession: (value) {
                              return Expanded(
                                child: Column(
                                  children: [
                                  
                                    Expanded(
                                      child: SessionView(
                                        sessions: value.sessions,
                                        pageController: controller,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }, loading: (value) {
                              return SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.6,
                                  child: const Center(
                                      child: CircularProgressIndicator(
                                    color: ColorsLimitless.brandColor,
                                  )));
                            });
                          })
                        ],
                      ),
                    ),
                  )));
        },
        loading: (value) {
          return const AppLoadingWidget();
        },
      );
    });
  }
}
