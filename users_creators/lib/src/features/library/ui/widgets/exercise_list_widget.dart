import 'package:flutter/cupertino.dart';
import 'package:users_creators/src/features/create_session/entity/domain/exercise_model.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/exercide_list_item.dart';

class ExerciseListWidget extends StatefulWidget {
  final List<ExerciseModel> exerciseList;
  final Function(ExerciseModel) onSelection;
  final List<ExerciseModel> selectedValues;
  final bool isScrolling;
  final bool selectable;
  final bool swap;

  const ExerciseListWidget(
      {Key? key,
      required this.swap,
      required this.exerciseList,
      required this.onSelection,
      required this.selectedValues,
      required this.selectable,
      required this.isScrolling})
      : super(key: key);
  @override
  State<ExerciseListWidget> createState() => _ExerciseListWidgetState();
}

class _ExerciseListWidgetState extends State<ExerciseListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: widget.isScrolling ? null : const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: widget.exerciseList.length,
      itemBuilder: (BuildContext context, int index) {
        return ExerciseListItem(
          canDelete: false,
          selectable: widget.selectable,
          index: index,
          exercise: widget.exerciseList[index],
          onSelection: () {
            setState(() {});
            widget.onSelection(widget.exerciseList[index]);
          },
          isSelected:
              widget.selectedValues.contains(widget.exerciseList[index]),
          selectionIndex:
              widget.selectedValues.indexOf(widget.exerciseList[index]) + 1,
          swap: widget.swap,
        );
      },
    );
  }
}
