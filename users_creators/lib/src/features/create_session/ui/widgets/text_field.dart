import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_event.dart';

class TextFieldSession extends StatefulWidget {
  final bool isEditing;
  final String instructions;

  const TextFieldSession({
    Key? key,
    required this.isEditing,
    required this.instructions,
  }) : super(key: key);

  @override
  State<TextFieldSession> createState() => _TextFieldSessionState();
}

class _TextFieldSessionState extends State<TextFieldSession> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.r),
      child: TextFormField(
        controller: widget.isEditing
            ? TextEditingController(text: widget.instructions)
            : null,
        onChanged: (value) {
          context
              .read<CreateSessionBloc>()
              .add(InstructionsSetEvent(instructions: value));
        },
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.multiline,
        minLines: 1,
        maxLines: null,
        cursorColor: ColorsLimitless.brandColor,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.r, vertical: 15.r),
          filled: true,
          hintText: 'Type text',
          hintStyle: TextStyle(
              color: ColorsLimitless.greyLight,
              fontFamily: 'SF Pro',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
          hintMaxLines: 1,
          fillColor: Colors.white,
          labelStyle: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Color(0xFF23262F)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Color(0xFFE6E8EC)),
          ),
          border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                  width: 1, color: ColorsLimitless.greyLight.withOpacity(0.3))),
        ),
      ),
    );
  }
}
