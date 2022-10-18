import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/training_session/entity/instruction_model.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/instruction_model_list.dart';

class InstructionPage extends StatelessWidget {
  const InstructionPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 14.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.r,),
            Image.asset('assets/images/training_session/video.png'),
              SizedBox(height: 20.r,),
            Text('Fitness Routine',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black
            ),
            ),
            SizedBox(height: 5.r,),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: instructionModel.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding:  EdgeInsets.only(bottom: 8.r),
                  child: InstructionModelList(index: index,),
                );
              })
              
              )
          ],
        ),
      ),
    );
  }
}