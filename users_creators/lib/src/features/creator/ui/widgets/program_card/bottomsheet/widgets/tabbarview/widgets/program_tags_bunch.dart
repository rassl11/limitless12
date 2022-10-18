import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgramTagsBunch extends StatelessWidget {
  const ProgramTagsBunch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.w,
      runSpacing: 10.w,
      children: const [
        _TagItem(tagName: '#lean muscle'),
        _TagItem(tagName: '#toning'),
        _TagItem(tagName: '#functional'),
        _TagItem(tagName: '#gym'),
        _TagItem(tagName: '#shred fat'),
        _TagItem(tagName: '#athletic'),
      ],
    );
  }
}

class _TagItem extends StatelessWidget {
  final String tagName;

  const _TagItem({
    Key? key,
    required this.tagName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(65.r),
        border: Border.all(
          color: const Color(0xff777E90),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 4.w,
        ),
        child: Text(
          tagName,
          style: TextStyle(
            fontFamily: 'SF Pro',
            fontSize: 14.sp,
            color: const Color(0xff777E90),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
