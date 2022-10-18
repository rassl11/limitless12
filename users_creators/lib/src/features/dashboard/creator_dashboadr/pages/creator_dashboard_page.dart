import 'package:components/common_widgets/progress.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/dashboard/bloc/get_session_range/get_session_range_bloc.dart';
import 'package:users_creators/src/features/dashboard/bloc/get_session_range/get_session_range_event.dart';
import 'package:users_creators/src/features/dashboard/bloc/get_session_range/get_session_range_state.dart';
import 'package:users_creators/src/features/dashboard/common_widgets/hours_card.dart';
import 'package:users_creators/src/features/dashboard/common_widgets/period_of_sessions.dart';
import 'package:users_creators/src/features/dashboard/common_widgets/reps_card.dart';
import 'package:users_creators/src/features/dashboard/common_widgets/total_session.dart';
import 'package:users_creators/src/features/dashboard/common_widgets/user_app_bar.dart';
import 'package:users_creators/src/features/dashboard/common_widgets/volume_card.dart';
import 'package:users_creators/src/features/dashboard/creator_dashboadr/widgets/creator_tab_bar.dart';

class CreatorDashboard extends StatefulWidget {
  const CreatorDashboard({Key? key}) : super(key: key);

  @override
  State<CreatorDashboard> createState() => _CreatorDashboardState();
}

class _CreatorDashboardState extends State<CreatorDashboard> {
  final int lastTenSession = 0;

  @override
  void initState() {
    context.read<GetSessionRangeBloc>().add(GotSessionRangeEvent(requestDate: 'Last 10 days', requestRange: lastTenSession));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsLimitless.backgroundColor,
        body: BlocBuilder<GetSessionRangeBloc, GetSessionRangeState>(
          builder: (context, state) {
            if (state is LoadingGetSessionRangeState) {
              return const AppLoadingWidget();
            }
            if (state is GotSessionRangeState) {
              return SafeArea(
                child: Column(children: [
                  const CreatorTabBar(),
                  SizedBox(height: 20.h,),
                  UserAppBar(),
                  Expanded(
                    child: RefreshIndicator(
                        color: ColorsLimitless.brandColor,
                        onRefresh: () async {
                        context.read<GetSessionRangeBloc>().add(GotSessionRangeEvent(requestRange: GetSessionRangeEvent.lastRequestRange));
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20.r,
                              ),
                              PeriodOfSessions(
                                range: state,
                              ),
                              SizedBox(
                                height: 20.r,
                              ),
                              TotalSession(
                                rangeState: state,
                              ),
                              SizedBox(
                                height: 20.r,
                              ),
                               VolumeCard(
                                 volume: state,
                               ),
                              SizedBox(
                                height: 10.r,
                              ),
                               RepsCard(
                                 reps: state,
                               ),
                              SizedBox(
                                height: 10.r,
                              ),
                               HoursCard(
                                 hours: state,
                               ),
                              SizedBox(
                                height: 30.r,
                              ),
                            ],
                          ),
                        )),
                  )
                ]),
              );
            }
            if (state is ErrorGetSessionRangeState) {
              return const Center(
                child: Text('Error'),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
