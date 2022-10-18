import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_creators/src/features/calendar/calendar_screen.dart';
import 'package:users_creators/src/features/calendar/year_calendar_screen.dart';
import 'package:users_creators/src/features/create_session/ui/pages/exercise_list_page.dart';
import 'package:users_creators/src/features/create_session/ui/pages/main_flow.dart';
import 'package:users_creators/src/features/create_session/ui/widgets/history/history_page.dart';
import 'package:users_creators/src/features/discover/presentation/search_page.dart';
import 'package:users_creators/src/features/library/ui/pages/library_page.dart';
import 'package:users_creators/src/features/login/presentation/ui/creators_signup_page/authorization.dart';
import 'package:users_creators/src/features/login/presentation/ui/users_login_page/user_login.dart';
import 'package:users_creators/src/features/login/presentation/ui/welcome_page/personal_info.dart';
import 'package:users_creators/src/features/settings/presentation/profile/presentation/user_profile_page.dart';
import 'package:users_creators/src/features/training_session/ui/pages/exercise_settings_page.dart';
import 'package:users_creators/src/features/training_session/ui/pages/history_page.dart';
import 'package:users_creators/src/features/training_session/ui/pages/intensity.dart';
import 'package:users_creators/src/features/training_session/ui/pages/start_training_page.dart';
import 'package:users_creators/src/features/training_session/ui/widgets/history/super_set_history.dart';

import '../../features/bottom/bottom_bar_page.dart';
import '../../features/creator/ui/pages/creator_page.dart';
import '../../features/creator/ui/pages/workouts_details_page/workouts_details_page.dart';
import '../../features/creator/ui/pages/workouts_view_all_page/workouts_view_all_page.dart';
import '../../features/dashboard/user_dashboard/user_dashboard_page.dart';
import '../../features/discover/presentation/discover_page.dart';
import '../../features/discover/presentation/discover_result_page.dart';
import '../../features/login/presentation/ui/user_signup/user_sign_up_page.dart';
import '../../features/login/presentation/ui/welcome_page/welcome_page.dart';
import '../../features/login/presentation/ui/welcome_page/welcome_user_page.dart';
import '../../features/login/reset_password/presentation/forgot_password_page.dart';
import '../../features/login/reset_password/presentation/new_password_page.dart';
import '../../features/login/reset_password/presentation/password_changed_page.dart';
import '../../features/login/reset_password/presentation/verify_code_page.dart';
import '../../features/onboarding/onboarding.dart';
import '../../features/onboarding_creator/presentation/creators_onboarding.dart';
import '../../features/onboarding_creator/presentation/pages/about_page.dart';
import '../../features/onboarding_creator/presentation/pages/cover_photo_page.dart';
import '../../features/onboarding_creator/presentation/pages/full_name_page.dart';
import '../../features/onboarding_creator/presentation/pages/tags_page.dart';
import '../../features/onboarding_creator/presentation/pages/tik_tok_page.dart';
import '../../features/onboarding_creator/presentation/pages/welcome_page.dart';
import '../../features/settings/presentation/profile/presentation/edit_password_page.dart';
import '../../features/settings/presentation/profile/presentation/edit_profile_page.dart';
import '../../features/settings/presentation/settings/settings_page.dart';
import '../../features/settings/presentation/webview_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: Onboarding, initial: true),
    AutoRoute(page: UserLogin),
    AutoRoute(page: UserSignUp),
    AutoRoute(page: DiscoverPage),
    AutoRoute(page: DiscoverSearchPage),
    AutoRoute(page: DiscoverResultPage),
    AutoRoute(page: UserProfilePage),
    AutoRoute(page: EditProfilePage),
    AutoRoute(page: SettingsPage),
    AutoRoute(page: BottomBarPage),
    AutoRoute(page: UserDashboard),
    AutoRoute(page: LibraryPage),
    AutoRoute(page: CreatorPage),
    AutoRoute(page: WorkoutsViewAllPage),
    AutoRoute(page: WorkoutsDetailsPage),
    AutoRoute(page: ExerciseListPage),
    AutoRoute(page: FullNamePage),
    AutoRoute(page: TikTokPage),
    AutoRoute(page: AboutPage),
    AutoRoute(page: TagsPage),
    AutoRoute(page: CoverPhotoPage),
    AutoRoute(page: WelcomePage),
    AutoRoute(page: CreatorsOnboarding),
    AutoRoute(page: AuthorizationOnboarding),
    AutoRoute(page: YearCalendarScreen),
    AutoRoute(page: CalendarScreen),
    AutoRoute(page: WelcomeCreatorPage),
    AutoRoute(page: MainFlow),
    // AutoRoute(page: AddedExercises),
    AutoRoute(page: HistoryPage),
    AutoRoute(page: EditPasswordPage),
    AutoRoute(page: StartTrainingSessionPage),
    AutoRoute(page: TrainingHistoryPage),
    AutoRoute(page: SuperSetHistoryPage),
    AutoRoute(page: ExerciseSettingsPage),
    AutoRoute(page: Intensity),
    AutoRoute(page: WelcomeUserPage),
    AutoRoute(page: PersonalInfoPage),

    AutoRoute(page: ForgotPasswordPage),
    AutoRoute(page: VerifyCodePage),
    AutoRoute(page: NewPasswordPage),
    AutoRoute(page: PasswordChangedPage),
    AutoRoute(page: UserWebViewPage),
  ],
)
class AppRouter extends _$AppRouter {}
