import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/offer_card/offer_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modal/modal_offer_details/modal_offer_details_widget.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'wishlist_widget.dart' show WishlistWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WishlistModel extends FlutterFlowModel<WishlistWidget> {
  ///  Local state fields for this page.

  List<OfferRecord> favOffers = [];
  void addToFavOffers(OfferRecord item) => favOffers.add(item);
  void removeFromFavOffers(OfferRecord item) => favOffers.remove(item);
  void removeAtIndexFromFavOffers(int index) => favOffers.removeAt(index);
  void insertAtIndexInFavOffers(int index, OfferRecord item) =>
      favOffers.insert(index, item);
  void updateFavOffersAtIndex(int index, Function(OfferRecord) updateFn) =>
      favOffers[index] = updateFn(favOffers[index]);

  String selectedTab = 'Offres sauvegardées';

  List<ShopRecord> followedBrands = [];
  void addToFollowedBrands(ShopRecord item) => followedBrands.add(item);
  void removeFromFollowedBrands(ShopRecord item) => followedBrands.remove(item);
  void removeAtIndexFromFollowedBrands(int index) =>
      followedBrands.removeAt(index);
  void insertAtIndexInFollowedBrands(int index, ShopRecord item) =>
      followedBrands.insert(index, item);
  void updateFollowedBrandsAtIndex(int index, Function(ShopRecord) updateFn) =>
      followedBrands[index] = updateFn(followedBrands[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getFavoritesOffer] action in Wishlist widget.
  List<OfferRecord>? favoritesOffers;
  // Stores action output result for [Custom Action - getShopsByRef] action in Wishlist widget.
  List<ShopRecord>? shops;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }
}
