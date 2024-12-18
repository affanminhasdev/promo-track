import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_confidentialite_model.dart';
export 'modal_confidentialite_model.dart';

class ModalConfidentialiteWidget extends StatefulWidget {
  const ModalConfidentialiteWidget({super.key});

  @override
  State<ModalConfidentialiteWidget> createState() =>
      _ModalConfidentialiteWidgetState();
}

class _ModalConfidentialiteWidgetState
    extends State<ModalConfidentialiteWidget> {
  late ModalConfidentialiteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalConfidentialiteModel());

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
                        'Politique de confidentialité',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Text(
                      'Responsable de traitement\n\nContact : contact@promotrack.app\n\nPromotrack est éditée par ROCKPAPER France. Cette société est inscrite au RCS sous le numéro 451 432 228. Son siège social est localisé au 58 rue de Monceau 75008, Paris\n\n\nEn sa qualité de Responsable de Traitement, ROCKPAPER FRANCE peut être amené, dans certains cas, à collecter et traiter vos données personnelles. \n\nLes informations suivantes définissent :\n\n-La nature des données collectées et traitées\n-La finalité de traitement associée à cette collecte\n-La base légale sur laquelle repose le traitement\n-La durée de conservation des données associées à la finalité de traitement\n\nLors de la création et la gestion de votre compte, nous collectons les données suivantes : identifiant (pseudo), genre, email, centres d’intérêt et offres consultées. \nCes données sont utilisées pour nous permettre de constituer un fichier d’utilisateurs de nos services. \nLa base légale pour ce traitement est l\'intérêt légitime. Les données sont conservées pour la durée nécessaire à la réalisation de l\'objectif visé ou jusqu\'à l\'exercice du droit d\'opposition, à la suppression du compte, ou après 3 ans d’inactivité du compte.\n\n \nToutes les données collectées peuvent être utilisées pour établir des statistiques à des fins de meilleures connaissances des utilisateurs. La base légale pour ce traitement est également l\'intérêt légitime. \nLes données relatives aux offres consultées sont collectées afin de vous permettre de consulter l’historique des offres visualisées. La base légale pour ce traitement est l\'intérêt légitime. \n\nLors de votre inscription au service de communications commerciales, nous collectons les données suivantes : pseudo, email, centres d’intérêt et offres consultées. \nCes données sont utilisées pour vous adresser par voie électronique des offres promotionnelles adaptées à vos centres d’intérêt, notamment à l’approche de votre date anniversaire. La base légale pour ce traitement est votre consentement. Les données sont conservées jusqu\'au retrait de votre consentement ou 3 ans à compter du dernier contact de votre part. \nEn utilisant nos services, vous acceptez la collecte et l\'utilisation de vos données personnelles telles que décrites dans ces conditions générales d\'utilisation.\n\n\nDestinataires des données\n\nLes données à caractère personnel sont destinées à ROCKPAPER FRANCE, et ne sont pas communiquées à des tiers, exception faite de la société Google Firebase qui héberge l’application.\n\n\nSécurité des données\n\nLa sécurité des données est assurée par notre hébergeur, la société Google Firebase.\n\nLes conditions générales d’utilisation et politique de protection des données de Google Firebase sont disponibles sur ces liens.\n\n\nConditions Générales d’Utilisation : https://firebase.google.com/terms/\n\nPolitique de protection des données : https://policies.google.com/privacy\n\n\nExercice de vos droits\n\nVous disposez d\'un droit d\'accès, de rectification, d’effacement, de limitation de traitement, de portabilité et d’opposition. Ces droits peuvent être exercés en vous adressant à : personaldata@promotrack.app.\n\nVous avez également le droit d’exercer un recours auprès de la Commission Nationale de l’Informatique et des Libertés (CNIL).',
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
