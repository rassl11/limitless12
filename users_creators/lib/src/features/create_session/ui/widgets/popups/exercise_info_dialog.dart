import 'dart:ui';

import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/core/constants/validation.dart';
import 'package:users_creators/src/features/video_player/video_player.dart';

showExerciseInfoDialog(
    BuildContext context, String? title, String? youtubeLink, String? description) {
  showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) {
        return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
            child: Center(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: const Color(0xFF142A4B).withOpacity(0.35),
                    child: Center(
                        child: ExerciseDialog(
                            title: title, youtubeLink: youtubeLink, description: description)))));
      });
}

class ExerciseDialog extends StatelessWidget {
  const ExerciseDialog(
      {Key? key, required this.title, required this.description, required this.youtubeLink})
      : super(key: key);

  final String? title;
  final String? description;
  final String? youtubeLink;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: SingleChildScrollView(
        child: AlertDialog(
          insetPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          contentPadding: EdgeInsets.only(top: 7.r, bottom: 3.r),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title ?? 'No title',
                          style: TextStyle(
                              color: ColorsLimitless.greyDark,
                              fontFamily: 'SF Pro',
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      GestureDetector(
                        child: SvgPicture.asset(
                          'assets/icons/workout_popup/close.svg',
                          height: 18.r,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 0.7.sw,
                    child: Text(
                      description ?? 'No description',
                      style: TextStyle(
                          color: const Color(0xFF353945),
                          height: 1.5,
                          fontFamily: 'SF Pro',
                          fontSize: 13.sp,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 20.r,
                  ),
                  GestureDetector(
                      child: IntrinsicHeight(
                        child: SizedBox(
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(7.r),
                                  child: Image.network(youtubeImage(youtubeLink ?? ''))),
                              Align(
                                alignment: Alignment.center,
                                child: SvgPicture.asset('assets/icons/create_session/play.svg'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoApp(
                                    url: youtubeLink ?? '',
                                  )),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
