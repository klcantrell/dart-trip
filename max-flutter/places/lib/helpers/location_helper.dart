import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../env.dart';

String generateLocationPreviewImage(
        {@required double latitude, @required double longitude}) =>
    'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';

Future<String> getLocationAddress(
    {@required double latitude, @required double longitude}) async {
  final url =
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$GOOGLE_API_KEY';
  final response = await http.get(url);
  return json.decode(response.body)['results'][0]['formatted_address'];
}
