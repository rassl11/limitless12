import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepperDots extends StatelessWidget {
  final int stepsCount;
  final int currentStep;

  const StepperDots({
    Key? key,
    required this.stepsCount,
    required this.currentStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final stepWidth = constraints.maxWidth / stepsCount;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(stepsCount, (index) {
          return _Dot(
            isActive: index <= currentStep,
            stepsCount: stepsCount,
            index: index,
            width: stepWidth - (stepWidth / 5),
          );
        }),
      );
    });
  }
}

class _Dot extends StatelessWidget {
  final bool isActive;
  final int index;
  final int stepsCount;
  final double width;

  const _Dot({
    Key? key,
    required this.isActive,
    required this.index,
    required this.stepsCount,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final alignment = index == 0
        ? Alignment.centerLeft
        : index == stepsCount - 1
            ? Alignment.centerRight
            : Alignment.center;

    return Expanded(
      child: Align(
        alignment: alignment,
        child: Container(
          height: 4.h,
          width: width,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF777E91) : const Color(0xFFB1B5C4),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}
