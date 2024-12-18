import '/backend/backend.dart';
import '/component/shop_card/shop_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'modal_shop_widget.dart' show ModalShopWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalShopModel extends FlutterFlowModel<ModalShopWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for shop_card component.
  late ShopCardModel shopCardModel;

  @override
  void initState(BuildContext context) {
    shopCardModel = createModel(context, () => ShopCardModel());
  }

  @override
  void dispose() {
    shopCardModel.dispose();
  }
}
