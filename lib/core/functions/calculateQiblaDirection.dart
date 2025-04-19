import 'dart:math' as math;

double calculateQiblaDirection(double userLat, double userLng) {
  const kaabaLat = 21.4224779;
  const kaabaLng = 39.8251832;

  double lat1 = userLat * math.pi / 180;
  double lon1 = userLng * math.pi / 180;
  double lat2 = kaabaLat * math.pi / 180;
  double lon2 = kaabaLng * math.pi / 180;

  double dLon = lon2 - lon1;

  double y = math.sin(dLon) * math.cos(lat2);
  double x = math.cos(lat1) * math.sin(lat2) -
      math.sin(lat1) * math.cos(lat2) * math.cos(dLon);

  double bearing = math.atan2(y, x);
  bearing = bearing * 180 / math.pi;
  bearing = (bearing + 360) % 360; // Normalize to 0-360

  return bearing;
}
