import 'alert_activity_platform_interface.dart';

class AlertActivity {
  Future<bool?> showActivity({
    required String time,
    required String title,
    required String description,
  }) async {
    return await AlertActivityPlatform.instance
        .showActivity(time: time, title: title, description: description);
  }
}
