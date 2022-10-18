import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormWidget extends StatelessWidget {
  final GlobalKey formKey;
  final void Function(MapEntry<String, String>) callback;

  const FormWidget({
    Key? key,
    required this.formKey,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _FormItem(
              label: 'Name',
              callback: callback,
              root: 0,
            ),
            SizedBox(height: 18.h),
            _FormItem(
              label: 'Email',
              callback: callback,
              root: 1,
            ),
            SizedBox(height: 18.h),
            _FormItem(
              label: 'Phone',
              callback: callback,
              root: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class _FormItem extends StatelessWidget {
  final String label;
  final int root;

  final void Function(MapEntry<String, String>) callback;

  const _FormItem({
    Key? key,
    required this.label,
    required this.callback,
    required this.root,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: const Color(0xFF777E91),
      fontFamily: "SF Pro",
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
    );

    final isPhoneField = root == 2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textStyle),
        Material(
          elevation: 0.0,
          color: Colors.transparent,
          child: TextFormField(
            onSaved: (value) => callback(
              MapEntry(
                label,
                isPhoneField
                    ? value!.replaceAll(RegExp('[^0-9,.]'), '')
                    : value!,
              ),
            ),
            inputFormatters: isPhoneField
                ? [
                    MaskTextInputFormatter(
                      mask: '(###) ###-####',
                      filter: {"#": RegExp(r'[0-9]')},
                      type: MaskAutoCompletionType.lazy,
                    )
                  ]
                : null,
            keyboardType:
                isPhoneField ? TextInputType.phone : TextInputType.text,
            decoration: InputDecoration(
              hintText: isPhoneField ? '(201) 555-0123' : label,
              hintStyle: textStyle.copyWith(
                color: textStyle.color?.withOpacity(.7),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 8.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide: const BorderSide(
                  color: Color(0xFFE6E8EC),
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Field must not be empty';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
