import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../training_session/ui/widgets/timer.dart';
import '../widgets/sessions.dart';
import '../widgets/template/template_widget.dart';

class Templates extends StatelessWidget {
  const Templates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF4F5F6),
      child: Padding(
        padding: EdgeInsets.only(left: 14.r, right: 14.r, top: 14.r),
        child: Column(
          children: [
            const Sessions(),
            InkWell(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: ColorsLimitless.brandColor),
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: EdgeInsets.all(10.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/create_session/add.svg',
                          color: ColorsLimitless.brandColor,
                          height: 13.r,
                        ),
                        SizedBox(
                          width: 7.r,
                        ),
                        Text(
                          'Create Session Template',
                          style: TextStyle(
                              color: ColorsLimitless.brandColor,
                              fontFamily: 'SF Pro',
                              fontSize: 13.sp,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                
                context.router.navigateNamed('/main-flow');
              },
            ),
            const Expanded(
              child: Template(),
            )
          ],
        ),
      ),
    );
  }
}
