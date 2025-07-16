

import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'getlocation.dart';
String? timingUrl;
Position? position;
Future<void> reverseGeocode() async {
  position = await determinePosition();
  if(position == null) return;
  final String url = "https://nominatim.openstreetmap.org/reverse?"
      "lat=${position?.latitude}&lon=${position?.longitude}&format=json&accept-language=en";

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      timingUrl = "https://api.aladhan.com/v1/timingsByCity?city=${data["address"]["state"]}&country=${data["address"]["country"]}&method=5#";
    } else {

    }
  } catch (e) {

  }
}