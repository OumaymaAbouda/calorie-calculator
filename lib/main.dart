import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(const CalorieCalculatorApp());
}

class CalorieCalculatorApp extends StatelessWidget {
  const CalorieCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculateur de Calories',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}