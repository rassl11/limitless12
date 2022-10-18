import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagsList extends StatelessWidget {
  final List<String> tags;
  final String? selectedTag;
  final Function(String) onTap;

  const TagsList({
    Key? key,
    required this.tags,
    this.selectedTag,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: tags.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final answer = tags[index];
        final isActive = selectedTag != null && selectedTag == answer;

        return Material(
          borderRadius: BorderRadius.circular(6.r),
          elevation: 0.0,
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(6.r),
            splashFactory: InkRipple.splashFactory,
            onTap: () => onTap(answer),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: Colors.transparent,
                border: Border.all(
                  color: isActive
                      ? const Color(0xFFE94359)
                      : const Color(0xFFE6E8EC),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Center(
                child: Text(
                  answer,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorsLimitless.greyDark,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
