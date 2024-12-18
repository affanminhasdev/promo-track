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

Future<List<OfferRecord>> getFavoritesOffer(
    List<DocumentReference> favoritesOfferRef) async {
  // get list of OfferRecord from list of DocumentReference offer
  List<OfferRecord> favoritesOffer = [];

  for (DocumentReference offerRef in favoritesOfferRef) {
    DocumentSnapshot offerSnapshot = await offerRef.get();

    OfferRecord offerRecord = OfferRecord.fromSnapshot(offerSnapshot);
    favoritesOffer.add(offerRecord);
  }

  return favoritesOffer;
}
