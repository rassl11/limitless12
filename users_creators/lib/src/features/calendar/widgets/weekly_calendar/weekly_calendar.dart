import 'package:components/common_widgets/progress.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/calendar/bloc/calendar_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:users_creators/src/features/calendar/session/bloc/session_bloc.dart';

import 'day_list_item.dart';

class WeeklyCalendar extends StatefulWidget {
  const WeeklyCalendar({
    Key? key,
    required this.itemScrollController,
    required this.initialScrollIndex,
  }) : super(key: key);
  final ItemScrollController itemScrollController;
  final int initialScrollIndex;

  @override
  State<WeeklyCalendar> createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends State<WeeklyCalendar> {

  

      late ItemPositionsListener itemPositionsListener;
      late ItemScrollController itemScrollController;

      @override
  void initState() {
    itemScrollController = ItemScrollController();
    itemPositionsListener = ItemPositionsListener.create();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(builder: (context, state) {
      return state.map(loaded: (loaded) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 90,
              
              color: Colors.white,
              child: ScrollablePositionedList.builder(
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                initialScrollIndex: widget.initialScrollIndex < 4
                    ? 0
                    : widget.initialScrollIndex,
                scrollDirection: Axis.horizontal,
                itemCount: loaded.monthDays,
                itemBuilder: (context, index) {
                  final date = DateTime(
                      DateTime.now().year, DateTime.now().month, index + 1);
                  final dateName = DateFormat.E('en').format(date);

                  final sessionIndex = loaded.sessions.indexWhere((element) =>
                      DateTime.parse(element.date!).day == index + 1);

                  return ItemList(
                    weekDay: dateName,
                    day: "${index + 1}",
                    isSelected: index + 1 == loaded.selectedDay,
                    onTap: () {
                      BlocProvider.of<CalendarBloc>(context).add(
                          (CalendarEvent.selectDay(
                              day: index + 1,
                              month: DateTime.now().month,
                              year: DateTime.now().year)));

                      BlocProvider.of<SessionBloc>(context).add(
                          SessionEvent.getSessions(
                              date: DateTime(DateTime.now().year,
                                  DateTime.now().month, index + 1)));
                    },
                    mySessionsCount: sessionIndex == -1
                        ? 0
                        : loaded.sessions[sessionIndex].mySessionsCount! >= 3 ? 3 : loaded.sessions[sessionIndex].mySessionsCount!,
                    creatorSessionsCount: sessionIndex == -1
                        ? 0
                        : loaded.sessions[sessionIndex].creatorSessionsCount! >= 3 ? 3 
                        : loaded.sessions[sessionIndex].creatorSessionsCount!,
                  );
                },
              ),
            ),
            Container(
              height: 20,
              color: Colors.white,
            )
          ],
        );
      }, loading: (value) {
        return const AppLoadingWidget();
      });
    });
  }
}
