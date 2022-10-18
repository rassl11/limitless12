import 'package:auto_route/auto_route.dart';
import 'package:components/buttons/app_buttons.dart';
import 'package:components/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_creators/src/core/constants/validation.dart';
import 'package:users_creators/src/core/view_models/exercise_view_model.dart';
import 'package:users_creators/src/core/view_models/set_view_model.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_event.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_state.dart';
import 'package:users_creators/src/features/create_session/entity/domain/exercise_model.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class CreateSessionButton extends StatelessWidget {
  final bool swap;
  List<ExerciseModel> selectedExercises = [];
  final int index;

  CreateSessionButton(
      {Key? key, required this.selectedExercises, required this.swap, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateSessionBloc, BaseCreateSessionState>(
      builder: (context, createSessionState) {
        if (createSessionState is DefaultSessionState) {
          return Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: ColorsLimitless.greyLight, blurRadius: 5)],
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
              child: swap == true
                  ? AppButtons().redButton(
                      context,
                      'Swap',
                      () => swapExercise(context, createSessionState, index),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    )
                  : selectedExercises.length == 1
                      ? AppButtons().redButton(
                          context,
                          'Add(${selectedExercises.length.toString()})',
                          () => selectAsSingleExercises(context),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        )
                      : Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                          AppButtons().redButton(
                              context,
                              selectedExercises.length == 2
                                  ? 'Superset'
                                  : selectedExercises.length == 3
                                      ? 'Create Triset'
                                      : 'Create Circuit',
                              () => selectAsMultiExercises(context),
                              isLarge: false,
                              color: ColorsLimitless.brandColor.withOpacity(0.1),
                              fontSize: 12.sp,
                              width: 150.w,
                              fontWeight: FontWeight.w500,
                              textColor: ColorsLimitless.brandColor),
                          AppButtons().redButton(
                            context,
                            fontSize: 12.sp,
                            width: 150.w,
                            fontWeight: FontWeight.w500,
                            'Add(${selectedExercises.length.toString()})',
                            () => selectAsSingleExercises(context),
                            isLarge: false,
                          ),
                        ]),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  void swapExercise(BuildContext context, DefaultSessionState state, int index) {
    late ExerciseViewModel exercise;
    for (var exerciseModel in selectedExercises) {
      exercise = ExerciseViewModel(
          round: 0,
          name: exerciseModel.title ?? '',
          description: exerciseModel.exerciseDescription ?? '',
          exerciseId: exerciseModel.id,
          groupId: const Uuid().v4().toString(),
          image: youtubeImage(exerciseModel.youtubeLink ?? ''),
          repMax: state.exercises[index].repMax,
          restIntervalSec: state.exercises[index].restIntervalSec,
          youtubeLink: exerciseModel.youtubeLink ?? '',
          sets: state.exercises[index].sets);
    }
    state.exercises.removeAt(index);
    state.exercises.insert(index, exercise);

    context.read<CreateSessionBloc>().add(SwapExercisesEvent(exercise: exercise));
    context.router.navigateBack();
  }

  void selectAsSingleExercises(BuildContext context) {
    List<ExerciseViewModel> exercises = [];

    for (var exerciseModel in selectedExercises) {
      var exercise = ExerciseViewModel(
          exerciseId: exerciseModel.id,
          groupId: const Uuid().v4().toString(),
          sets: [SetViewModel(orderNumber: 0, repeats: '0', weight: 0, percentage: 0)],
          round: 0,
          restIntervalSec: 0,
          repMax: 0,
          image: youtubeImage(exerciseModel.youtubeLink ?? ''),
          youtubeLink: exerciseModel.youtubeLink ?? '',
          description: exerciseModel.exerciseDescription ?? '',
          name: exerciseModel.title ?? '');
      exercises.add(exercise);
    }

    context.read<CreateSessionBloc>().add(AddExercisesEvent(exercises: exercises));
    context.router.navigateBack();
  }

  void selectAsMultiExercises(BuildContext context) {
    List<ExerciseViewModel> exercises = [];

    var groupId = const Uuid().v4().toString();

    for (var exerciseModel in selectedExercises) {
      var exercise = ExerciseViewModel(
          exerciseId: exerciseModel.id,
          groupId: groupId,
          sets: [SetViewModel(orderNumber: 0, repeats: '0', weight: 0, percentage: 0)],
          round: 1,
          restIntervalSec: 0,
          repMax: 0,
          image: youtubeImage(exerciseModel.youtubeLink ?? ''),
          youtubeLink: exerciseModel.youtubeLink ?? '',
          description: exerciseModel.exerciseDescription ?? '',
          name: exerciseModel.title ?? '');
      exercises.add(exercise);
    }

    context.read<CreateSessionBloc>().add(AddExercisesEvent(exercises: exercises));
    context.router.navigateBack();
  }
}
