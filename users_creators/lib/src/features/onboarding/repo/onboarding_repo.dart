import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

class OnboardingRepo {
  Future<bool> isOnboardingBeenShown() async {
    final isOnboardingBeenShown = GetIt.I<SharedPreferences>()
        .getBool('onboaring_module.isonboardingbeenshown');
    return isOnboardingBeenShown ?? false;
  }

  Future<bool> setOnboardingBeenShown() async {
    final isOnboardingBeenShown = await GetIt.I<SharedPreferences>()
        .setBool('onboaring_module.isonboardingbeenshown', true);
    return isOnboardingBeenShown;
  }

  Future<void> resetOnboarding() async {
    await GetIt.I<SharedPreferences>()
        .remove('onboaring_module.isonboardingbeenshown');
  }
}