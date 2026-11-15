
import 'package:flutter/material.dart';

import '../models/user_data.dart';
import '../models/calorie_result.dart';
import '../services/calorie_service.dart';
import '../utils/app_colors.dart';

import '../widgets/gender_selector.dart';
import '../widgets/input_field.dart';
import '../widgets/activity_dropdown.dart';
import '../widgets/calculate_button.dart';
import '../widgets/result_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  String selectedGender = 'Homme';
  double selectedActivity = 1.2;

  void calculateCalories() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final int? age = int.tryParse(ageController.text.trim());

    if (age == null || age <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez saisir un âge entier valide.'),
        ),
      );
      return;
    }

    final double weight =
    double.parse(weightController.text.trim());

    final double height =
    double.parse(heightController.text.trim());

    final user = UserData(
      gender: selectedGender,
      age: age,
      weight: weight,
      height: height,
      activityLevel: selectedActivity,
    );

    final CalorieResult result = CalorieService.calculate(user);

    // Afficher les résultats dans une fenêtre popup
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Vos résultats',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: ResultCard(result: result),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text(
                'Fermer',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculateur de Calories',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Calculez vos besoins énergétiques',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Renseignez vos informations personnelles.',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 25),

              GenderSelector(
                selectedGender: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              InputField(
                label: 'Âge',
                hint: 'Exemple : 22',
                controller: ageController,
              ),

              const SizedBox(height: 20),

              InputField(
                label: 'Poids (kg)',
                hint: 'Exemple : 65',
                controller: weightController,
              ),

              const SizedBox(height: 20),

              InputField(
                label: 'Taille (cm)',
                hint: 'Exemple : 170',
                controller: heightController,
              ),

              const SizedBox(height: 20),

              ActivityDropdown(
                selectedActivity: selectedActivity,
                onChanged: (value) {
                  setState(() {
                    selectedActivity = value!;
                  });
                },
              ),

              const SizedBox(height: 25),

              CalculateButton(
                onPressed: calculateCalories,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
