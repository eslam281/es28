int convertTimeToMinutes(String time) {
  final parts = time.split(":");
  final hour = int.parse(parts[0]);
  final minute = int.parse(parts[1].split(" ")[0]);
  return hour * 60 + minute;
}
