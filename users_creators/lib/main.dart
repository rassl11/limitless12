import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intercom_flutter/intercom_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_creators/src/core/config/router.dart';
import 'package:users_creators/src/features/calendar/bloc/calendar_bloc.dart';
import 'package:users_creators/src/features/calendar/session/bloc/session_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/create_exercise/create_exercise_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/create_session/create_session_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_info/exercise_info_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/exercise_list/exercise_list_bloc.dart';
import 'package:users_creators/src/features/create_session/bloc/expand_card/expand_card_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/creator/creator_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/dropdown/user_drop_down_bloc.dart';
import 'package:users_creators/src/features/creator/bloc/subscribe/user_subscribe_bloc.dart';
import 'package:users_creators/src/features/current_creator/current_creator_bloc.dart';
import 'package:users_creators/src/features/dashboard/bloc/get_session_range/get_session_range_bloc.dart';
import 'package:users_creators/src/features/discover/bloc/discover_bloc.dart';
import 'package:users_creators/src/features/discover/bloc/search_result/search_result_bloc.dart';
import 'package:users_creators/src/features/discover/repo/discover_repo.dart';
import 'package:users_creators/src/features/followed/bloc/followed_bloc.dart';
import 'package:users_creators/src/features/library/bloc/get_session_id/get_session_bloc.dart';
import 'package:users_creators/src/features/library/bloc/my_sessions/my_sessions_bloc.dart';
import 'package:users_creators/src/features/library/bloc/session/bloc.dart';
import 'package:users_creators/src/features/library/bloc/workout_popup/bloc_workout.dart';
import 'package:users_creators/src/features/login/bloc/login_bloc.dart';
import 'package:users_creators/src/features/settings/presentation/profile/bloc/edit_password_block.dart';
import 'package:users_creators/src/features/settings/presentation/profile/bloc/profile_bloc.dart';
import 'package:users_creators/src/features/settings/presentation/settings/bloc/settings_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/calculator/custom_percent_cubit.dart';
import 'package:users_creators/src/features/training_session/bloc/calculator/wight_cubit.dart';
import 'package:users_creators/src/features/training_session/bloc/done_exercise/done_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/done_session/done_session_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/expand_timer/expand_timer_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_card/training_expand_card_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/expanded_text_field.dart/text_field_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/finished_round/finished_round_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/get_session/get_training_session_bloc.dart';
import 'package:users_creators/src/features/training_session/bloc/session_duration/session_duration_cubit.dart';
import 'package:users_creators/src/features/training_session/bloc/timer_for_session/session_timer_bloc.dart';

import 'src/core/lang/gen/codegen_loader.g.dart';
import 'src/features/creator/repo/creator_repo.dart';
import 'src/features/login/repo/login_repo.dart';
import 'src/features/onboarding_creator/repo/creating_onboarding_repo.dart';
import 'src/features/training_session/bloc/change_indicator_length/change_indicator_bloc.dart';
import 'src/features/training_session/bloc/check_if_done_bloc/check_if_done_bloc.dart';

final locator = GetIt.instance;
Future<void> initPrefs() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Intercom.instance.initialize('zbbz7qgn',
      iosApiKey: 'ios_sdk-051664f8619d24ad5fbdb82ad571f70fd52b904f',
      androidApiKey: 'android_sdk-985cbe46347cf2ccad674bd6dff2f79ffd121152');
  EasyLocalization.logger.enableBuildModes = [];
  initializeDateFormatting('en');
  await EasyLocalization.ensureInitialized();
  final appRouter = AppRouter();
  await initPrefs();
  await _initApp();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(EasyLocalization(
      path: 'lang',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      supportedLocales: const [
        Locale('en'),
      ],
      assetLoader: const CodegenLoader(),
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            // SharedPreferences.getInstance().then((v) => v.clear());

            return MultiRepositoryProvider(
              providers: [
                RepositoryProvider(create: (context) => CreatorRepository()),
                RepositoryProvider(create: (context) => CreatorOnboardingRepo()),
                RepositoryProvider(create: (context) => LoginRepo()),
              ],
              child: MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => UserWorkoutBloc()),
                  BlocProvider(create: (context) => UserBloc()),
                  BlocProvider(create: (context) => UserSubscribeBloc()),
                  BlocProvider(create: (context) => UserDropDownBloc()),
                  BlocProvider(create: (context) => LoginBloc((v) {}, (e) {})),
                  BlocProvider(create: (context) => CalendarBloc()),
                  BlocProvider(create: (context) => ProfileBloc()),
                  BlocProvider(create: (context) => ExpandCardBloc()),
                  BlocProvider(create: (context) => CurrentCreatorBloc()),
                  BlocProvider(create: (context) => SettingsBloc(() {})),
                  BlocProvider(create: (context) => DiscoverBloc()),
                  BlocProvider(create: (context) => TrainingExpandCardBloc()),
                  BlocProvider(create: (context) => TextFieldBloc()),
                  BlocProvider(create: (context) => DoneExerciseBloc()),
                  BlocProvider(create: (context) => WeightCubit()),
                  BlocProvider(create: (context) => CustomPercentCubit()),
                  BlocProvider(create: (context) => EditPasswordBloc()),
                  BlocProvider(
                      create: (context) => SearchResultBloc(
                            loadedInfo: DiscoverRepo(),
                          )),
                  BlocProvider(create: (context) => CreatorProfileBloc()),
                  BlocProvider(create: (context) => FollowedBloc()),
                  BlocProvider(create: (context) => CreateExerciseBloc()),
                  BlocProvider(create: (context) => ExerciseInfoBloc()),
                  BlocProvider(create: (context) => ExerciseListBloc()),
                  BlocProvider(create: (context) => CreateSessionBloc()),
                  BlocProvider(create: (context) => MySessionsCalendarBloc()),
                  BlocProvider(create: (context) => MySessionsTemplatesBloc()),
                  BlocProvider(create: (context) => MySessionsOptionsBloc()),
                  BlocProvider(create: (context) => SessionBloc()),
                  BlocProvider(create: (context) => GetSessionBloc()),
                  BlocProvider(create: (context) => GetTrainingSessionBloc()),
                  BlocProvider(create: (context) => FinishRoundBloc()),
                  BlocProvider(create: (context) => ChangeIndicatorLengthBloc()),
                  BlocProvider(create: (context) => CheckIfExerciseDoneBloc()),
                  BlocProvider(create: (context) => DoneSessionBloc()),
                  BlocProvider(create: (context) => SessionDurationCubit()),
                  BlocProvider(create: (context) => GetSessionRangeBloc()),
                  BlocProvider(create: (context) => SessionTimerBloc()),
                  BlocProvider(create: (context) => ExpandTimerBloc()),
                  
                ],
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routerDelegate: appRouter.delegate(),
                  routeInformationParser: appRouter.defaultRouteParser(),
                ),
              ),
            );
          }),
    ));
  });
}

Future _initApp() async {
  final futures = <Future>[
    dot_env.dotenv.load(),
  ];

  await Future.wait(futures);
}
