import 'package:flutter_test/flutter_test.dart';
import 'package:calorie_calculator/main.dart';

void main() {
  testWidgets('Application starts successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const CalorieCalculatorApp());

    expect(find.text('Calculateur de Calories'), findsOneWidget);
  });
}