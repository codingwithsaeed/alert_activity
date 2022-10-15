import 'package:alert_activity/alert_activity.dart';
import 'package:flutter/material.dart';

final alert = AlertActivity();

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Alert Plugin')),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                alert.showActivity(
                  time: '22:19',
                  title: 'title',
                  description: 'description',
                );
              },
              child: const Text('Show Alert')),
        ),
      ),
    );
  }
}
