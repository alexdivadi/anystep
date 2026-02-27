import 'package:anystep/core/common/utils/log_utils.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'remote_config.g.dart';

class RemoteConfigKeys {
  const RemoteConfigKeys._();

  static const String welcomeMessage = 'welcomeMessage';
  static const String maintenanceMessage = 'maintenance_message';
}

class RemoteConfigService {
  RemoteConfigService(this._remoteConfig);

  final FirebaseRemoteConfig _remoteConfig;

  String get welcomeMessage => _remoteConfig.getString(RemoteConfigKeys.welcomeMessage).trim();
  String get maintenanceMessage =>
      _remoteConfig.getString(RemoteConfigKeys.maintenanceMessage).trim();
}

@Riverpod(keepAlive: true)
Future<RemoteConfigService> remoteConfig(Ref ref) async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  try {
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );
    await remoteConfig.setDefaults({
      RemoteConfigKeys.welcomeMessage: '',
      RemoteConfigKeys.maintenanceMessage: '',
    });
    await remoteConfig.fetchAndActivate();
  } catch (e, st) {
    Log.w('Remote config fetch failed', e, st);
  }
  return RemoteConfigService(remoteConfig);
}
