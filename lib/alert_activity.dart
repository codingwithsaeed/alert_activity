import 'package:flutter/foundation.dart';

import 'alert_activity_platform_interface.dart';

class AlertActivity {
  Future<bool?> showActivity({
    required String time,
    required String title,
    required String description,
    required VoidCallback onClose,
  }) async {
    return await AlertActivityPlatform.instance.showActivity(
      time: time,
      title: title,
      description: description,
      onClose: onClose,
    );
  }
}
