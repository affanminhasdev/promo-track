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

import 'package:dart_geohash/dart_geohash.dart';

Future<String> getGeoHashFromLocation(LatLng locationPoint) async {
  // Add your function code here!
  var geoHasher = GeoHasher();

  final String centerGeohash = geoHasher.encode(
    locationPoint.latitude,
    locationPoint.longitude,
    precision: 5,
  );

  return centerGeohash;
}
