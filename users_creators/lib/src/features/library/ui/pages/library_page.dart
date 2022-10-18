import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/library/bloc/workout_popup/bloc_workout.dart';
import 'package:users_creators/src/features/library/bloc/workout_popup/user_popup_state.dart';
import 'package:users_creators/src/features/library/ui/widgets/calendar/add_to_calendar.dart';
import 'package:users_creators/src/features/library/ui/widgets/tab_bar/tab_bar_view_widget.dart';
import 'package:users_creators/src/features/library/ui/widgets/tab_bar/tab_bar_widget.dart';
import 'package:users_creators/src/features/library/ui/widgets/tab_bar/tab_elements.dart';
import 'package:users_creators/src/features/library/ui/widgets/top_panel_bottom_sheet.dart';
import 'package:users_creators/src/features/library/ui/widgets/top_panel_library.dart';

class LibraryPage extends StatefulWidget {
  final bool isFull;
  const LibraryPage({Key? key, required this.isFull}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  UserWorkoutBloc userWorkoutBloc = UserWorkoutBloc();

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: widget.isFull
          ? MediaQuery.of(context).size.height
          : MediaQuery.of(context).size.height * 0.9,
      child: Stack(children: [
        Column(
          children: [
            widget.isFull
                ? Padding(
                    padding: EdgeInsets.only(
                        left: 15.r,
                        top: MediaQuery.of(context).padding.top,
                        bottom: 5.r),
                    child: const TopPanelLibrary(),
                  )
                : const TopPanelBottomSheet(),
            SizedBox(
              width: double.infinity,
              height: 50.r,
              child: TabBarWidget(
                tabController: _tabController,
                tabs: TabElements.views,
              ),
            ),
            Expanded(
              child: Container(
                  color: ColorsLimitless.backgroundColor,
                  child: TabBarViewWidget(tabController: _tabController)),
            ),
          ],
        ),
        BlocBuilder<UserWorkoutBloc, UserWorkoutState>(
          builder: (_, state) {
            if (state is UserLoadedWorkout) {
              return Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 11.r),
                    child: const Center(child: AddToCalendar()),
                  ));
            }
            if (state is UserLoadingWorkoutState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is UserErrorWorkoutState) {
              return const Center(child: Text('Something went wrong'));
            }
            if (state is UserCloserWorkoutState) {
              return const SizedBox();
            }
            return const SizedBox();
          },
        )
      ]),
    );
  }
}
