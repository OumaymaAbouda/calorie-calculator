import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const InputField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.number,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.textSecondary),
            prefixIcon: const Icon(
              Icons.edit_outlined,
              color: AppColors.textSecondary,
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Veuillez remplir ce champ';
            }

            if (double.tryParse(value) == null ||
                double.parse(value) <= 0) {
              return 'Veuillez saisir une valeur valide';
            }

            return null;
          },
        ),
      ],
    );
  }
}