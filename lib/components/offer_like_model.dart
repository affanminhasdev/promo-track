import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'offer_like_widget.dart' show OfferLikeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OfferLikeModel extends FlutterFlowModel<OfferLikeWidget> {
  ///  Local state fields for this component.

  bool isLiked = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
