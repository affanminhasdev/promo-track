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

Future<List<ShopRecord>> filteredShopListByDistance(
  LatLng locationPoint,
  int distanceMax,
  List<ShopRecord> listShop,
) async {
  List<ShopRecord> shops = [];

  // Filter offers by distance
  shops = listShop
      .where((shop) => getDistance(locationPoint, shop.address!) <= distanceMax)
      .toList();

  // Sort offers by distance
  shops.sort((a, b) => getDistance(locationPoint, a.address!)
      .compareTo(getDistance(locationPoint, b.address!)));

  return shops;
}
