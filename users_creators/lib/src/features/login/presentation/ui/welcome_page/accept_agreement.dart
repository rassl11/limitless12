import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Agreement extends StatefulWidget {
  final Function onTap;
  final bool accepted;
  const Agreement({
    Key? key, required this.onTap, required this.accepted,
  }) : super(key: key);

  @override
  State<Agreement> createState() => _AgreementState();
}

class _AgreementState extends State<Agreement> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: widget.accepted == false
                ? Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(color: Color(0xFFB1B5C3)),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(1.3.r),
                      child: Icon(
                        Icons.done,
                        size: 15.r,
                        color: Colors.white,
                      ),
                    ),
                  ),
            onTap: () => widget.onTap(),
          ),
          SizedBox(
            width: 8.r,
          ),
          Text.rich(
            TextSpan(
              text: 'I Agree to the ',
              style: TextStyle(
                  fontSize: 13.sp,
                  letterSpacing: 0.5,
                  color: const Color(
                    0xFF777E90,
                  ),
                  fontFamily: 'SF Pro',
                  height: 1.4,
                  fontWeight: FontWeight.w400),
              children: const [
                TextSpan(
                    text: 'terms of use',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      
                    )),
                TextSpan(text: ' and'),
                TextSpan(
                    text: ' privacy policy',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}