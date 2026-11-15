import 'package:flutter/material.dart';
import '../models/calorie_result.dart';
import '../utils/app_colors.dart';
import 'calorie_gauge.dart';

class ResultCard extends StatelessWidget {
  final CalorieResult result;

  const ResultCard({
    super.key,
    required this.result,
  });

  Color getResultColor() {
    switch (result.colorLevel) {
      case 1:
        return AppColors.low;
      case 2:
        return AppColors.medium;
      case 3:
        return AppColors.high;
      case 4:
        return AppColors.veryHigh;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color resultColor = getResultColor();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Votre résultat',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Métabolisme de base (BMR)',
              style: TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 5),
            Text(
              '${result.bmr.toStringAsFixed(0)} kcal/jour',
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Besoins caloriques quotidiens',
              style: TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 5),
            Text(
              '${result.dailyCalories.toStringAsFixed(0)} kcal',
              style: TextStyle(
                color: resultColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: resultColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                result.classification,
                style: TextStyle(
                  color: resultColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              result.message,
              style: const TextStyle(
                color: AppColors.textSecondary,
              ),
            ),

            const SizedBox(height: 25),

            CalorieGauge(
              calories: result.dailyCalories,
              color: resultColor,
            ),
          ],
        ),
      ),
    );
  }
}