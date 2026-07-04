import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:es28/view/component/athkar/customAthkarCard.dart';

void main() {
  testWidgets('CustomAthkarCard renders and handles tap', (WidgetTester tester) async {
    bool tapped = false;
    
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomAthkarCard(
            elthakr: 'سبحان الله',
            max: 33,
            count: 10,
            textScaler: 1.0,
            completed: false,
            onTap: () {
              tapped = true;
            },
            edit: () {},
            delete: () {},
          ),
        ),
      ),
    );

    expect(find.text('سبحان الله'), findsOneWidget);
    expect(find.text('10 / 33'), findsOneWidget);

    // Tap the 'تسبيح' button
    await tester.tap(find.text('تسبيح'));
    await tester.pump();

    expect(tapped, true);
  });
}
