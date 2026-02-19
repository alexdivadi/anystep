import 'package:anystep/core/app_startup/app_startup_loading_widget.dart';
import 'package:anystep/core/features/screens.dart';

class RouterUtils {
  static const unauthenticatedRoutes = {
    EventFeedScreen.pathAnonymous,
    SettingsScreen.pathAnonymous,
  };
  static const volunteerRoutes = {EventFeedScreen.path, SettingsScreen.path};
  static const adminRoutes = {
    EventFeedScreen.pathAdmin,
    SettingsScreen.pathAdmin,
    ReportsScreen.pathAdmin,
  };

  static const anyRoutes = {
    LoginScreen.path,
    SignUpScreen.path,
    ForgotPasswordScreen.path,
    ResetPasswordScreen.path,
    ConfirmEmailScreen.path,
    EmailConfirmedScreen.path,
    WelcomeScreen.path,
    AppStartupLoadingWidget.path,
    UserOnboardedGate.path,
    EventDetailScreen.path,
    SignAgreementScreen.path,
    AboutScreen.path,
    NotificationSettingsScreen.path,
  };

  static const loginRoutes = {LoginScreen.path, SignUpScreen.path, ConfirmEmailScreen.path};

  static const onboardingRoutes = {UserOnboardedGate.path, OnboardingScreen.path};
}
