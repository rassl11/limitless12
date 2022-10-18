import 'package:flutter/material.dart';
import 'package:users_creators/src/core/helpers/comon_helpers.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_state.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/exercise_cards/top_widget_card_with_set.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/exercise_cards/training_not_expanded_card.dart';


class AllTrainingCard extends StatelessWidget {
  const AllTrainingCard({Key? key, required this.trainingState}) : super(key: key);

  final GotTrainingSessionState trainingState;

  List<Widget> produceExerciseCards(GotTrainingSessionState state) {
    List<Widget> result = [];
    final groups = state.session.exercises!.groupBy((m) => m.groupId);
    for (int index = 0; index < groups.length; index++) {
      var currentGroup = groups.values.elementAt(index);

      switch (currentGroup.length) {
        case 0:
          result.add(const SizedBox());
          break;
        case 1:
          result.add(TrainingNotExpandedCard(
            list: currentGroup,
            index: index,
            state: state,
          ));
          break;
        default:
          result.add(TopWidgetCardWithSets(
            indexOfCard: index,
            exerciseList: currentGroup,
          ));
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: produceExerciseCards(trainingState),
    );
  }
}
