import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CalendarTextField extends StatefulWidget {
  final String hintText;
  final String title;
  final bool isSmallSize;
  final bool isCalendar;
  final Function(String?) select;
  final TextEditingController textEditingController;
  const CalendarTextField(
      {Key? key,
      required this.hintText,
      required this.title,
      this.isSmallSize = false,
      this.isCalendar = false,
      required this.select, required this.textEditingController})
      : super(key: key);

  @override
  State<CalendarTextField> createState() => _CalendarTextFieldState();
}

class _CalendarTextFieldState extends State<CalendarTextField> {
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        widget.title,
        style: TextStyle(
            color: ColorsLimitless.greyDark,
            fontFamily: 'SF Pro',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500),
      ),
      SizedBox(
        height: 10.h,
      ),
      SizedBox(
        height: 40.r,
        width: widget.isSmallSize
            ? MediaQuery.of(context).size.width * 0.4
            : MediaQuery.of(context).size.width,
        child: TextField(
          onTap: () {
            _selectDate(context);
          },
          controller: widget.textEditingController,
          enabled: true,
          focusNode: AlwaysDisabledFocusNode(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10.0),
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: ColorsLimitless.greyLight,
                fontFamily: 'SF Pro',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            hintMaxLines: 1,
            fillColor: Colors.transparent,
            labelStyle: TextStyle(
                fontFamily: 'SF Pro',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            enabledBorder:  OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              borderSide:
                  BorderSide(width: 1, color: ColorsLimitless.greyLight.withOpacity(0.5)),
            ),
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                    width: 1,
                    color: ColorsLimitless.greyLight.withOpacity(0.5))),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.red)),
          ),
        ),
      ),
    ]);
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        locale: Locale('en'),
        context: context,
        initialDate: _selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark(),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      widget.textEditingController
        ..text = DateFormat('dd/MM/yyyy').format(_selectedDate!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: widget.textEditingController.text.length,
            affinity: TextAffinity.upstream));
      widget.select(newSelectedDate.toIso8601String());
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
