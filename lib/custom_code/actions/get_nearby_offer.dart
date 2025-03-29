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
import 'package:geolocator/geolocator.dart';

Future<List<OfferRecord>> getNearbyOffer(
  List<OfferRecord> offers,
  LatLng currentLocation,
) async {
  List<OfferRecord> updatedOffers = [];

  for (OfferRecord offer in offers) {
    GeoHasher geoHasher = GeoHasher();
    List<double> shopCoordinates = geoHasher.decode(offer.shopGeohash);

    double shopLatitude = shopCoordinates[0];
    double shopLongitude = shopCoordinates[1];

    // Calculate the distance
    double distanceInMeters = Geolocator.distanceBetween(
      currentLocation.latitude,
      currentLocation.longitude,
      shopLatitude,
      shopLongitude,
    );

    updatedOffers.add(
      OfferRecord.getDocumentFromData(
        createOfferRecordData(
          title: offer.title,
          endDate: offer.endDate,
          basePrice: offer.basePrice,
          discountPrice: offer.discountPrice,
          description: offer.description,
          logo: offer.logo,
          shopTitle: offer.shopTitle,
          shopAddress: offer.shopAddress,
          shopAddressString: offer.shopAddressString,
          shopGeohash: offer.shopGeohash,
          shopRef: offer.shopRef,
          type: offer.type,
          shopCategory: offer.shopCategory,
          shopCity: offer.shopCity,
          productImage: offer.productImage,
          link: offer.link,
          clickNb: offer.clickNb,
          codePromo: offer.codePromo,
          isTrending: offer.isTrending,
          shopDistanceKm: distanceInMeters / 1000,
        ),
        offer.reference,
      ),
    );

    print('Distance to shop: $distanceInMeters meters');
    print('Distance to shop: ${distanceInMeters / 1000} km');
  }
  return updatedOffers;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
