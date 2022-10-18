import 'package:components/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/features/library/ui/widgets/create_exercise_button.dart';

class SearchNotFoundWidget extends StatelessWidget {
  const SearchNotFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 100),
        Text(
          'Search returned no results',
          style: TextStyle(
              color: ColorsLimitless.greyDark,
              fontSize: 24.sp,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w500),
        ),
        Text(
          'But you can create a new exercise',
          style: TextStyle(
              color: ColorsLimitless.greyLight,
              fontSize: 14.sp,
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 10),
        const CreateExerciseButton()
      ],
    );
  }
}
