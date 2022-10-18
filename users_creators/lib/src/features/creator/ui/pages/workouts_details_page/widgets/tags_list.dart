import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagsScrollList extends StatelessWidget {
  const TagsScrollList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 72.w,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(65.r),
              border: Border.all(
                color: const Color(0xffE94359),
              ),
            ),
            child: Center(
              child: Text(
                '#Barbell$index',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontSize: 11.sp,
                  color: const Color(0xffE94359),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
