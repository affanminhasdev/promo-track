// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geocoding/geocoding.dart';

Future<String?> getAddressFromLatLng(LatLng locationPoint) async {
  // Add your function code here!

  List<Placemark> placemarks = await placemarkFromCoordinates(
      locationPoint.latitude, locationPoint.longitude);
  String? locationName;

  if (placemarks.isNotEmpty) {
    Placemark placemark = placemarks[0];

    // Access the desired address components
    locationName = placemark.locality;
  }

  return locationName;
}
