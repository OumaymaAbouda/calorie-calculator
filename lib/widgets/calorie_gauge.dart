import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CalorieGauge extends StatelessWidget {
  final double calories;
  final Color color;

  const CalorieGauge({
    super.key,
    required this.calories,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (calories / 4000).clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Niveau calorique',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              '4000 kcal',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 14,
            backgroundColor: AppColors.border,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '${calories.toStringAsFixed(0)} kcal',
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}