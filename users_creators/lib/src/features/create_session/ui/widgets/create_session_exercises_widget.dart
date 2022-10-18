import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_state.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_state.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/exercise_model_list.dart';

class CreateSessionExercisesWidget extends StatefulWidget {
  const CreateSessionExercisesWidget({Key? key}) : super(key: key);

  @override
  CreateSessionExercisesWidgetState createState() => CreateSessionExercisesWidgetState();
}

class CreateSessionExercisesWidgetState extends State<CreateSessionExercisesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateSessionBloc, BaseCreateSessionState>(
      builder: (context, createSessionState) {
        return BlocBuilder<ExpandCardBloc, ExpandCardState>(
          builder: (context, state) {
            if (createSessionState is DefaultSessionState) {
              return ExerciseModelList(exercises: createSessionState.exercises);
            }
            return const ExerciseModelList(exercises: []);
          },
        );
      },
    );
  }
}
