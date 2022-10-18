import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/training_session/entity/instruction_model.dart';

class InstructionModelList extends StatelessWidget {
  const InstructionModelList({ Key? key, required this.index }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.8.sw,
      child: Text(instructionModel[index].description,
      style: TextStyle(
        fontFamily: "SF Pro",
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5
      ),
      ),
    );
  }
}