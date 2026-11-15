import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class GenderSelector extends StatelessWidget {
  final String selectedGender;
  final ValueChanged<String?> onChanged;

  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Sexe',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          RadioListTile<String>(
            title: const Text('Homme'),
            value: 'Homme',
            groupValue: selectedGender,
            activeColor: AppColors.primary,
            onChanged: onChanged,
          ),
          RadioListTile<String>(
            title: const Text('Femme'),
            value: 'Femme',
            groupValue: selectedGender,
            activeColor: AppColors.primary,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}