import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/dashboard/bloc/get_session_range/get_session_range_state.dart';
import 'package:users_creators/src/features/dashboard/common_widgets/volume_bar_chart.dart';

class VolumeCard extends StatelessWidget {
  const VolumeCard({Key? key, required this.volume}) : super(key: key);
  final GotSessionRangeState volume;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.r, vertical: 24.r),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    'Volume (kg)',
                    style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 16.sp,
                        color: ColorsLimitless.greyMedium,
                        fontWeight: FontWeight.w700),
                  ),
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    width: 50.r,
                    child: Text(
                      'Highest',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 12.sp,
                          color: ColorsLimitless.greyMedium,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    width: 60.r,
                    child: Text(
                      '${volume.getVolume.highest} kg',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 12.sp,
                          color: ColorsLimitless.textColor,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 6.r,
              ),
              Row(
                children: [
                  Text(
                    '${volume.getVolume.sum} kg',
                    style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontSize: 16.sp,
                        color: ColorsLimitless.textColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    width: 50.r,
                    child: Text('Last',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontSize: 12.sp,
                            color: ColorsLimitless.greyMedium,
                            fontWeight: FontWeight.w400)),
                  ),
                  SizedBox(
                    width: 60.r,
                    child: Text(
                      '${volume.getVolume.last} kg',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontSize: 12.sp,
                          color: ColorsLimitless.textColor,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.r,
              ),
              VolumeBarChards(
                volume: volume.getVolume.weightsData ?? [],
              )
            ])));
  }
}
