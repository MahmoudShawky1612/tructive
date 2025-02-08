import 'package:flutter/material.dart';
import 'package:tructivee/screens/start_screen.dart';
import 'package:tructivee/theme/app_theme.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.buildTheme(),
      home: StartScreen(),
    );
  }
}












