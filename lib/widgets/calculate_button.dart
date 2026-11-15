import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class CalculateButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CalculateButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.calculate_outlined),
        label: const Text(
          'Calculer mes calories',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}