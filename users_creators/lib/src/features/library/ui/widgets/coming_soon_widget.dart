import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComingSoonWidget extends StatelessWidget{
  const ComingSoonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
        Image.asset(
          'assets/images/library/coming_soon.png',
          fit: BoxFit.fill,
        ),
        Center(
          child: Text(
            'COMING SOON',
            style: TextStyle(
                fontSize: 24.sp,
                color: const Color(0xFFB1B5C3),
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic),
          ),
        ),
      ]);
  }

}