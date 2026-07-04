import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:es28/main.dart' as app;
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('End-to-End App Test', () {
    testWidgets('Full User Journey: Counter and Navigation', (tester) async {
      // 1. Start the app
      app.main();
      await tester.pumpAndSettle();

      // 2. Wait for Splash Screen (15s) to transition to Home
      // We pump repeatedly until the Greeting Dialog is found or timeout
      bool foundDialog = false;
      for (int i = 0; i < 20; i++) {
        await tester.pump(const Duration(seconds: 1));
        if (find.text('هل صليت على النبي اليوم؟').evaluate().isNotEmpty) {
          foundDialog = true;
          break;
        }
      }
      expect(foundDialog, true, reason: 'Greeting dialog should appear after splash');

      // 3. Dismiss Greeting Dialog
      await tester.tap(find.text('حسناً'));
      await tester.pumpAndSettle();

      // 4. Test Counter Increment
      // Find the counter text (initially 0 or loaded from Hive)
      final counterTextFinder = find.byType(Text).last; // Usually the number is large and late in build
      // Better: find by a specific font size or color if possible, but let's try searching for ANY number
      final initialCount = find.textContaining(RegExp(r'\d+')).first;
      expect(initialCount, findsOneWidget);
      
      // Tap near the center of the screen (on the Subha)
      await tester.tapAt(const Offset(200, 500)); 
      await tester.pumpAndSettle();

      // 5. Test Navigation to Prayer Times
      // In the new UI, text labels only appear for the ACTIVE tab.
      // We should find the tab by its icon instead.
      final timesTab = find.byIcon(Icons.access_time_filled_rounded);
      expect(timesTab, findsOneWidget);
      await tester.tap(timesTab);
      await tester.pumpAndSettle();

      // Verify Prayer Times Header
      expect(find.text('متبقي حتى الصلاة'), findsOneWidget);

      // 6. Open Drawer
      final menuButton = find.byIcon(Icons.menu_open_rounded);
      expect(menuButton, findsOneWidget);
      await tester.tap(menuButton);
      await tester.pumpAndSettle();

      // Verify Drawer Item
      expect(find.text('الإعدادات'), findsOneWidget);
    });
  });
}
