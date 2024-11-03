import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todos/Models/UserTask.dart';
import 'package:todos/Providers/UserTaskProvider.dart';
import 'package:todos/Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserTaskProvider(),)
        ],
          child: HomeScreen()),
    );
  }
}