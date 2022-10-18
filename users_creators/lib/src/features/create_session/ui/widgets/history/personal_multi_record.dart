import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:users_creators/src/features/create_session/entity/personal_records.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/history/personal_record_list.dart';

class PersonalMultiRecord extends StatefulWidget {
  const PersonalMultiRecord({Key? key}) : super(key: key);

  @override
  State<PersonalMultiRecord> createState() => _PersonalMultiRecordState();
}

class _PersonalMultiRecordState extends State<PersonalMultiRecord>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: false);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal record',
          style: TextStyle(
            fontFamily: "SF Pro",
            fontSize: 14.sp,
            color: ColorsLimitless.textColor,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(
          height: 8.r,
        ),
        GestureDetector(
            child: AnimatedSize(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                child: _pressed == false
                    ? Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.r, vertical: 14.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rep Maxes',
                              style: TextStyle(
                                fontFamily: "SF Pro",
                                fontSize: 12.sp,
                                color: ColorsLimitless.greyMedium,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(
                              height: 8.r,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    '3 x 12 @ 20 kg',
                                    style: TextStyle(
                                      fontFamily: "SF Pro",
                                      fontSize: 12.sp,
                                      color: ColorsLimitless.greyMedium,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Feb 28, 2022',
                                  style: TextStyle(
                                    fontFamily: "SF Pro",
                                    fontSize: 11.sp,
                                    color: ColorsLimitless.brandColor,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 14.r, vertical: 14.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rep Maxes',
                              style: TextStyle(
                                fontFamily: "SF Pro",
                                fontSize: 12.sp,
                                color: ColorsLimitless.greyMedium,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              ),
                            ),
                            SizedBox(
                              height: 8.r,
                            ),
                            ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: personalRecordsList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 10.r),
                                    child: PersonalRecordList(
                                      index: index,
                                    ),
                                  );
                                }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Hide',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsLimitless.greyLight),
                                ),
                                SizedBox(
                                  width: 5.r,
                                ),
                                SvgPicture.asset(
                                    'assets/icons/create_session/arrow_up.svg')
                              ],
                            )
                          ],
                        ),
                      )),
            onTap: () {
              _pressed == false ? _pressed = true : _pressed = false;
              setState(() {});
            })
      ],
    );
  }
}
