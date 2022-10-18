import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/library/bloc/session/bloc.dart';
import 'package:users_creators/src/features/library/bloc/session/user_session_state.dart';
import 'package:users_creators/src/features/library/ui/widgets/tabs/exercise_view_widget.dart';

import '../../pages/templates.dart';
import '../calendar/calendar_widget.dart';
import '../coming_soon_widget.dart';

class TabBarViewWidget extends StatefulWidget {
  const TabBarViewWidget({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  State<TabBarViewWidget> createState() => _TabBarViewWidgetState();
}

class _TabBarViewWidgetState extends State<TabBarViewWidget> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(controller: widget._tabController, children: [
      BlocBuilder<UserBloc, UserSessionState>(
        builder: (_, state) {
          if (state is UserLoadedCalendar) {
            return const CalendarWidget();
          }

          if (state is UserLoadingState) {
            return const CircularProgressIndicator();
          }

          if (state is UserLoadedTemplates) {
            return const Templates();
          }

          if (state is UserEmptyState) {
            return const Text('Empty');
          }

          if (state is UserErrorState) {
            return const Text('Error');
          }

          return const CircularProgressIndicator();
        },
      ),
      const ComingSoonWidget(),
      const ComingSoonWidget(),
      const ExerciseViewWidget(
        index: 0,
        swap: false,
        selectable: false,
      ),
    ]);
  }
}
