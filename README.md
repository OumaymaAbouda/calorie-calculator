# Calorie Calculator

A Flutter application that calculates daily calorie needs based on personal information and physical activity level.

## Features

- Gender selection (Male / Female)
- Age, weight, and height input
- Five physical activity levels
- Basal Metabolic Rate (BMR) calculation
- Daily calorie needs estimation
- Calorie classification with dynamic colors
- Results displayed in a popup dialog
- Dark theme with a modern interface

## Calculation Method

The application uses the **Mifflin-St Jeor equation** to calculate BMR.

**For men:**
```text
BMR = (10 × weight) + (6.25 × height) - (5 × age) + 5
```

**For women:**
```text
BMR = (10 × weight) + (6.25 × height) - (5 × age) - 161
```

Daily calorie needs are calculated as:

```text
Daily Calories = BMR × Activity Factor
```

### Activity Levels

| Activity Level | Factor |
|---|---:|
| Sedentary | 1.2 |
| Light | 1.375 |
| Moderate | 1.55 |
| Intense | 1.725 |
| Very Intense | 1.9 |

## Technologies Used

- Flutter
- Dart
- Material Design

## Project Structure

```text
lib/
├── main.dart
├── models/
│   ├── user_data.dart
│   └── calorie_result.dart
├── services/
│   └── calorie_service.dart
├── screens/
│   └── home_screen.dart
├── widgets/
│   ├── gender_selector.dart
│   ├── input_field.dart
│   ├── activity_dropdown.dart
│   ├── calculate_button.dart
│   ├── result_card.dart
│   └── calorie_gauge.dart
└── utils/
    ├── app_colors.dart
    └── app_theme.dart
```

## Installation and Execution

1. Clone the repository:

```bash
git clone https://github.com/OumaymaAbouda/calorie-calculator.git
```

2. Navigate to the project directory:

```bash
cd calorie-calculator
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run
```

## Author

**Oumaima Abouda**

Engineering Student in Cloud Computing and Networks

EPI Digital School – Sousse, Tunisia
