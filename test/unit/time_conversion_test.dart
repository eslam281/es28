import 'package:flutter_test/flutter_test.dart';
import 'package:es28/core/functions/StringToTime.dart';
import 'package:es28/core/functions/converTime24_12.dart';

void main() {
  group('Time Conversion Tests', () {
    test('convertTimeToMinutes should return correct minutes', () {
      expect(convertTimeToMinutes("01:30"), 90);
      expect(convertTimeToMinutes("12:00"), 720);
      expect(convertTimeToMinutes("23:59"), 1439);
    });

    test('minutesToTimeLabel should format minutes correctly (12h)', () {
      expect(minutesToTimeLabel(90), "01:30");
      expect(minutesToTimeLabel(720), "12:00");
      expect(minutesToTimeLabel(780), "01:00"); // 13:00 -> 01:00
      expect(minutesToTimeLabel(1439), "11:59"); // 23:59 -> 11:59
    });

    test('convertF should convert 24h to 12h format', () {
      expect(convertF("13:30"), "01:30");
      expect(convertF("00:15"), "12:15");
      expect(convertF("12:00"), "12:00");
    });
  });
}
