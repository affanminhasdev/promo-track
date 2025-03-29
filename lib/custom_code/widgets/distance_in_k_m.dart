// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dart_geohash/dart_geohash.dart';
import 'package:geolocator/geolocator.dart';

class DistanceInKM extends StatefulWidget {
  const DistanceInKM({
    super.key,
    this.width,
    this.height,
    required this.geoHash,
    required this.currentLocation,
  });

  final double? width;
  final double? height;
  final String geoHash;
  final LatLng currentLocation;

  @override
  State<DistanceInKM> createState() => _DistanceInKMState();
}

class _DistanceInKMState extends State<DistanceInKM> {
  String get getDistanceInKM {
    /// MODIFY CODE ONLY BELOW THIS LINE

    GeoHasher geoHasher = GeoHasher();
    List<double> shopCoordinates = geoHasher.decode(widget.geoHash);

    double shopLatitude = shopCoordinates[0];
    double shopLongitude = shopCoordinates[1];

    // Calculate the distance
    double distanceInMeters = Geolocator.distanceBetween(
      widget.currentLocation.latitude,
      widget.currentLocation.longitude,
      shopLatitude,
      shopLongitude,
    );

    return (distanceInMeters / 1000).toStringAsFixed(2);

    /// MODIFY CODE ONLY ABOVE THIS LINE
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${getDistanceInKM} km',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
