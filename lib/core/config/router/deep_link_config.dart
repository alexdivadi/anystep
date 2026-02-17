import 'package:anystep/core/features/auth/presentation/email_confirmed/email_confirmed_screen.dart';
import 'package:anystep/core/features/auth/presentation/reset_password/reset_password_screen.dart';
import 'package:flutter/foundation.dart';

class DeepLinkConfig {
  static const String appLinkHost = 'anystep-community-services.web.app';
  static const String customScheme = 'anystep';

  static Uri passwordResetRedirect() {
    if (kIsWeb) {
      final base = Uri.base;
      final isLocalhost = base.host == 'localhost' || base.host == '127.0.0.1';
      final port = base.hasPort ? base.port : (isLocalhost ? 3000 : null);
      return base.replace(
        path: '/',
        query: '',
        fragment: ResetPasswordScreen.path,
        port: port,
      );
    }

    return Uri.parse('https://$appLinkHost${ResetPasswordScreen.path}');
  }

  static Uri emailConfirmationRedirect() {
    if (kIsWeb) {
      final base = Uri.base;
      final isLocalhost = base.host == 'localhost' || base.host == '127.0.0.1';
      final port = base.hasPort ? base.port : (isLocalhost ? 3000 : null);
      return base.replace(
        path: '/',
        query: '',
        fragment: EmailConfirmedScreen.path,
        port: port,
      );
    }

    return Uri.parse('https://$appLinkHost${EmailConfirmedScreen.path}');
  }
}
