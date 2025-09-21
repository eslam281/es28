

import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../constant/apiLink.dart';
import 'getlocation.dart';
Future<String> reverseGeocode() async {
Position? position;

  position = await determinePosition();
  if(position == null) return "";
  final String url = "${ApiLink.LocationApi}lat=${position.latitude}&lon=${position.longitude}&format=json&accept-language=en";

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

     await myBox?.put("location", [data["address"]["country"],data["address"]["state"]]);

     return "${ApiLink.timesApi30}city=${data["address"]["state"]}&country=${data["address"]["country"]}&method=5#";
    } else {
      return "";
    }
  } catch (e) {
    return "";
  }
}