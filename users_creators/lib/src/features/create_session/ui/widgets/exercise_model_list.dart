import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/core/view_models/exercise_view_model.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_state.dart';

import 'editing_card/all_cards.dart';

class ExerciseModelList extends StatelessWidget {
  const ExerciseModelList({Key? key, required this.exercises}) : super(key: key);

  final List<ExerciseViewModel> exercises;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpandCardBloc, ExpandCardState>(
      builder: (context, state) {
        return Padding(
            padding: EdgeInsets.symmetric(vertical: 6.r),
            child: AllCards(
              cardState: state,
              exercises: exercises,
            ));
      },
    );
  }
}
