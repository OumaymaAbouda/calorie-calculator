class CalorieResult {
  final double bmr;
  final double dailyCalories;
  final String classification;
  final String message;
  final int colorLevel;

  CalorieResult({
    required this.bmr,
    required this.dailyCalories,
    required this.classification,
    required this.message,
    required this.colorLevel,
  });
}