import 'package:flutter/material.dart';
import 'package:users_creators/src/features/create_session/entity/domain/exercise_model.dart';
import 'package:users_creators/src/features/library/ui/widgets/create_exercise_button.dart';
import 'package:users_creators/src/features/library/ui/widgets/exercise_list_widget.dart';
import 'package:users_creators/src/features/library/ui/widgets/my_exercise_list_widget.dart';

class ExerciseTabView extends StatefulWidget {
  final List<ExerciseModel> exerciseList;
  final bool isMine;
  final bool swap;
  final bool selectable;
  final Function(ExerciseModel) onSelection;
  final List<ExerciseModel> selectedValues;
  const ExerciseTabView(
      {Key? key,
      required this.exerciseList,
      required this.swap,
      required this.isMine,
      required this.onSelection,
      required this.selectedValues,
      required this.selectable})
      : super(key: key);

  @override
  State<ExerciseTabView> createState() => _ExerciseTabViewState();
}

class _ExerciseTabViewState extends State<ExerciseTabView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        children: [
          widget.isMine ? const CreateExerciseButton() : const Offstage(),
          Expanded(
            child: widget.isMine
                ? MyExerciseListWidget(
                    swap: widget.swap,
                    exerciseList: widget.exerciseList,
                    selectable: widget.selectable,
                    onSelection: (exercise) {
                      setState(() {});
                      widget.onSelection(exercise);
                    },
                    selectedValues: widget.selectedValues,
                    isScrolling: true,
                  )
                : ExerciseListWidget(
                    swap: widget.swap,
                    selectable: widget.selectable,
                    exerciseList: widget.exerciseList,
                    onSelection: (exercise) {
                      widget.onSelection(exercise);
                    },
                    selectedValues: widget.selectedValues,
                    isScrolling: true,
                  ),
          ),
        ],
      ),
    );
  }
}
