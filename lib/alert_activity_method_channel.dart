import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'alert_activity_platform_interface.dart';

/// An implementation of [AlertActivityPlatform] that uses method channels.
class MethodChannelAlertActivity extends AlertActivityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('alert_activity');

  @override
  Future<bool?> showActivity({required String time, required String title, required String description}) async {
    if (Platform.isAndroid) {
      var args = {'time': time, 'title': title, 'description': description};
      return await methodChannel.invokeMethod('openAlertActivity', args);
    }
    return Future.value(false);
  }
}
