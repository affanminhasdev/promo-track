import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_mention_legal_model.dart';
export 'modal_mention_legal_model.dart';

class ModalMentionLegalWidget extends StatefulWidget {
  const ModalMentionLegalWidget({super.key});

  @override
  State<ModalMentionLegalWidget> createState() =>
      _ModalMentionLegalWidgetState();
}

class _ModalMentionLegalWidgetState extends State<ModalMentionLegalWidget> {
  late ModalMentionLegalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalMentionLegalModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: Container(
                      width: 50.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFE0E3E7),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 40.0,
                thickness: 8.0,
                color: FlutterFlowTheme.of(context).tertiary,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                      child: Text(
                        'Mentions légales',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Text(
                      'L’édition de l’application mobile Promotrack est assurée par la société ROCKPAPER FRANCE, société par actions simplifiée unipersonnelle (SASU) au capital de 1 000 euros, inscrite au RCS sous le numéro 451 432 228, dont le siège social est localisé au 58 rue de Monceau CS 48756 75380 Paris Cedex 08, France Métropolitaine.\n\nL’hébergeur de l’application mobile est Google Firebase dont le siège social est situé 1600 Amphitheatre Parkway à Mountain View, en Californie, USA.\n\nLa société ROCKPAPER FRANCE peut être contactée par courriel : contact@promotrack.app\n\nL’application Promotrack utilise des images (illustrations, photographies…) dans le cadre d’affichage d’opportunités promotionnelles. Ces images sont mises à disposition par les entreprises partenaires d’un programme d’affiliation. La propriété intellectuelle de ces images reste entièrement celle de leur Auteur.',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
