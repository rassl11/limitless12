import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CloseIcon extends StatelessWidget {
  const CloseIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: icon position not correct
    return Positioned(
      top: 23.r,
      right: 24.r,
      child: GestureDetector(
        child: SvgPicture.asset(
          'assets/icons/workout_popup/close.svg',
          height: 19.r,
        ),
        onTap: () => Navigator.pop(context),
      ),
    );
  }
}
