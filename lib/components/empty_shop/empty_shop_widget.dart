import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_shop_model.dart';
export 'empty_shop_model.dart';

class EmptyShopWidget extends StatefulWidget {
  const EmptyShopWidget({super.key});

  @override
  State<EmptyShopWidget> createState() => _EmptyShopWidgetState();
}

class _EmptyShopWidgetState extends State<EmptyShopWidget> {
  late EmptyShopModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyShopModel());

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
                'Aucune Offre',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                      fontFamily: 'Montserrat',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
