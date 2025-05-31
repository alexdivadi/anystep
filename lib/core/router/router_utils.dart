import 'package:anystep/core/app_startup/app_startup_loading_widget.dart';
import 'package:anystep/core/features/screens.dart';

class RouterUtils {
  static const unauthenticatedRoutes = {
    LoginScreen.path,
    SignUpScreen.path,
    OnboardingScreen.path,
    AppStartupLoadingWidget.path,
  };
}
