import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'config/app_theme.dart'; // Make sure this path is correct.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const GitLoveApp());
}

class GitLoveApp extends StatelessWidget {
  const GitLoveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitLove',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const SplashScreen(), // Launching the splash screen first.
    );
  }
}
