import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:es28/view/component/custom.dart';

void main() {
  testWidgets('CustomButton renders and triggers onPressed', (WidgetTester tester) async {
    bool pressed = false;
    
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            onPressed: () {
              pressed = true;
            },
          ),
        ),
      ),
    );

    // Verify Subha image is rendered via byIcon or image logic if possible, 
    // but easiest is by type of GestureDetector or CustomButton itself.
    expect(find.byType(CustomButton), findsOneWidget);

    // Tap the button
    await tester.tap(find.byType(CustomButton));
    await tester.pump();

    expect(pressed, true);
  });
}
