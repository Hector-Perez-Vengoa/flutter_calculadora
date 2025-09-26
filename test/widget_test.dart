// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:calculadora_perez/main.dart';

void main() {
  testWidgets('La calculadora se renderiza correctamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp());

    expect(find.text('1950'), findsOneWidget);
    expect(find.text('450 + 500 + 1000'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
    expect(find.text('÷'), findsOneWidget);
  });
}
