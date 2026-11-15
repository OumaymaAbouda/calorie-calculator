import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class ActivityDropdown extends StatelessWidget {
  final double selectedActivity;
  final ValueChanged<double?> onChanged;

  const ActivityDropdown({
    super.key,
    required this.selectedActivity,
    required this.onChanged,
  });

  final List<Map<String, dynamic>> activities = const [
    {'label': 'Sédentaire', 'value': 1.2},
    {'label': 'Légère', 'value': 1.375},
    {'label': 'Modérée', 'value': 1.55},
    {'label': 'Intense', 'value': 1.725},
    {'label': 'Très intense', 'value': 1.9},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Niveau d’activité physique',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<double>(
          initialValue: selectedActivity,
          dropdownColor: AppColors.cardBackground,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.fitness_center,
              color: AppColors.textSecondary,
            ),
          ),
          items: activities.map((activity) {
            return DropdownMenuItem<double>(
              value: activity['value'],
              child: Text(activity['label']),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}