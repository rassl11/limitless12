import 'dart:ui';

import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:users_creators/src/core/constants/validation.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_event.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/popups/exercise_info_dialog.dart';

import '../../entity/domain/exercise_model.dart';

class ExerciseListItem extends StatelessWidget {
  final bool canDelete;
  final bool isSelected;
  final int selectionIndex;
  final Function onSelection;
  final ExerciseModel exercise;
  final int index;
  final bool swap;
  final bool selectable;

  void doNothing(BuildContext context) {}

  const ExerciseListItem(
      {Key? key,
      required this.canDelete,
      required this.index,
      required this.swap,
      required this.isSelected,
      required this.selectionIndex,
      required this.onSelection,
      required this.exercise,
      required this.selectable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Slidable(
          key: key,
          enabled: canDelete && !selectable,
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                backgroundColor: ColorsLimitless.brandColor,
                icon: Icons.delete,
                onPressed: onDelete,
              ),
            ],
          ),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    GestureDetector(
                      child: exercise.youtubeLink != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: SizedBox(
                                height: 50,
                                width: 70,
                                child: Image.network(
                                  youtubeImage(exercise.youtubeLink!),
                                  fit: BoxFit.fill,
                                ),
                              ))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: Container(
                                height: 50,
                                width: 70,
                                color: ColorsLimitless.greyLight,
                              ),
                            ),
                      onTap: () {
                        showExerciseInfoDialog(context, exercise.title,
                            exercise.youtubeLink, exercise.exerciseDescription);
                      },
                    ),
                    SizedBox(
                      width: 12.r,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            exercise.title ?? 'Empty',
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: ColorsLimitless.greyDark,
                                fontFamily: 'SF Pro',
                                letterSpacing: 0.5,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Equipement: ${exercise.equipmentUsed?.name ?? "None"}',
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: ColorsLimitless.greyMedium,
                                fontFamily: 'SF Pro',
                                letterSpacing: 0.5,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Main Muscle: ${exercise.primaryMuscleGroup!.isNotEmpty ? exercise.primaryMuscleGroup!.first.name : "None"}',
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: ColorsLimitless.greyMedium,
                                fontFamily: 'SF Pro',
                                letterSpacing: 0.5,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    selectable
                        ? GestureDetector(
                            child: Container(
                              width: 17.r,
                              height: 17.r,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? ColorsLimitless.brandColor
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: ColorsLimitless.greyLight,
                                      width: 1.4)),
                              child: swap == true
                                  ? const SizedBox()
                                  : Center(
                                      child: Text(selectionIndex.toString(),
                                          style: TextStyle(
                                              color: isSelected
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              fontFamily: 'SF Pro',
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.w600)),
                                    ),
                            ),
                            onTap: () => onSelection(),
                          )
                        : const Offstage()
                  ],
                ),
              )),
        ));
  }

  void onDelete(BuildContext context) {
    context
        .read<ExerciseListBloc>()
        .add(DeleteExerciseEvent(exerciseId: exercise.id));
  }
}
