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

Future<double> categoryOffers() async {
  double totalCategoryOffers = 0.0;

  // Get all shops from Firestore
  CollectionReference<Map<String, dynamic>> shopCollection =
      FirebaseFirestore.instance.collection('shop');
  QuerySnapshot<Map<String, dynamic>> shopSnapshot = await shopCollection.get();

  // Prepare a list to hold all the offer query futures
  List<Future<QuerySnapshot<Map<String, dynamic>>>> offerFutures = [];

  // Define the offer collection outside the loop
  CollectionReference<Map<String, dynamic>> offerCollection =
      FirebaseFirestore.instance.collection('offer');

  // Loop through each shop and prepare the offer queries
  for (QueryDocumentSnapshot<Map<String, dynamic>> shopDoc
      in shopSnapshot.docs) {
    String category = shopDoc['category'];

    // Add the offer query future to the list
    offerFutures.add(
      offerCollection.where('shop_category', isEqualTo: category).get(),
    );
  }

  // Wait for all offer queries to complete
  List<QuerySnapshot<Map<String, dynamic>>> offerSnapshots =
      await Future.wait(offerFutures);

  // Sum up the size of each offer snapshot
  for (QuerySnapshot<Map<String, dynamic>> offerSnapshot in offerSnapshots) {
    totalCategoryOffers += offerSnapshot.size;
  }

  return totalCategoryOffers;
}
