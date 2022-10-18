import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class PopUpField extends StatefulWidget {
  final String hintText;
  final String title;
  final bool isSmallSize;
  final Function(int?) gender;

  const PopUpField(
      {Key? key,
      required this.hintText,
      required this.title,
      this.isSmallSize = false, required this.gender})
      : super(key: key);

  @override
  State<PopUpField> createState() => _PopUpFieldState();
}

class _PopUpFieldState extends State<PopUpField> {
  String? selectedValue;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'SF Pro',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
            height: 40.h,
            width: widget.isSmallSize
                ? MediaQuery.of(context).size.width * 0.4
                : MediaQuery.of(context).size.width,
            child: Center(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Text(
                      isSelected ? selectedValue! : widget.hintText,
                      style: TextStyle(
                          color: 
                               ColorsLimitless.greyDark,
                          fontFamily: 'SF Pro',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  buttonDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border:
                        Border.all(width: 1, color: ColorsLimitless.greyLight.withOpacity(0.5)),
                  ),
                  buttonHeight: 40.r,
                  buttonWidth: 140.r,
                  items: const [
                    DropdownMenuItem(
                      value: 'Male',
                      child: Text('Male'),
                    ),
                    DropdownMenuItem(
                      value: 'Female',
                      child: Text('Female'),
                    ),
                  ],
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  dropdownElevation: 8,
                  onChanged: (value) {
                    setState(() {
                      isSelected = true;
                      selectedValue = value as String?;
                      widget.gender(value == 'Male' ? 0 : 1);
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
