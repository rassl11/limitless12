import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showSessionDatePicker(BuildContext context, Function(DateTime) onSave) {
  DateTime selectedDate = DateTime.now();

  showCupertinoModalPopup(
    context: context,
    builder: (_) {
      return Container(
        height: 260,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            SvgPicture.asset(
              'assets/icons/settings/divider.svg',
              color: ColorsLimitless.backgroundColor,
              height: 6,
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            color: ColorsLimitless.greyMedium,
                            fontFamily: 'SF Pro',
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )),
                  const Expanded(child: SizedBox()),
                  TextButton(
                      onPressed: () {
                        onSave.call(selectedDate);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Select',
                        style: TextStyle(
                            color: ColorsLimitless.brandColor,
                            fontFamily: 'SF Pro',
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 180,
              child: CupertinoDatePicker(
                  use24hFormat: true,
                  initialDateTime: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (date) {
                    selectedDate = date;
                  }),
            ),
          ],
        ),
      );
    },
  );
}
