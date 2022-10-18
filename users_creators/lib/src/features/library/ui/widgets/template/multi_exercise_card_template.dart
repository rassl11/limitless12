import 'dart:ui';

import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/core/constants/validation.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/popups/pre_video.dart';

import '../../../entity/domain/session_model.dart';

class MultiExerciseCardTemplate extends StatelessWidget {
  const MultiExerciseCardTemplate({
    Key? key,
    required this.exercise,
    required this.index,
  }) : super(key: key);
  final int index;
  final List<SessionExerciseModel> exercise;

  Future<void> _showInfo(
      BuildContext context, String name, String image) async {
    return showDialog<void>(
      useSafeArea: false,
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            color: Color(0xFF142A4B59).withOpacity(0.25),
            child: PreVideo(
              name: name,
              image: image,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.r),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 7.r),
            width: 1.sw,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE6E8EC)),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Padding(
                padding: EdgeInsets.only(
                  left: 30.r,
                ),
                child: Column(
                  children: List.generate(exercise.length, (i) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: exercise.length - 1 == i ? 0.r : 10.r),
                      child: Row(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: GestureDetector(
                            child: Image.network(
                              youtubeImage(exercise[i].youtubeLink ?? ''),
                              height: 65.r,
                              width: 65.r,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  child: Text('No photo'),
                                );
                              },
                            ),
                            onTap: () {},
                          ),
                        ),
                        SizedBox(
                          width: 10.r,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${exercise[i].title}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'SF Pro',
                                    fontSize: 16.sp,
                                    color: ColorsLimitless.textColor,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5.r,
                              ),
                              Text(
                                '${exercise[i].sets!.length} x ${exercise[i].sets![0].repeats} @ ${exercise[i].sets![0].weight} kg',
                                style: TextStyle(
                                    fontFamily: 'SF Pro',
                                    color: ColorsLimitless.greyLight,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                'Working Max: ${exercise[i].repMax}',
                                style: TextStyle(
                                    fontFamily: 'SF Pro',
                                    color: ColorsLimitless.greyLight,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ]),
                    );
                  }),
                )),
          ),
          Positioned.fromRelativeRect(
            rect: RelativeRect.fromLTRB(1, 1, 0.73.sw, 1),
            child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFF353945),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7.r),
                        bottomLeft: Radius.circular(7.r))),
                child: Center(
                    child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    exercise.length == 2
                        ? '${index + 1}.Superset'
                        : exercise.length == 3
                            ? '${index + 1} .Triset'
                            : '${index + 1} .Circuit',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF Pro',
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp),
                  ),
                ))),
          ),
        ],
      ),
    );
  }
}
