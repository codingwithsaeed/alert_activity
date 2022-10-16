import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'alert_activity_method_channel.dart';

abstract class AlertActivityPlatform extends PlatformInterface {
  /// Constructs a AlertActivityPlatform.
  AlertActivityPlatform() : super(token: _token);

  static final Object _token = Object();

  static AlertActivityPlatform _instance = MethodChannelAlertActivity();

  /// The default instance of [AlertActivityPlatform] to use.
  ///
  /// Defaults to [MethodChannelAlertActivity].
  static AlertActivityPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AlertActivityPlatform] when
  /// they register themselves.
  static set instance(AlertActivityPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool?> showActivity({
    required String time,
    required String title,
    required String description,
    required VoidCallback onClose,
  });
}
