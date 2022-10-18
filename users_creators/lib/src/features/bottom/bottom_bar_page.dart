import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/core/constants/common.dart';
import 'package:users_creators/src/core/constants/routes.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_event.dart';
import 'package:users_creators/src/features/creator/ui/pages/creator_page.dart';
import 'package:users_creators/src/features/current_creator/current_creator_bloc.dart';
import 'package:users_creators/src/features/current_creator/current_creator_event.dart';
import 'package:users_creators/src/features/current_creator/current_creator_repo.dart';
import 'package:users_creators/src/features/discover/presentation/discover_page.dart';
import 'package:users_creators/src/features/library/ui/pages/library_page.dart';
import 'package:users_creators/src/features/login/repo/login_repo.dart';

import '../calendar/bloc/calendar_bloc.dart';
import '../calendar/calendar_screen.dart';
import '../calendar/session/bloc/session_bloc.dart';
import '../create_session/bloc/exercise_list/exercise_list_bloc.dart';
import '../create_session/bloc/exercise_list/exercise_list_event.dart';
import '../dashboard/creator_dashboadr/pages/creator_dashboard_page.dart';
import '../dashboard/user_dashboard/user_dashboard_page.dart';
import '../discover/bloc/discover_bloc.dart';
import '../library/bloc/my_sessions/my_sessions_bloc.dart';
import '../library/bloc/my_sessions/my_sessions_event.dart';
import 'widgets/bottom_bar.dart';

class BottomBarPage extends StatefulWidget {
  final int initialIndex;

  const BottomBarPage({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  PageController? _pageController;
  int? selectedPage;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  final loginRepo = LoginRepo();
  final currentCreatorRepository = CurrentCreatorRepository();

  final enteredPages = <int>[];

  List<Widget> getTabs() {
    context.read<CurrentCreatorBloc>().add((FetchCurrentCreatorEvent()));
    if (loginRepo.getAuthData()?.role == UserRole.creator) {
      var currentCreator = currentCreatorRepository.getCurrentCreator();
      if (currentCreator != null) {
        context.read<CreatorProfileBloc>().add(CurrentCreatorProfileLoadEvent(currentCreator.id!));
      }
      return [
        const CalendarScreen(),
        Container(),
        const CreatorPage(),
        const LibraryPage(
          isFull: true,
        ),
        const CreatorDashboard()
      ];
    }
    if (loginRepo.getAuthData()!.role == UserRole.user) {
      var currentCreator = currentCreatorRepository.getCurrentCreator();
      if (currentCreator == null) {
        return [
          const CalendarScreen(),
          Container(),
          const DiscoverPage(showBackButton: false),
          const LibraryPage(
            isFull: true,
          ),
          const UserDashboard()
        ];
      } else {
        context.read<CreatorProfileBloc>().add(CurrentCreatorProfileLoadEvent(currentCreator.id!));
        return [
          const CalendarScreen(),
          Container(),
          const CreatorPage(),
          const LibraryPage(
            isFull: true,
          ),
          const UserDashboard()
        ];
      }
    }

    return [];
  }

  @override
  void initState() {
    if (LoginRepo().getAuthData() == null) {
      context.router.pushNamed(Routes.userLoginRoot);
    }
    selectedPage = widget.initialIndex;
    _pageController = PageController(initialPage: selectedPage!);
    loadPagesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ColorsLimitless.backgroundColor,
        key: _globalKey,
        bottomNavigationBar:
            BottomBarWidget(controller: _pageController!, initialPage: selectedPage!),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            setState(() => selectedPage = value);
            loadPagesData();
          },
          children: getTabs(),
        ),
      ),
    );
  }

  void loadPagesData() {
    final isNotContains = !enteredPages.contains(selectedPage);
    if (isNotContains && selectedPage == 0) {
      BlocProvider.of<CalendarBloc>(context).add(
        CalendarEvent.selectDay(
          day: DateTime.now().day,
          year: DateTime.now().year,
          month: DateTime.now().month,
        ),
      );
      BlocProvider.of<SessionBloc>(context).add(
        SessionEvent.getSessions(date: DateTime.now()),
      );
    } else if (isNotContains && selectedPage == 2) {
      BlocProvider.of<DiscoverBloc>(context).add(const DiscoverEvent.initial());
    } else if (isNotContains && selectedPage == 3) {
      context.read<MySessionsTemplatesBloc>().add(LoadSessionTemplatesEvent());
      context.read<MySessionsCalendarBloc>().add(LoadSessionCalendarEvent());
      context.read<ExerciseListBloc>().add(ExerciseLoadEvent());
    }

    if (isNotContains) {
      enteredPages.add(selectedPage!);
    }
  }
}
