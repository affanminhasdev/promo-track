import '/backend/backend.dart';
import '/component/empty_shop/empty_shop_widget.dart';
import '/component/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'shops_widget.dart' show ShopsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShopsModel extends FlutterFlowModel<ShopsWidget> {
  ///  Local state fields for this page.

  bool isList = true;

  List<ShopRecord> shopList = [];
  void addToShopList(ShopRecord item) => shopList.add(item);
  void removeFromShopList(ShopRecord item) => shopList.remove(item);
  void removeAtIndexFromShopList(int index) => shopList.removeAt(index);
  void insertAtIndexInShopList(int index, ShopRecord item) =>
      shopList.insert(index, item);
  void updateShopListAtIndex(int index, Function(ShopRecord) updateFn) =>
      shopList[index] = updateFn(shopList[index]);

  String? category;

  ///  State fields for stateful widgets in this page.

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
