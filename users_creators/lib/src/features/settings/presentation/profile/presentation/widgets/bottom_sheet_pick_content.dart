import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetPickContent extends StatelessWidget{
  final List<String> pickerItems;
  final Function(String) onSelect;

  const BottomSheetPickContent({Key? key, required this.pickerItems, required this.onSelect}) : super(key: key);

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
          height: 6.r,
        ),
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: pickerItems.length,
            itemBuilder: (_, i) => ListTile(
              title: Text(
                pickerItems[i],
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SF Pro',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.pop(context);
                onSelect(pickerItems[i]);
              },
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }

}