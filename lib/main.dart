import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:study_mesh/config/theme.dart';
import 'package:study_mesh/features/tasks/presentation/tasks_screen.dart';
import 'package:study_mesh/firebase_options.dart';

import 'services/notfication_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
  final notificationService = NotificationService();
  await notificationService.initialize();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Reminder App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const TasksScreen());
  }
}
