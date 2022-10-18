import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/core/view_models/set_view_model.dart';

// ignore: must_be_immutable
class SetTextField extends StatefulWidget {
  const SetTextField({Key? key, required this.set, required this.setIndex, required this.field})
      : super(key: key);

  final SetViewModel set;
  final int setIndex;
  final String field;

  String getInitialValue() {
    switch (field) {
      case 'repeats':
        return set.repeats.toString();
      case 'weight':
        return set.weight.toString();
    }

    return '';
  }

  @override
  State<SetTextField> createState() => SetTextFieldState();
}

class SetTextFieldState extends State<SetTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.r,
      width: 75.r,
      child: TextFormField(
        onChanged: (value) {
          switch (widget.field) {
            case 'repeats':
              widget.set.repeats = value;
              break;
            case 'weight':
              widget.set.weight = int.parse(value);
              break;
          }
        },
        initialValue: widget.getInitialValue(),
        style: TextStyle(
            fontSize: 12.sp,
            fontFamily: "SF Pro",
            fontWeight: FontWeight.w400,
            color: ColorsLimitless.textColor),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        autofocus: false,
        cursorColor: ColorsLimitless.textColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 1.r),
          filled: true,
          hintText: '',
          hintStyle: TextStyle(
              color: ColorsLimitless.textColor,
              fontFamily: 'SF Pro',
              fontSize: 11.sp,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w400),
          hintMaxLines: 1,
          fillColor: Colors.white,
          labelStyle: TextStyle(fontFamily: 'SF Pro', fontSize: 11.sp, fontWeight: FontWeight.w400),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Color(0xFFE6E8EC)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Color(0xFFE6E8EC)),
          ),
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: ColorsLimitless.greyLight.withOpacity(0.3))),
        ),
      ),
    );
  }
}
