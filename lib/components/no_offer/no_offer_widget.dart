import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_offer_model.dart';
export 'no_offer_model.dart';

class NoOfferWidget extends StatefulWidget {
  const NoOfferWidget({super.key});

  @override
  State<NoOfferWidget> createState() => _NoOfferWidgetState();
}

class _NoOfferWidgetState extends State<NoOfferWidget> {
  late NoOfferModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoOfferModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Aucune Offre :(',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Montserrat',
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
