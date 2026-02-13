import 'dart:async';

import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:anystep/core/config/router/router.dart';
import 'package:anystep/core/features/auth/presentation/email_confirmed/email_confirmed_screen.dart';
import 'package:anystep/core/features/auth/presentation/reset_password/reset_password_screen.dart';
import 'package:anystep/database/client.dart';
import 'package:app_links/app_links.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'deep_link_handler.g.dart';

@Riverpod(keepAlive: true)
class DeepLinkHandler extends _$DeepLinkHandler {
  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _subscription;

  @override
  void build() {
    _subscription = _appLinks.uriLinkStream.listen(
      _handleUri,
      onError: (error, stackTrace) {
        Log.w('Deep link stream error', error, stackTrace);
      },
    );

    _appLinks.getInitialLink().then(_handleUri).catchError((error, stackTrace) {
      Log.w('Failed to get initial deep link', error, stackTrace);
    });

    ref.onDispose(() {
      _subscription?.cancel();
    });
  }

  Future<void> _handleUri(Uri? uri) async {
    if (uri == null) return;
    final authParams = _authParams(uri);
    if (_shouldHandleAuthLink(authParams)) {
      try {
        final response = await ref.read(clientProvider).auth.getSessionFromUrl(uri);
        if (authParams['type'] == 'recovery' || response.redirectType == 'recovery') {
          ref.read(routerProvider).go(ResetPasswordScreen.path);
          return;
        }
        if (authParams['type'] == 'signup' || response.redirectType == 'signup') {
          ref.read(routerProvider).go(EmailConfirmedScreen.path);
          return;
        }
      } catch (error, stackTrace) {
        Log.w('Failed to handle auth deep link', error, stackTrace);
      }
    }
    final location = _toLocation(uri, includeQuery: !_containsSensitiveTokens(authParams));
    if (location == null) return;
    final router = ref.read(routerProvider);
    router.go(location);
  }

  String? _toLocation(Uri uri, {bool includeQuery = true}) {
    final scheme = uri.scheme.toLowerCase();
    String path;

    if (scheme == 'http' || scheme == 'https') {
      path = uri.path;
    } else if (uri.host.isNotEmpty) {
      path = _combineHostAndPath(uri.host, uri.path);
    } else {
      path = uri.path;
    }

    if (path.isEmpty) return null;
    if (!path.startsWith('/')) {
      path = '/$path';
    }

    final query = includeQuery && uri.hasQuery ? '?${uri.query}' : '';
    return '$path$query';
  }

  String _combineHostAndPath(String host, String path) {
    if (path.isEmpty || path == '/') {
      return '/$host';
    }
    if (path.startsWith('/')) {
      return '/$host$path';
    }
    return '/$host/$path';
  }

  Map<String, String> _authParams(Uri uri) {
    final params = <String, String>{}..addAll(uri.queryParameters);
    if (uri.hasFragment) {
      try {
        params.addAll(Uri.splitQueryString(uri.fragment));
      } catch (_) {
        // Ignore malformed fragments.
      }
    }
    return params;
  }

  bool _shouldHandleAuthLink(Map<String, String> params) {
    final hasTokens = params.containsKey('access_token') &&
        params.containsKey('refresh_token') &&
        params.containsKey('expires_in') &&
        params.containsKey('token_type');
    final hasCode = params.containsKey('code');
    return hasTokens || hasCode;
  }

  bool _containsSensitiveTokens(Map<String, String> params) {
    return params.containsKey('access_token') || params.containsKey('refresh_token');
  }
}
