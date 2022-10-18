// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const Onboarding());
    },
    UserLoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const UserLogin());
    },
    UserSignUpRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const UserSignUp());
    },
    DiscoverPageRoute.name: (routeData) {
      final args = routeData.argsAs<DiscoverPageRouteArgs>(
          orElse: () => const DiscoverPageRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              DiscoverPage(key: args.key, showBackButton: args.showBackButton));
    },
    DiscoverSearchPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const DiscoverSearchPage());
    },
    DiscoverResultPageRoute.name: (routeData) {
      final args = routeData.argsAs<DiscoverResultPageRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: DiscoverResultPage(
              key: args.key, tag: args.tag, showHashTag: args.showHashTag));
    },
    UserProfilePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const UserProfilePage());
    },
    EditProfilePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EditProfilePage());
    },
    SettingsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsPage());
    },
    BottomBarPageRoute.name: (routeData) {
      final args = routeData.argsAs<BottomBarPageRouteArgs>(
          orElse: () => const BottomBarPageRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: BottomBarPage(key: args.key, initialIndex: args.initialIndex));
    },
    UserDashboardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const UserDashboard());
    },
    LibraryPageRoute.name: (routeData) {
      final args = routeData.argsAs<LibraryPageRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: LibraryPage(key: args.key, isFull: args.isFull));
    },
    CreatorPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CreatorPage());
    },
    WorkoutsViewAllPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const WorkoutsViewAllPage());
    },
    WorkoutsDetailsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const WorkoutsDetailsPage());
    },
    ExerciseListPageRoute.name: (routeData) {
      final args = routeData.argsAs<ExerciseListPageRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ExerciseListPage(
              key: args.key,
              swap: args.swap,
              indexOfExercise: args.indexOfExercise,
              trainingSessionPart: args.trainingSessionPart));
    },
    FullNamePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const FullNamePage());
    },
    TikTokPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TikTokPage());
    },
    AboutPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AboutPage());
    },
    TagsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TagsPage());
    },
    CoverPhotoPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CoverPhotoPage());
    },
    WelcomePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const WelcomePage());
    },
    CreatorsOnboardingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CreatorsOnboarding());
    },
    AuthorizationOnboardingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AuthorizationOnboarding());
    },
    YearCalendarScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const YearCalendarScreen());
    },
    CalendarScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CalendarScreen());
    },
    WelcomeCreatorPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const WelcomeCreatorPage());
    },
    MainFlowRoute.name: (routeData) {
      final args = routeData.argsAs<MainFlowRouteArgs>(
          orElse: () => const MainFlowRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: MainFlow(
              key: args.key,
              isEditing: args.isEditing,
              sessionTemplateId: args.sessionTemplateId));
    },
    HistoryPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HistoryPage());
    },
    EditPasswordPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EditPasswordPage());
    },
    StartTrainingSessionPageRoute.name: (routeData) {
      final args = routeData.argsAs<StartTrainingSessionPageRouteArgs>(
          orElse: () => const StartTrainingSessionPageRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: StartTrainingSessionPage(key: args.key));
    },
    TrainingHistoryPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TrainingHistoryPage());
    },
    SuperSetHistoryPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SuperSetHistoryPage());
    },
    ExerciseSettingsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ExerciseSettingsPage());
    },
    IntensityRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const Intensity());
    },
    WelcomeUserPageRoute.name: (routeData) {
      final args = routeData.argsAs<WelcomeUserPageRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: WelcomeUserPage(key: args.key, username: args.username));
    },
    PersonalInfoPageRoute.name: (routeData) {
      final args = routeData.argsAs<PersonalInfoPageRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: PersonalInfoPage(key: args.key, username: args.username));
    },
    ForgotPasswordPageRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordPageRouteArgs>(
          orElse: () => const ForgotPasswordPageRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: ForgotPasswordPage(key: args.key));
    },
    VerifyCodePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const VerifyCodePage());
    },
    NewPasswordPageRoute.name: (routeData) {
      final args = routeData.argsAs<NewPasswordPageRouteArgs>(
          orElse: () => const NewPasswordPageRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: NewPasswordPage(key: args.key));
    },
    PasswordChangedPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PasswordChangedPage());
    },
    UserWebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<UserWebViewPageRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: UserWebViewPage(key: args.key, appBarTitle: args.appBarTitle));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(OnboardingRoute.name, path: '/'),
        RouteConfig(UserLoginRoute.name, path: '/user-login'),
        RouteConfig(UserSignUpRoute.name, path: '/user-sign-up'),
        RouteConfig(DiscoverPageRoute.name, path: '/discover-page'),
        RouteConfig(DiscoverSearchPageRoute.name,
            path: '/discover-search-page'),
        RouteConfig(DiscoverResultPageRoute.name,
            path: '/discover-result-page'),
        RouteConfig(UserProfilePageRoute.name, path: '/user-profile-page'),
        RouteConfig(EditProfilePageRoute.name, path: '/edit-profile-page'),
        RouteConfig(SettingsPageRoute.name, path: '/settings-page'),
        RouteConfig(BottomBarPageRoute.name, path: '/bottom-bar-page'),
        RouteConfig(UserDashboardRoute.name, path: '/user-dashboard'),
        RouteConfig(LibraryPageRoute.name, path: '/library-page'),
        RouteConfig(CreatorPageRoute.name, path: '/creator-page'),
        RouteConfig(WorkoutsViewAllPageRoute.name,
            path: '/workouts-view-all-page'),
        RouteConfig(WorkoutsDetailsPageRoute.name,
            path: '/workouts-details-page'),
        RouteConfig(ExerciseListPageRoute.name, path: '/exercise-list-page'),
        RouteConfig(FullNamePageRoute.name, path: '/full-name-page'),
        RouteConfig(TikTokPageRoute.name, path: '/tik-tok-page'),
        RouteConfig(AboutPageRoute.name, path: '/about-page'),
        RouteConfig(TagsPageRoute.name, path: '/tags-page'),
        RouteConfig(CoverPhotoPageRoute.name, path: '/cover-photo-page'),
        RouteConfig(WelcomePageRoute.name, path: '/welcome-page'),
        RouteConfig(CreatorsOnboardingRoute.name, path: '/creators-onboarding'),
        RouteConfig(AuthorizationOnboardingRoute.name,
            path: '/authorization-onboarding'),
        RouteConfig(YearCalendarScreenRoute.name,
            path: '/year-calendar-screen'),
        RouteConfig(CalendarScreenRoute.name, path: '/calendar-screen'),
        RouteConfig(WelcomeCreatorPageRoute.name,
            path: '/welcome-creator-page'),
        RouteConfig(MainFlowRoute.name, path: '/main-flow'),
        RouteConfig(HistoryPageRoute.name, path: '/history-page'),
        RouteConfig(EditPasswordPageRoute.name, path: '/edit-password-page'),
        RouteConfig(StartTrainingSessionPageRoute.name,
            path: '/start-training-session-page'),
        RouteConfig(TrainingHistoryPageRoute.name,
            path: '/training-history-page'),
        RouteConfig(SuperSetHistoryPageRoute.name,
            path: '/super-set-history-page'),
        RouteConfig(ExerciseSettingsPageRoute.name,
            path: '/exercise-settings-page'),
        RouteConfig(IntensityRoute.name, path: '/Intensity'),
        RouteConfig(WelcomeUserPageRoute.name, path: '/welcome-user-page'),
        RouteConfig(PersonalInfoPageRoute.name, path: '/personal-info-page'),
        RouteConfig(ForgotPasswordPageRoute.name,
            path: '/forgot-password-page'),
        RouteConfig(VerifyCodePageRoute.name, path: '/verify-code-page'),
        RouteConfig(NewPasswordPageRoute.name, path: '/new-password-page'),
        RouteConfig(PasswordChangedPageRoute.name,
            path: '/password-changed-page'),
        RouteConfig(UserWebViewPageRoute.name, path: '/user-web-view-page')
      ];
}

/// generated route for
/// [Onboarding]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: '/');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [UserLogin]
class UserLoginRoute extends PageRouteInfo<void> {
  const UserLoginRoute() : super(UserLoginRoute.name, path: '/user-login');

  static const String name = 'UserLoginRoute';
}

/// generated route for
/// [UserSignUp]
class UserSignUpRoute extends PageRouteInfo<void> {
  const UserSignUpRoute() : super(UserSignUpRoute.name, path: '/user-sign-up');

  static const String name = 'UserSignUpRoute';
}

/// generated route for
/// [DiscoverPage]
class DiscoverPageRoute extends PageRouteInfo<DiscoverPageRouteArgs> {
  DiscoverPageRoute({Key? key, bool showBackButton = true})
      : super(DiscoverPageRoute.name,
            path: '/discover-page',
            args: DiscoverPageRouteArgs(
                key: key, showBackButton: showBackButton));

  static const String name = 'DiscoverPageRoute';
}

class DiscoverPageRouteArgs {
  const DiscoverPageRouteArgs({this.key, this.showBackButton = true});

  final Key? key;

  final bool showBackButton;

  @override
  String toString() {
    return 'DiscoverPageRouteArgs{key: $key, showBackButton: $showBackButton}';
  }
}

/// generated route for
/// [DiscoverSearchPage]
class DiscoverSearchPageRoute extends PageRouteInfo<void> {
  const DiscoverSearchPageRoute()
      : super(DiscoverSearchPageRoute.name, path: '/discover-search-page');

  static const String name = 'DiscoverSearchPageRoute';
}

/// generated route for
/// [DiscoverResultPage]
class DiscoverResultPageRoute
    extends PageRouteInfo<DiscoverResultPageRouteArgs> {
  DiscoverResultPageRoute(
      {Key? key, required String tag, required bool showHashTag})
      : super(DiscoverResultPageRoute.name,
            path: '/discover-result-page',
            args: DiscoverResultPageRouteArgs(
                key: key, tag: tag, showHashTag: showHashTag));

  static const String name = 'DiscoverResultPageRoute';
}

class DiscoverResultPageRouteArgs {
  const DiscoverResultPageRouteArgs(
      {this.key, required this.tag, required this.showHashTag});

  final Key? key;

  final String tag;

  final bool showHashTag;

  @override
  String toString() {
    return 'DiscoverResultPageRouteArgs{key: $key, tag: $tag, showHashTag: $showHashTag}';
  }
}

/// generated route for
/// [UserProfilePage]
class UserProfilePageRoute extends PageRouteInfo<void> {
  const UserProfilePageRoute()
      : super(UserProfilePageRoute.name, path: '/user-profile-page');

  static const String name = 'UserProfilePageRoute';
}

/// generated route for
/// [EditProfilePage]
class EditProfilePageRoute extends PageRouteInfo<void> {
  const EditProfilePageRoute()
      : super(EditProfilePageRoute.name, path: '/edit-profile-page');

  static const String name = 'EditProfilePageRoute';
}

/// generated route for
/// [SettingsPage]
class SettingsPageRoute extends PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(SettingsPageRoute.name, path: '/settings-page');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [BottomBarPage]
class BottomBarPageRoute extends PageRouteInfo<BottomBarPageRouteArgs> {
  BottomBarPageRoute({Key? key, int initialIndex = 0})
      : super(BottomBarPageRoute.name,
            path: '/bottom-bar-page',
            args: BottomBarPageRouteArgs(key: key, initialIndex: initialIndex));

  static const String name = 'BottomBarPageRoute';
}

class BottomBarPageRouteArgs {
  const BottomBarPageRouteArgs({this.key, this.initialIndex = 0});

  final Key? key;

  final int initialIndex;

  @override
  String toString() {
    return 'BottomBarPageRouteArgs{key: $key, initialIndex: $initialIndex}';
  }
}

/// generated route for
/// [UserDashboard]
class UserDashboardRoute extends PageRouteInfo<void> {
  const UserDashboardRoute()
      : super(UserDashboardRoute.name, path: '/user-dashboard');

  static const String name = 'UserDashboardRoute';
}

/// generated route for
/// [LibraryPage]
class LibraryPageRoute extends PageRouteInfo<LibraryPageRouteArgs> {
  LibraryPageRoute({Key? key, required bool isFull})
      : super(LibraryPageRoute.name,
            path: '/library-page',
            args: LibraryPageRouteArgs(key: key, isFull: isFull));

  static const String name = 'LibraryPageRoute';
}

class LibraryPageRouteArgs {
  const LibraryPageRouteArgs({this.key, required this.isFull});

  final Key? key;

  final bool isFull;

  @override
  String toString() {
    return 'LibraryPageRouteArgs{key: $key, isFull: $isFull}';
  }
}

/// generated route for
/// [CreatorPage]
class CreatorPageRoute extends PageRouteInfo<void> {
  const CreatorPageRoute()
      : super(CreatorPageRoute.name, path: '/creator-page');

  static const String name = 'CreatorPageRoute';
}

/// generated route for
/// [WorkoutsViewAllPage]
class WorkoutsViewAllPageRoute extends PageRouteInfo<void> {
  const WorkoutsViewAllPageRoute()
      : super(WorkoutsViewAllPageRoute.name, path: '/workouts-view-all-page');

  static const String name = 'WorkoutsViewAllPageRoute';
}

/// generated route for
/// [WorkoutsDetailsPage]
class WorkoutsDetailsPageRoute extends PageRouteInfo<void> {
  const WorkoutsDetailsPageRoute()
      : super(WorkoutsDetailsPageRoute.name, path: '/workouts-details-page');

  static const String name = 'WorkoutsDetailsPageRoute';
}

/// generated route for
/// [ExerciseListPage]
class ExerciseListPageRoute extends PageRouteInfo<ExerciseListPageRouteArgs> {
  ExerciseListPageRoute(
      {Key? key,
      required bool swap,
      required int indexOfExercise,
      required bool trainingSessionPart})
      : super(ExerciseListPageRoute.name,
            path: '/exercise-list-page',
            args: ExerciseListPageRouteArgs(
                key: key,
                swap: swap,
                indexOfExercise: indexOfExercise,
                trainingSessionPart: trainingSessionPart));

  static const String name = 'ExerciseListPageRoute';
}

class ExerciseListPageRouteArgs {
  const ExerciseListPageRouteArgs(
      {this.key,
      required this.swap,
      required this.indexOfExercise,
      required this.trainingSessionPart});

  final Key? key;

  final bool swap;

  final int indexOfExercise;

  final bool trainingSessionPart;

  @override
  String toString() {
    return 'ExerciseListPageRouteArgs{key: $key, swap: $swap, indexOfExercise: $indexOfExercise, trainingSessionPart: $trainingSessionPart}';
  }
}

/// generated route for
/// [FullNamePage]
class FullNamePageRoute extends PageRouteInfo<void> {
  const FullNamePageRoute()
      : super(FullNamePageRoute.name, path: '/full-name-page');

  static const String name = 'FullNamePageRoute';
}

/// generated route for
/// [TikTokPage]
class TikTokPageRoute extends PageRouteInfo<void> {
  const TikTokPageRoute() : super(TikTokPageRoute.name, path: '/tik-tok-page');

  static const String name = 'TikTokPageRoute';
}

/// generated route for
/// [AboutPage]
class AboutPageRoute extends PageRouteInfo<void> {
  const AboutPageRoute() : super(AboutPageRoute.name, path: '/about-page');

  static const String name = 'AboutPageRoute';
}

/// generated route for
/// [TagsPage]
class TagsPageRoute extends PageRouteInfo<void> {
  const TagsPageRoute() : super(TagsPageRoute.name, path: '/tags-page');

  static const String name = 'TagsPageRoute';
}

/// generated route for
/// [CoverPhotoPage]
class CoverPhotoPageRoute extends PageRouteInfo<void> {
  const CoverPhotoPageRoute()
      : super(CoverPhotoPageRoute.name, path: '/cover-photo-page');

  static const String name = 'CoverPhotoPageRoute';
}

/// generated route for
/// [WelcomePage]
class WelcomePageRoute extends PageRouteInfo<void> {
  const WelcomePageRoute()
      : super(WelcomePageRoute.name, path: '/welcome-page');

  static const String name = 'WelcomePageRoute';
}

/// generated route for
/// [CreatorsOnboarding]
class CreatorsOnboardingRoute extends PageRouteInfo<void> {
  const CreatorsOnboardingRoute()
      : super(CreatorsOnboardingRoute.name, path: '/creators-onboarding');

  static const String name = 'CreatorsOnboardingRoute';
}

/// generated route for
/// [AuthorizationOnboarding]
class AuthorizationOnboardingRoute extends PageRouteInfo<void> {
  const AuthorizationOnboardingRoute()
      : super(AuthorizationOnboardingRoute.name,
            path: '/authorization-onboarding');

  static const String name = 'AuthorizationOnboardingRoute';
}

/// generated route for
/// [YearCalendarScreen]
class YearCalendarScreenRoute extends PageRouteInfo<void> {
  const YearCalendarScreenRoute()
      : super(YearCalendarScreenRoute.name, path: '/year-calendar-screen');

  static const String name = 'YearCalendarScreenRoute';
}

/// generated route for
/// [CalendarScreen]
class CalendarScreenRoute extends PageRouteInfo<void> {
  const CalendarScreenRoute()
      : super(CalendarScreenRoute.name, path: '/calendar-screen');

  static const String name = 'CalendarScreenRoute';
}

/// generated route for
/// [WelcomeCreatorPage]
class WelcomeCreatorPageRoute extends PageRouteInfo<void> {
  const WelcomeCreatorPageRoute()
      : super(WelcomeCreatorPageRoute.name, path: '/welcome-creator-page');

  static const String name = 'WelcomeCreatorPageRoute';
}

/// generated route for
/// [MainFlow]
class MainFlowRoute extends PageRouteInfo<MainFlowRouteArgs> {
  MainFlowRoute({Key? key, bool isEditing = false, String? sessionTemplateId})
      : super(MainFlowRoute.name,
            path: '/main-flow',
            args: MainFlowRouteArgs(
                key: key,
                isEditing: isEditing,
                sessionTemplateId: sessionTemplateId));

  static const String name = 'MainFlowRoute';
}

class MainFlowRouteArgs {
  const MainFlowRouteArgs(
      {this.key, this.isEditing = false, this.sessionTemplateId});

  final Key? key;

  final bool isEditing;

  final String? sessionTemplateId;

  @override
  String toString() {
    return 'MainFlowRouteArgs{key: $key, isEditing: $isEditing, sessionTemplateId: $sessionTemplateId}';
  }
}

/// generated route for
/// [HistoryPage]
class HistoryPageRoute extends PageRouteInfo<void> {
  const HistoryPageRoute()
      : super(HistoryPageRoute.name, path: '/history-page');

  static const String name = 'HistoryPageRoute';
}

/// generated route for
/// [EditPasswordPage]
class EditPasswordPageRoute extends PageRouteInfo<void> {
  const EditPasswordPageRoute()
      : super(EditPasswordPageRoute.name, path: '/edit-password-page');

  static const String name = 'EditPasswordPageRoute';
}

/// generated route for
/// [StartTrainingSessionPage]
class StartTrainingSessionPageRoute
    extends PageRouteInfo<StartTrainingSessionPageRouteArgs> {
  StartTrainingSessionPageRoute({Key? key})
      : super(StartTrainingSessionPageRoute.name,
            path: '/start-training-session-page',
            args: StartTrainingSessionPageRouteArgs(key: key));

  static const String name = 'StartTrainingSessionPageRoute';
}

class StartTrainingSessionPageRouteArgs {
  const StartTrainingSessionPageRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'StartTrainingSessionPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [TrainingHistoryPage]
class TrainingHistoryPageRoute extends PageRouteInfo<void> {
  const TrainingHistoryPageRoute()
      : super(TrainingHistoryPageRoute.name, path: '/training-history-page');

  static const String name = 'TrainingHistoryPageRoute';
}

/// generated route for
/// [SuperSetHistoryPage]
class SuperSetHistoryPageRoute extends PageRouteInfo<void> {
  const SuperSetHistoryPageRoute()
      : super(SuperSetHistoryPageRoute.name, path: '/super-set-history-page');

  static const String name = 'SuperSetHistoryPageRoute';
}

/// generated route for
/// [ExerciseSettingsPage]
class ExerciseSettingsPageRoute extends PageRouteInfo<void> {
  const ExerciseSettingsPageRoute()
      : super(ExerciseSettingsPageRoute.name, path: '/exercise-settings-page');

  static const String name = 'ExerciseSettingsPageRoute';
}

/// generated route for
/// [Intensity]
class IntensityRoute extends PageRouteInfo<void> {
  const IntensityRoute() : super(IntensityRoute.name, path: '/Intensity');

  static const String name = 'IntensityRoute';
}

/// generated route for
/// [WelcomeUserPage]
class WelcomeUserPageRoute extends PageRouteInfo<WelcomeUserPageRouteArgs> {
  WelcomeUserPageRoute({Key? key, required String username})
      : super(WelcomeUserPageRoute.name,
            path: '/welcome-user-page',
            args: WelcomeUserPageRouteArgs(key: key, username: username));

  static const String name = 'WelcomeUserPageRoute';
}

class WelcomeUserPageRouteArgs {
  const WelcomeUserPageRouteArgs({this.key, required this.username});

  final Key? key;

  final String username;

  @override
  String toString() {
    return 'WelcomeUserPageRouteArgs{key: $key, username: $username}';
  }
}

/// generated route for
/// [PersonalInfoPage]
class PersonalInfoPageRoute extends PageRouteInfo<PersonalInfoPageRouteArgs> {
  PersonalInfoPageRoute({Key? key, required String username})
      : super(PersonalInfoPageRoute.name,
            path: '/personal-info-page',
            args: PersonalInfoPageRouteArgs(key: key, username: username));

  static const String name = 'PersonalInfoPageRoute';
}

class PersonalInfoPageRouteArgs {
  const PersonalInfoPageRouteArgs({this.key, required this.username});

  final Key? key;

  final String username;

  @override
  String toString() {
    return 'PersonalInfoPageRouteArgs{key: $key, username: $username}';
  }
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordPageRoute
    extends PageRouteInfo<ForgotPasswordPageRouteArgs> {
  ForgotPasswordPageRoute({Key? key})
      : super(ForgotPasswordPageRoute.name,
            path: '/forgot-password-page',
            args: ForgotPasswordPageRouteArgs(key: key));

  static const String name = 'ForgotPasswordPageRoute';
}

class ForgotPasswordPageRouteArgs {
  const ForgotPasswordPageRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ForgotPasswordPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [VerifyCodePage]
class VerifyCodePageRoute extends PageRouteInfo<void> {
  const VerifyCodePageRoute()
      : super(VerifyCodePageRoute.name, path: '/verify-code-page');

  static const String name = 'VerifyCodePageRoute';
}

/// generated route for
/// [NewPasswordPage]
class NewPasswordPageRoute extends PageRouteInfo<NewPasswordPageRouteArgs> {
  NewPasswordPageRoute({Key? key})
      : super(NewPasswordPageRoute.name,
            path: '/new-password-page',
            args: NewPasswordPageRouteArgs(key: key));

  static const String name = 'NewPasswordPageRoute';
}

class NewPasswordPageRouteArgs {
  const NewPasswordPageRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'NewPasswordPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [PasswordChangedPage]
class PasswordChangedPageRoute extends PageRouteInfo<void> {
  const PasswordChangedPageRoute()
      : super(PasswordChangedPageRoute.name, path: '/password-changed-page');

  static const String name = 'PasswordChangedPageRoute';
}

/// generated route for
/// [UserWebViewPage]
class UserWebViewPageRoute extends PageRouteInfo<UserWebViewPageRouteArgs> {
  UserWebViewPageRoute({Key? key, required String appBarTitle})
      : super(UserWebViewPageRoute.name,
            path: '/user-web-view-page',
            args: UserWebViewPageRouteArgs(key: key, appBarTitle: appBarTitle));

  static const String name = 'UserWebViewPageRoute';
}

class UserWebViewPageRouteArgs {
  const UserWebViewPageRouteArgs({this.key, required this.appBarTitle});

  final Key? key;

  final String appBarTitle;

  @override
  String toString() {
    return 'UserWebViewPageRouteArgs{key: $key, appBarTitle: $appBarTitle}';
  }
}
