import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/core/helpers/comon_helpers.dart';
import 'package:users_creators/src/core/view_models/exercise_view_model.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_bloc.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/final_card/multi_exercise_card.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/final_card/single_exercise_card.dart';

import '../../../bloc/expand_card/expand_card_state.dart';

class AllCards extends StatelessWidget {
  const AllCards({Key? key, required this.cardState, required this.exercises}) : super(key: key);

  final ExpandCardState cardState;
  final List<ExerciseViewModel> exercises;

  List<Widget> produceExerciseCards() {
    List<Widget> cards = [];
    final groups = exercises.groupBy((exercise) => exercise.groupId);
    for (int index = 0; index < groups.length; index++) {
      var currentGroup = groups.values.elementAt(index);

      switch (currentGroup.length) {
        case 0:
          cards.add(const SizedBox());
          break;
        case 1:
          cards.add(SingleExerciseCard(
            exercise: currentGroup[0],
            index: index,
          ));
          break;
        default:
          cards.add(MultiExerciseCard(index: index, exercises: currentGroup));
      }
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpandCardBloc, ExpandCardState>(
      builder: (context, st) {
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: produceExerciseCards(),
            ),
          ],
        );
      },
    );
  }
}
