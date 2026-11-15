import '../models/user_data.dart';
import '../models/calorie_result.dart';

class CalorieService {
  static CalorieResult calculate(UserData user) {
    // Calcul du métabolisme de base (BMR)
    double bmr;

    if (user.gender == 'Homme') {
      bmr = (10 * user.weight) +
          (6.25 * user.height) -
          (5 * user.age) +
          5;
    } else {
      bmr = (10 * user.weight) +
          (6.25 * user.height) -
          (5 * user.age) -
          161;
    }

    // Calcul des besoins caloriques quotidiens
    double dailyCalories = bmr * user.activityLevel;

    // Classification du résultat
    String classification;
    String message;
    int colorLevel;

    if (dailyCalories < 1800) {
      classification = 'Faible';
      message = 'Vos besoins caloriques sont faibles.';
      colorLevel = 1;
    } else if (dailyCalories < 2500) {
      classification = 'Modéré';
      message = 'Vos besoins caloriques sont modérés.';
      colorLevel = 2;
    } else if (dailyCalories < 3200) {
      classification = 'Élevé';
      message = 'Vos besoins caloriques sont élevés.';
      colorLevel = 3;
    } else {
      classification = 'Très élevé';
      message = 'Vos besoins caloriques sont très élevés.';
      colorLevel = 4;
    }

    return CalorieResult(
      bmr: bmr,
      dailyCalories: dailyCalories,
      classification: classification,
      message: message,
      colorLevel: colorLevel,
    );
  }
}