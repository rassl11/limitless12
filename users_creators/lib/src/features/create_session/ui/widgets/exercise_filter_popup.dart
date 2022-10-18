import 'package:auto_route/auto_route.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/exercise_filter_item.dart';
import 'package:users_creators/src/features/discover/domain/tag.dart';

class ExerciseFilterPopUp extends StatefulWidget {
  const ExerciseFilterPopUp({Key? key}) : super(key: key);

  @override
  State<ExerciseFilterPopUp> createState() => _ExerciseFilterPopUpState();
}

class _ExerciseFilterPopUpState extends State<ExerciseFilterPopUp> {
  List<int> selectedValues = [];
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          SvgPicture.asset(
            'assets/icons/settings/divider.svg',
            color: ColorsLimitless.greyLight.withOpacity(0.4),
            height: 5.5.r,
          ),
          SizedBox(
            height: 10.r,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      context.router.pop();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: ColorsLimitless.greyMedium,
                          fontFamily: 'SF Pro',
                          fontSize: 13.sp,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w500),
                    )),
                TextButton(
                    onPressed: () {
                      context.router.pop();
                    },
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                          color: ColorsLimitless.brandColor,
                          fontFamily: 'SF Pro',
                          letterSpacing: 0.5,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10.r,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15.r),
            child: SafeArea(
                child: SizedBox(
                    child: Wrap(
                        spacing: 14.r,
                        runSpacing: 10.r,
                        children: List.generate(
                            tag.length,
                            (index) =>
                                // Text('$index - adsadasdasdd')
                                ExerciseFilterItem(
                                  isSelected: selectedValues.contains(index),
                                  onTap: () {
                                    setState(() {
                                      selectedValues.contains(index)
                                          ? selectedValues.remove(index)
                                          : selectedValues.add(index);
                                    });
                                  },
                                  title: tag[index].tag,
                                ))))),
          )
        ]);
  }

  final List tag = [
    Tag(tag: 'Cardio', isSelected: false),
    Tag(tag: 'Olympic Weightlifting', isSelected: false),
    Tag(tag: 'Plyometrics', isSelected: false),
    Tag(tag: 'Stretching', isSelected: false),
    Tag(tag: 'Powerlifting', isSelected: false),
    Tag(tag: 'Strength', isSelected: false),
    Tag(tag: 'Strongman', isSelected: false),
    Tag(tag: 'Compound', isSelected: false),
    Tag(tag: 'Isolation', isSelected: false),
    Tag(tag: 'Diagnostics', isSelected: false),
    Tag(tag: 'Recent', isSelected: false),
  ];
}
