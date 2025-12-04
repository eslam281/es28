int convertTimeToMinutes(String time) {
  final parts = time.split(":");
  final hour = int.parse(parts[0]);
  final minute = int.parse(parts[1].split(" ")[0]);
  return hour * 60 + minute;
}
String minutesToTimeLabel(int minutes) {
  final hh = minutes ~/ 60;
  final mm = minutes % 60;
  final hhStr = hh.toString().padLeft(2, '0');
  final mmStr = mm.toString().padLeft(2, '0');
  return '$hhStr:$mmStr';
}
