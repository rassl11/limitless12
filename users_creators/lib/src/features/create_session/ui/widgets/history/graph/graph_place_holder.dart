import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/history/graph/place_holder_graph.dart';
import 'package:users_creators/src/features/dashboard/common_widgets/sepatator.dart';

class GraphPlaceHolder extends StatelessWidget {
  const GraphPlaceHolder({Key? key}) : super(key: key);

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
            padding: EdgeInsets.symmetric(horizontal: 30.r, vertical: 8.r),
            width: 1.sw,
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
                              padding: EdgeInsets.symmetric(vertical: 23.r),
                              child: const MySeparator(
                                color: ColorsLimitless.greyLight,
                              ),
                            ))),
                Positioned(
                  bottom: 24.r,
                  child: CustomPaint(
                    size: Size(
                        1.sw,
                        (370.r * 0.6181818181818182)
                            .toDouble()), 
                    painter: GraphCustomPaint(),
                  ),
                ),
                Positioned(
                  bottom: 33.r,
                  left: 80.r,
                  child: Text(
                    'log more to see this trend',
                    style: TextStyle(
                        fontFamily: "SF Pro",
                        fontSize: 9.sp,
                        color: ColorsLimitless.greyLight,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
