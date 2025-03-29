import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_shop/empty_shop_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/offer_card/offer_card_widget.dart';
import '/components/profile_info_dialog/profile_info_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modal/dialog_offer_details/dialog_offer_details_widget.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  List<OfferRecord> offers = [];
  void addToOffers(OfferRecord item) => offers.add(item);
  void removeFromOffers(OfferRecord item) => offers.remove(item);
  void removeAtIndexFromOffers(int index) => offers.removeAt(index);
  void insertAtIndexInOffers(int index, OfferRecord item) =>
      offers.insert(index, item);
  void updateOffersAtIndex(int index, Function(OfferRecord) updateFn) =>
      offers[index] = updateFn(offers[index]);

  String? type;

  List<OfferRecord> trendingOffers = [];
  void addToTrendingOffers(OfferRecord item) => trendingOffers.add(item);
  void removeFromTrendingOffers(OfferRecord item) =>
      trendingOffers.remove(item);
  void removeAtIndexFromTrendingOffers(int index) =>
      trendingOffers.removeAt(index);
  void insertAtIndexInTrendingOffers(int index, OfferRecord item) =>
      trendingOffers.insert(index, item);
  void updateTrendingOffersAtIndex(int index, Function(OfferRecord) updateFn) =>
      trendingOffers[index] = updateFn(trendingOffers[index]);

  OfferOptionStruct? selectedTab;
  void updateSelectedTabStruct(Function(OfferOptionStruct) updateFn) {
    updateFn(selectedTab ??= OfferOptionStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Home widget.
  List<OfferRecord>? offersData;
  // Stores action output result for [Firestore Query - Query a collection] action in Home widget.
  List<OfferRecord>? trendingOffersData;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<OfferRecord>? offersResetData;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<OfferRecord>? offersTypeData;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

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
