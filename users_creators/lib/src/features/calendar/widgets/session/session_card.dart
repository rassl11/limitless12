import 'package:auto_route/auto_route.dart';
import 'package:avatar_view/avatar_view.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/calendar/session/domain/set.dart';
import 'package:users_creators/src/features/calendar/widgets/session/session_menu.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_event.dart';
import 'package:users_creators/src/features/training_session/bloc/timer_for_session/session_timer_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/timer_for_session/session_timer_event.dart';
import '../../../../core/ads/interstitial_ad.dart';
import '../../../training_session/bloc/get_session/get_training_session_state.dart';
import '../../session/domain/session.dart';

class SessionCard extends StatefulWidget {
  final Session session;

  const SessionCard({
    Key? key,
    required this.session,
  }) : super(key: key);

  @override
  State<SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends State<SessionCard> {
  String getSetsLength() {
    List<Set> sets = [];
    for (var element in widget.session.exercises!) {
      for (var set in element.sets!) {
        sets.add(set);
      }
    }
    return sets.length.toString();
  }

  @override
  void initState() {
    InterstitialAds().createInterstitialAd();
    super.initState();
  }

  @override
  void dispose() {
    InterstitialAds().interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: ColorsLimitless.greyLight.withOpacity(0.8),
            blurRadius: 5.0,
            spreadRadius: 0.0,
            offset: const Offset(4.0, 4.0),
          )
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.r),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/images/calendar/pattern.png',
                height: 75.r,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                
              Row(
                children: [
                  AvatarView(
                    radius: 20.r,
                    avatarType: AvatarType.CIRCLE,
                    backgroundColor: ColorsLimitless.greyDark,
                    imagePath: widget.session.userAvatarUrl ?? '',
                    placeHolder: Icon(
                      Icons.person,
                      size: 20.r,
                    ),
                    errorWidget: Icon(
                      Icons.error,
                      size: 20.r,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    '${widget.session.firstName} ${widget.session.lastName}',
                    style: TextStyle(
                        color: ColorsLimitless.textColor,
                        fontFamily: "SF Pro",
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                        fontSize: 16.r),
                  ),
                  const Expanded(child: SizedBox()),
                   Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      isDismissible: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      context: context,
                      builder: (_) {
                        return SessionMenu(sessionId: widget.session.id ?? '');
                      },
                    );
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/session/menu.svg',
                    height: 7.h,
                  )),
            ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.session.name!,
                      style: TextStyle(
                          color: ColorsLimitless.textColor,
                          fontFamily: "SF Pro",
                          fontWeight: FontWeight.w800,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 0.5,
                          fontSize: 22.r),
                    ),
                    
                  ),
                  
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.session.exercises!.length} Exercises',
                        style: TextStyle(
                            color: ColorsLimitless.greyDark,
                            fontFamily: "SF Pro",
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                            fontSize: 11.r),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        '${getSetsLength()} Sets',
                        style: TextStyle(
                            color: ColorsLimitless.greyDark,
                            fontFamily: "SF Pro",
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                            fontSize: 11.r),
                      ),
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  InkWell(
                    borderRadius: BorderRadius.circular(6.r),
                    splashFactory: InkRipple.splashFactory,
                    splashColor: ColorsLimitless.backgroundColor,
                    child: Container(
                      padding: EdgeInsets.zero,
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: ColorsLimitless.brandColor),
                      child: Center(
                        child: Text(
                          'Start'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "SF Pro",
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w800,
                              fontSize: 14.sp),
                        ),
                      ),
                    ),
                    onTap: () {
                      InterstitialAds().showInterstitialAd();
                      TrainingSessionExerciseState.sessionId =
                          widget.session.id!;
                      context
                          .read<GetTrainingSessionBloc>()
                          .add(TrainingSessionLoadEvent());
                      context.router
                          .pushNamed('/start-training-session-page');
                      context
                          .read<SessionTimerBloc>()
                          .add(StartSessionTimerEvent());
                    },
                  )
                ],
              ),
            ],
          ),
        
          
        ],
      ),
    );
  }
}
