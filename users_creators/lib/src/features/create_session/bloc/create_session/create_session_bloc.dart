import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/core/view_models/exercise_view_model.dart';
import 'package:users_creators/src/core/view_models/set_view_model.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_event.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_state.dart';
import 'package:users_creators/src/features/create_session/entity/domain/create_session.dart';
import 'package:users_creators/src/features/create_session/repo/create_session_repo.dart';
import 'package:uuid/uuid.dart';

class CreateSessionBloc extends Bloc<BaseSessionEvent, BaseCreateSessionState> {
  CreateSessionBloc()
      : super((DefaultSessionState(
          name: '',
          instructions: '',
          exercises: [],
        ))) {
    String name = '';
    String instructions = '';
    List<ExerciseViewModel> exerciseViewModels = [];


    on<CreateSessionEvent>(
      (event, emit) async {
        if (name.trim() == '') {
          event.onNotValid.call('Please fill Session Name');
          return;
        }
        if (instructions.trim() == '') {
          event.onNotValid.call('Please fill Session Instructions');
          return;
        }

        if (exerciseViewModels.isEmpty) {
          event.onNotValid.call('Please add at least one exercise');
          return;
        }

        for (var exerciseViewModel in exerciseViewModels) {
          for (var setViewModel in exerciseViewModel.sets) {
            if (setViewModel.repeats == '' ||
                setViewModel.repeats == '0' ||
                setViewModel.weight == 0) {
              event.onNotValid.call(
                  'Please check: repeats and weight should be great than zero');
              return;
            }
          }
        }

        List<Exercise> exercises = [];

        emit(CreatingSessionState());

        for (var exerciseViewModel in exerciseViewModels) {
          var exercise = Exercise(
            id: exerciseViewModel.exerciseId,
            groupId: exerciseViewModel.groupId,
            round: exerciseViewModel.round,
            sets: [],
            restIntervalSec: exerciseViewModel.restIntervalSec,
            youtubeLink: exerciseViewModel.youtubeLink,
            exerciseDescription: exerciseViewModel.description,
            imageUrl: exerciseViewModel.image,
            repMax: exerciseViewModel.repMax,
          );

          for (var setViewModel in exerciseViewModel.sets) {
            var set = Set(
              amrap: false,
              seconds: '0',
              minutes: '0',
              repeats: setViewModel.repeats,
              weight: setViewModel.weight,
              percent: setViewModel.percentage,
            );

            exercise.sets.add(set);
          }
          exercises.add(exercise);
        }

        late bool isSuccess;

        if (event.isEditing) {
          isSuccess = await CreateSessionRepo().editSession(
            CreateEditSession(
              id : BaseCreateSessionState.id,
              exercises: exercises,
              instructions: instructions,
              name: name
          ));
        } else {
          isSuccess = await CreateSessionRepo().createSession(
            CreateEditSession(
              name: name,
              instructions: instructions,
              exercises: exercises,
            ),
          );
        }

        if (isSuccess) {
          event.onSuccess();
          name = '';
          instructions = '';
          exerciseViewModels = [];
          emit(
            DefaultSessionState(
              name: name,
              instructions: instructions,
              exercises: exerciseViewModels,
            ),
          );
        } else {
          event.onError();
        }
      },
    );
    on<RefreshCreateSessionEvent>(
      (event, emit) async {
        emit(DefaultSessionState(
            name: name,
            instructions: instructions,
            exercises: exerciseViewModels));
      },
    );
    on<AddExercisesEvent>(
      (event, emit) async {
        for (var exercise in event.exercises) {
          exerciseViewModels.add(exercise);
        }
        emit(DefaultSessionState(
            name: name,
            instructions: instructions,
            exercises: exerciseViewModels));
      },
    );
    on<SwapExercisesEvent>(
      (event, emit) async {
        emit(DefaultSessionState(
            name: name,
            instructions: instructions,
            exercises: exerciseViewModels));
      },
    );
    on<DeleteExerciseEvent>(
      (event, emit) async {

        exerciseViewModels
            .removeWhere((exercise) => exercise.groupId == event.groupId);
        emit(DefaultSessionState(
            name: name,
            instructions: instructions,
            exercises: exerciseViewModels));
      },
    );
    on<SetExerciseRestIntervalEvent>(
      (event, emit) async {
        for (var exercise in exerciseViewModels) {
          if (exercise.groupId == event.groupId) {
            exercise.restIntervalSec = event.restInterval;
          }
        }
        emit(DefaultSessionState(
            name: name,
            instructions: instructions,
            exercises: exerciseViewModels));
      },
    );
    on<SetRoundsEvent>(
      (event, emit) async {
        for (var exercise in exerciseViewModels) {
          if (exercise.groupId == event.groupId) {
            exercise.round = event.rounds;
          }
        }
        emit(DefaultSessionState(
            name: name,
            instructions: instructions,
            exercises: exerciseViewModels));
      },
    );
    on<NameSetEvent>(
      (event, emit) async {
        name = event.name.trim();
        emit(DefaultSessionState(
            name: name,
            instructions: instructions,
            exercises: exerciseViewModels));
      },
    );
    on<InstructionsSetEvent>(
      (event, emit) async {
        instructions = event.instructions.trim();
        emit(DefaultSessionState(
            name: name,
            instructions: instructions,
            exercises: exerciseViewModels));
      },
    );
    on<SetWorkingMaxEvent>(
      (event, emit) async {
        await CreateSessionRepo().setWorkingMax(
          exerciseId: event.exerciseId,
          repMax: event.repMax,
        );
        for (var exercise in exerciseViewModels) {
          if (exercise.exerciseId == event.exerciseId) {
            exercise.repMax = event.repMax;
          }
        }
        emit(DefaultSessionState(
          name: name,
          instructions: instructions,
          exercises: exerciseViewModels,
        ));
      },
    );
    on<GetSessionByIdEvent>(
      (event, emit) async {
        final session =
            await CreateSessionRepo().getSessionById(event.sessionId);
        if (session.name != null) name = session.name!;
        if (session.instructions != null) instructions = session.instructions!;
        if (session.exercises != null && session.exercises!.isNotEmpty) {
          for (var exercise in session.exercises!) {
            exerciseViewModels.add(
              ExerciseViewModel(
                exerciseId: exercise.id!, // TODO
                groupId: exercise.groupId,
                restIntervalSec: exercise.restIntervalSec,
                repMax: exercise.repMax,
                round: exercise.round,
                name: session.name ?? '',
                youtubeLink: exercise.youtubeLink,
                image: exercise.imageUrl!,
                description: exercise.exerciseDescription,
                sets: exercise.sets
                    .map((e) => SetViewModel(
                          percentage: e.percent,
                          repeats: e.repeats.toString(),
                          weight: e.weight,
                          orderNumber: e.orderNumber,
                        ))
                    .toList(),
              ),
            );
          }
        }

        emit(
          DefaultSessionState(
            name: name,
            instructions: instructions,
            exercises: exerciseViewModels,
          ),
        );
      },
    );
    on<ClearSessionFieldsEvent>((event, emit) {
      name = '';
      instructions = '';
      exerciseViewModels = [];

      emit(DefaultSessionState(
        name: '',
        instructions: '',
        exercises: [],
      ));
    });
  }
}
