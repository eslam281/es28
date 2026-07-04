import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:es28/view/component/home/timeTile.dart';

void main() {
  testWidgets('LuxuryTimeTile renders title and time', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LuxuryTimeTile(
            title: 'الفجر',
            time: '04:30',
            icon: Icons.wb_twilight_rounded,
            accentColor: Colors.blue,
            isNext: true,
          ),
        ),
      ),
    );

    expect(find.text('الفجر'), findsOneWidget);
    expect(find.text('04:30'), findsOneWidget);
    expect(find.text('الصلاة القادمة'), findsOneWidget);
  });
}
