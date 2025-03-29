import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'offer_like_model.dart';
export 'offer_like_model.dart';

class OfferLikeWidget extends StatefulWidget {
  const OfferLikeWidget({
    super.key,
    this.offer,
  });

  final DocumentReference? offer;

  @override
  State<OfferLikeWidget> createState() => _OfferLikeWidgetState();
}

class _OfferLikeWidgetState extends State<OfferLikeWidget> {
  late OfferLikeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OfferLikeModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.isLiked = (currentUserDocument?.favorites?.toList() ?? [])
          .contains(widget!.offer);
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (_model.isLiked)
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              _model.isLiked = false;
              safeSetState(() {});

              await currentUserReference!.update({
                ...mapToFirestore(
                  {
                    'favorites': FieldValue.arrayRemove([widget!.offer]),
                  },
                ),
              });
            },
            child: Icon(
              Icons.favorite_sharp,
              color: Color(0xFFFA2531),
              size: 22.0,
            ),
          ),
        if (!_model.isLiked)
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              _model.isLiked = true;
              safeSetState(() {});

              await currentUserReference!.update({
                ...mapToFirestore(
                  {
                    'favorites': FieldValue.arrayUnion([widget!.offer]),
                  },
                ),
              });
            },
            child: Icon(
              Icons.favorite_border,
              color: FlutterFlowTheme.of(context).accent2,
              size: 22.0,
            ),
          ),
      ],
    );
  }
}
