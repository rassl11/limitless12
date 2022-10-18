import 'package:avatar_view/avatar_view.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/calendar/session/domain/session.dart';
import 'package:users_creators/src/features/calendar/widgets/session/session_menu.dart';

class ResultSessionCard extends StatelessWidget {
  final bool light;
  final Session session;
  const ResultSessionCard({Key? key, required this.light,required this.session}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: light ? Colors.white : ColorsLimitless.greyDark,
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
              children: [
                AvatarView(
                  radius: 20.r,
                  avatarType: AvatarType.CIRCLE,
                  backgroundColor:
                      light ? ColorsLimitless.greyDark : Colors.white,
                  imagePath: session.userAvatarUrl ?? '',
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
                  '${session.firstName} ${session.lastName}',
                  style: TextStyle(
                      color: light
                          ? ColorsLimitless.greyDark
                          : ColorsLimitless.backgroundColor,
                      fontFamily: "SF Pro",
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                      fontSize: 14.r),
                ),
                const Expanded(child: SizedBox()),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        isDismissible: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        context: context,
                        builder: (_) {
                          return SessionMenu(
                              sessionId: session.id ?? '');
                        },
                      );
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/session/menu.svg',
                      height: 8.h,
                    ))
              ],
            ),
            SizedBox(
              height: 15.r,
            ),
            Text(
              session.name ?? 'no name',
              style: TextStyle(
                  color: light ? ColorsLimitless.greyDark : ColorsLimitless.backgroundColor,
                  fontFamily: "SF Pro",
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0.5,
                  fontSize: 20.r),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                resultWidget('${session.exercises?.length}/${session.exercises?.length}', 'Blocks'),
                SvgPicture.asset(
                  'assets/icons/session/divider.svg',
                  color: ColorsLimitless.greyLight,
                  height: 30.h,
                ),
                resultWidget('${session.trainingDurationSec! ~/ 60}', 'minutes'),
                SvgPicture.asset(
                  'assets/icons/session/divider.svg',
                  color: ColorsLimitless.greyLight,
                  height: 30.h,
                ),
                resultWidget('${session.intensity}/10', 'Intensity'),
                SvgPicture.asset(
                  'assets/icons/session/divider.svg',
                  color: ColorsLimitless.greyLight,
                  height: 30.h,
                ),
                resultWidget('0', 'kg'),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(6.r),
              child: Container(
                padding: EdgeInsets.zero,
                height: 40,
                width: MediaQuery.of(context).size.width * 0.85,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: ColorsLimitless.greyLight),
                    color: light ? Colors.white : ColorsLimitless.greyDark),
                child: Center(
                  child: Text(
                    'Summary'.toUpperCase(),
                    style: TextStyle(
                        color: light ? ColorsLimitless.greyDark : ColorsLimitless.backgroundColor,
                        fontFamily: "Sf",
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.sp),
                  ),
                ),
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget resultWidget(String point, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          point,
          style: TextStyle(
              color: light ? ColorsLimitless.greyDark : ColorsLimitless.backgroundColor,
              fontFamily: "SF Pro",
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              fontSize: 16.r),
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          title,
          style: TextStyle(
              color: ColorsLimitless.greyMedium,
              fontFamily: "SF Pro",
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              fontSize: 12.r),
        ),
      ],
    );
  }
}
