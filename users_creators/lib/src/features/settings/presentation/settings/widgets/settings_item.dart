import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../profile/presentation/widgets/bottom_sheet_pick_content.dart';
import 'terms_privacy_bottom_sheet.dart';

class SettingsItem extends StatefulWidget {
  final String image;
  final String title;
  final bool showPicker;
  final bool hasSwitch;
  final bool hasModalBottomSheet;
  final Function()? onTap;
  final List<String> pickerItems;
  Function(String?)? select;
  String? initialValue;
  final Color titleColor;

   SettingsItem({
    Key? key,
    required this.image,
    required this.title,
    this.showPicker = false,
    this.pickerItems = const [],
    this.hasSwitch = false,
    this.onTap,
    this.hasModalBottomSheet = false, 
    this.select,
    this.initialValue,
     this.titleColor = Colors.black
  }) : super(key: key);

  @override
  State<SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  String initialValue = '';
  bool switchValue = false;

 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.r,vertical: 8.r),
      child: InkWell(
        onTap: widget.hasModalBottomSheet ? (){
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            context: context,
            builder: (_) {
              return TermsPrivacyBottomSheet(title: widget.title);
            },
          );
        } : null,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 3.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    widget.image,
                    color: ColorsLimitless.brandColor,
                    height: 16.r,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: widget.titleColor,
                        fontFamily: 'SF Pro',
                        letterSpacing: 0.5,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              if (widget.showPicker)
                InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        context: context,
                        builder: (_) {
                          return BottomSheetPickContent(
                            pickerItems: widget.pickerItems,
                            onSelect: (value) {
                              setState(() {
                                initialValue = value;
                                widget.select!(value) ?? (){};
                              });
                            },
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 30.r,
                      width: 90.r,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: ColorsLimitless.greyLight.withOpacity(0.4))),
                      child: Center(
                          child: Text(initialValue.isEmpty ? widget.initialValue! : initialValue,
                          style: TextStyle(
                            fontFamily: "SF Pro",
                            fontSize: 12.sp,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w700
                          ),
                          )),
                    ))
              else if (widget.hasSwitch)
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    value: switchValue,
                    onChanged: (bool value) {
                      setState(() {
                        switchValue = !switchValue;
                      });
                    },
                  ),
                )
              else
                const Offstage()
            ],
          ),
        ),
      ),
    );
  }
}
