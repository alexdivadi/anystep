import 'package:anystep/core/app_startup/app_startup_loading_widget.dart';
import 'package:anystep/core/features/screens.dart';

class RouterUtils {
  static const unauthenticatedRoutes = {
    LoginScreen.path,
    SignUpScreen.path,
    ConfirmEmailScreen.path,
    WelcomeScreen.path,
    AppStartupLoadingWidget.path,
    EventFeedScreen.pathAnonymous,
    EventDetailScreen.path,
    SettingsScreen.pathAnonymous,
    UserOnboardedGate.path,
    OnboardingScreen.path,
  };

  static const loginRoutes = {LoginScreen.path, SignUpScreen.path, ConfirmEmailScreen.path};
}
