import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/history/graph/place_holder_graph.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/history/graph/real_graph.dart';
import 'package:users_creators/src/features/dashboard/common_widgets/sepatator.dart';

class Graph extends StatelessWidget {
  Graph({Key? key}) : super(key: key);

  final List<String> date = [
    '7 Mar',
    '8 Mar',
    '9 Mar',
    '10 Mar',
    '11 Mar',
  ];

  final List<int> weight = [18, 16, 14, 12, 10];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Estimated 1-rep max',
          style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 14.sp,
              color: ColorsLimitless.textColor,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 14.r,
        ),
        Container(
          height: 250.r,
            width: 1.sw,
            padding: EdgeInsets.only(top: 5.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Stack(
              children: [
                Column(
                    children: List.generate(
                        5,
                        (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 22.r, horizontal: 30.r),
                              child: const MySeparator(
                                color: ColorsLimitless.greyLight,
                              ),
                            ))),
                Positioned(
                    bottom: 60.r,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.r),
                      child: CustomPaint(
                        size: Size(
                            0.8.sw, (1.sw * 0.4223826714801444).toDouble()),
                        painter: RealGraphHistory(),
                      ),
                    )),
                Positioned(
                  bottom: 12.r,
                  left: 10.r,
                  child: Row(
                    children: List.generate(
                        date.length,
                        (index) => Padding(
                              padding: EdgeInsets.only(left: 25.r),
                              child: Text(
                                date[index],
                                style: TextStyle(
                                    fontFamily: "SF Pro",
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500,
                                    color: ColorsLimitless.textColor,
                                    letterSpacing: 0.5),
                              ),
                            )),
                  ),
                ),
                Positioned(
                  bottom: 5.r,
                  left: 5.r,
                  child: Column(
                    children: List.generate(
                        weight.length,
                        (index) => Padding(
                              padding: EdgeInsets.only(bottom: 34.r),
                              child: Text(
                                '${weight[index]}',
                                style: TextStyle(
                                    fontFamily: "SF Pro",
                                    fontSize: 9.sp,
                                    color: ColorsLimitless.greyLight,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                  ),
                )
              ],
            )),
            
      ],
    );
  }
}
