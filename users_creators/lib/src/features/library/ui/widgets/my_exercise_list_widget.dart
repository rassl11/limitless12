import 'package:flutter/cupertino.dart';
import 'package:users_creators/src/features/create_session/entity/domain/exercise_model.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/exercide_list_item.dart';

class MyExerciseListWidget extends StatefulWidget {
  final List<ExerciseModel> exerciseList;
  final bool selectable;
  final bool isScrolling;
  final Function(ExerciseModel) onSelection;
  final List<ExerciseModel> selectedValues;
  final bool swap;

  const MyExerciseListWidget(
      {Key? key,
      required this.exerciseList,
      required this.selectable,
      required this.swap,
      required this.onSelection,
      required this.selectedValues,
      required this.isScrolling})
      : super(key: key);
  @override
  State<MyExerciseListWidget> createState() => _MyExerciseListWidgetState();
}

class _MyExerciseListWidgetState extends State<MyExerciseListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: widget.isScrolling ? null : const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: widget.exerciseList.length,
      itemBuilder: (BuildContext context, int index) {
        return ExerciseListItem(
          selectable: widget.selectable,
          index: index,
          exercise: widget.exerciseList[index],
          onSelection: () {
            widget.onSelection(widget.exerciseList[index]);
          },
          isSelected: widget.selectedValues.contains(widget.exerciseList[index]),
          selectionIndex: widget.selectedValues.indexOf(widget.exerciseList[index]) + 1,
          swap: widget.swap,
          canDelete: true,
        );
      },
    );
  }
}
