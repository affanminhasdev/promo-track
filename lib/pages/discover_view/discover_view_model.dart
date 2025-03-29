import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/offer_like_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'discover_view_widget.dart' show DiscoverViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DiscoverViewModel extends FlutterFlowModel<DiscoverViewWidget> {
  ///  Local state fields for this page.

  String selectedCategory = 'Tout';

  List<OfferRecord> allOffers = [];
  void addToAllOffers(OfferRecord item) => allOffers.add(item);
  void removeFromAllOffers(OfferRecord item) => allOffers.remove(item);
  void removeAtIndexFromAllOffers(int index) => allOffers.removeAt(index);
  void insertAtIndexInAllOffers(int index, OfferRecord item) =>
      allOffers.insert(index, item);
  void updateAllOffersAtIndex(int index, Function(OfferRecord) updateFn) =>
      allOffers[index] = updateFn(allOffers[index]);

  bool isLoading = true;

  List<OfferRecord> allNearbyOffers = [];
  void addToAllNearbyOffers(OfferRecord item) => allNearbyOffers.add(item);
  void removeFromAllNearbyOffers(OfferRecord item) =>
      allNearbyOffers.remove(item);
  void removeAtIndexFromAllNearbyOffers(int index) =>
      allNearbyOffers.removeAt(index);
  void insertAtIndexInAllNearbyOffers(int index, OfferRecord item) =>
      allNearbyOffers.insert(index, item);
  void updateAllNearbyOffersAtIndex(
          int index, Function(OfferRecord) updateFn) =>
      allNearbyOffers[index] = updateFn(allNearbyOffers[index]);

  int carouselIndex = 0;

  bool searchEnabled = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in DiscoverView widget.
  List<OfferRecord>? allOffersResult;
  // Stores action output result for [Custom Action - getNearbyOffer] action in DiscoverView widget.
  List<OfferRecord>? nearbyOffers;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<OfferRecord>? filterOffersMain;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<OfferRecord>? filterOffers;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Algolia Search Results from action on TextField
  List<OfferRecord>? algoliaSearchResults = [];
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navbarModel.dispose();
  }
}
