import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool stringContains(
  String stringA,
  String? stringB,
) {
  if (stringB != null) {
    if (stringA.toLowerCase().contains(stringB.toLowerCase())) {
      return true;
    }
    return false;
  }
  return true;
}

double getDistance(
  LatLng pointA,
  LatLng documentAddress,
) {
  const double earthRadius = 6371;

  double _toRadians(degrees) {
    return degrees * math.pi / 180;
  }

  double dLat = _toRadians(documentAddress.latitude - pointA.latitude);
  double dLng = _toRadians(documentAddress.longitude - pointA.longitude);
  double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(_toRadians(pointA.latitude)) *
          math.cos(_toRadians(documentAddress.latitude)) *
          math.sin(dLng / 2) *
          math.sin(dLng / 2);
  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  return earthRadius * c;
}

List<OfferRecord> offerSortingbyDistance(
  List<OfferRecord> unsortedList,
  LatLng currentLocation,
) {
  unsortedList.sort((a, b) => getDistance(currentLocation, a.shopAddress!)
      .compareTo(getDistance(currentLocation, b.shopAddress!)));

  List<OfferRecord> filteredList = unsortedList.where((offer) {
    double distance = getDistance(currentLocation, offer.shopAddress!);
    return distance <= 11; // (11 km)
  }).toList();

  return filteredList;
}

List<ShopRecord> shopSortingbyDistance(
  List<ShopRecord> unsortedList,
  LatLng distance,
) {
  unsortedList.sort((a, b) => getDistance(distance, a.address!)
      .compareTo(getDistance(distance, b.address!)));

  return unsortedList;
}

bool isSameList(
  List<String> list1,
  List<String> list2,
) {
  if (list1.length != list2.length) {
    return false;
  }

  List<dynamic> sortedList1 = List.from(list1)..sort();
  List<dynamic> sortedList2 = List.from(list2)..sort();

  for (int i = 0; i < sortedList1.length; i++) {
    if (sortedList1[i] != sortedList2[i]) {
      return false;
    }
  }

  return true;
}

DateTime addDaysToDate(
  DateTime date,
  int dayNb,
) {
  return date.add(Duration(days: dayNb));
}

bool areListsIdenticals(
  List<String> list1,
  List<String> list2,
) {
  if (list1.length != list2.length) {
    return false;
  }

  for (int i = 0; i < list1.length; i++) {
    if (list1[i] != list2[i]) {
      return false;
    }
  }

  return true;
}

String stringToImagePath(String pathString) {
  return pathString;
}
