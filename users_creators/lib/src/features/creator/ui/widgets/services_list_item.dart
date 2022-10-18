import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../entity/domain/creator_questionnaire.dart';
import '../../entity/service_model.dart';
import '../../repo/creator_repo.dart';
import 'questionnaire/show_dialog.dart';

class ServicesListItem extends StatelessWidget {
  final int index;
  final String? creatorId;
  final String fullName;

  const ServicesListItem({
    Key? key,
    required this.index,
    required this.fullName,
    this.creatorId,
  }) : super(key: key);

  Future<void> _onServiceTap(BuildContext context) async {
    if (creatorId != null) {
      final creatorRepo = context.read<CreatorRepository>();

      CreatorQuestionnaire questionnaire =
          await creatorRepo.fetchCreatorServiceQuestionnaire(creatorId!);
      // ignore: use_build_context_synchronously
      showQuestionnaireDialog(
        context,
        creatorQuestionnaire: questionnaire,
        fullName: fullName,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = serviceList[index].image;

    if (image == null) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 58.r),
        decoration: BoxDecoration(
          color: const Color(0xFFE6E8EC),
          borderRadius: BorderRadius.circular(6.r),
        ),
      );
    }
    return GestureDetector(
      onTap: () => _onServiceTap(context),
      child: Container(
        width: 189.w,
        padding: EdgeInsets.all(12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(.6),
              BlendMode.softLight,
            ),
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: SizedBox(
            width: (189 * .7).w,
            child: Text(
              'Online coaching',
              style: TextStyle(
                fontFamily: 'SF Pro',
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
