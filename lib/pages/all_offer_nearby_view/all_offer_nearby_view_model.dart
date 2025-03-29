import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/offer_like_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'all_offer_nearby_view_widget.dart' show AllOfferNearbyViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllOfferNearbyViewModel
    extends FlutterFlowModel<AllOfferNearbyViewWidget> {
  ///  Local state fields for this page.

  List<OfferRecord> allOffersNearby = [];
  void addToAllOffersNearby(OfferRecord item) => allOffersNearby.add(item);
  void removeFromAllOffersNearby(OfferRecord item) =>
      allOffersNearby.remove(item);
  void removeAtIndexFromAllOffersNearby(int index) =>
      allOffersNearby.removeAt(index);
  void insertAtIndexInAllOffersNearby(int index, OfferRecord item) =>
      allOffersNearby.insert(index, item);
  void updateAllOffersNearbyAtIndex(
          int index, Function(OfferRecord) updateFn) =>
      allOffersNearby[index] = updateFn(allOffersNearby[index]);

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in AllOfferNearbyView widget.
  List<OfferRecord>? allOffersResult;
  // Stores action output result for [Custom Action - getNearbyOffer] action in AllOfferNearbyView widget.
  List<OfferRecord>? nearbyOffers;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Algolia Search Results from action on TextField
  List<OfferRecord>? algoliaSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
