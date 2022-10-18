import 'package:components/theme/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:users_creators/src/features/create_session/bloc/create_exercise/create_exercise_state.dart';
import 'package:users_creators/src/features/create_session/entity/domain/get_exercise.dart';

class DropDown extends StatefulWidget {
  DropDown({
    Key? key,
    required this.selectedValue,
    required this.items,
    required this.updateValue,
    required this.index,
  }) : super(key: key);
  String? selectedValue;
  final List items;
  final int index;
  final Function(String value) updateValue;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Text(widget.selectedValue ?? ""),
          items: widget.items
              .map((item) => DropdownMenuItem<String>(
                    value: item.id,
                    child: Text(
                      item.name!,
                      style: TextStyle(
                        fontSize: 13.r,
                        fontFamily: 'SF Pro',
                        letterSpacing: 0.5,
                        color: ColorsLimitless.textColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: widget.selectedValue,
          onChanged: (value) {
            widget.updateValue(value as String);
            if (widget.index == 0) {

              CreateExerciseState.typeOfExercise = value as String;
            } else if (widget.index == 1) {
              CreateExerciseState.equipmentUsed = value as String;
            } else if (widget.index == 2) {
              CreateExerciseState.primaryMuscleGroup = value as String;
            } else if (widget.index == 3) {
              CreateExerciseState.otherMuscles = value as String;
            }
            setState(() {});
            widget.selectedValue = value as String;
          },
          icon: SvgPicture.asset('assets/icons/create_session/arrow_down.svg'),
          iconSize: 24.r,
          buttonHeight: 40.r,
          buttonWidth: 160.r,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border:
                Border.all(color: ColorsLimitless.greyLight.withOpacity(0.3)),
            color: Colors.white,
          ),
          itemHeight: 35.r,
          itemPadding: EdgeInsets.only(left: 12.r, right: 12.r),
          dropdownMaxHeight: 160.r,
          dropdownWidth: 200,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
          ),
          scrollbarRadius: const Radius.circular(20),
          scrollbarThickness: 0,
          scrollbarAlwaysShow: true,
          offset: const Offset(160, -5),
        ),
      ),
    );
  }
}
