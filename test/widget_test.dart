import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart'; // Adjust the import path as per your project structure

void main() {
  testWidgets('Check if the TipCalculatorScreen displays correctly',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(TipCalculatorApp());

    // Verify if the necessary widgets are displayed
    expect(find.text('Bill Amount (₹)'), findsOneWidget);
    expect(find.text('Tip Percentage: 15.00%'), findsOneWidget);
    expect(find.text('Number of Employees'), findsOneWidget);
    expect(find.text('Split Bill?'), findsOneWidget);
  });

  // Add more test cases as needed
}
