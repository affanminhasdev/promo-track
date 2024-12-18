import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_c_g_u_model.dart';
export 'modal_c_g_u_model.dart';

class ModalCGUWidget extends StatefulWidget {
  const ModalCGUWidget({super.key});

  @override
  State<ModalCGUWidget> createState() => _ModalCGUWidgetState();
}

class _ModalCGUWidgetState extends State<ModalCGUWidget> {
  late ModalCGUModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalCGUModel());

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
                        'Conditions générales d\'utilisation',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Text(
                      'Article 1 : Objet\n\nLes présentes Conditions Générales d’Utilisation (ci-après désignées \"les CGU\") encadrent juridiquement l’accès et l’utilisation de l’application Promotrack (ci-après dénommée \"l’application\").\n\nLes CGU s’adressent à toute personne physique majeure capable, ou toute personne morale, qui fait usage des Services fournis (ci-après désignée comme \"l’Utilisateur\").\n\nL\'accès à l’application implique l\'acceptation sans réserve des présentes conditions d\'utilisation par l’Utilisateur.\n\nROCKPAPER FRANCE se réserve à tout moment le droit de modifier les présentes CGU. L\'Utilisateur est ainsi invité à les consulter régulièrement pour prendre connaissance d\'éventuelles modifications et adaptations.\n\n\n\nArticle 2 : Mentions légales\n\nL’édition de l’application mobile Promotrack est assurée par la société ROCKPAPER FRANCE, société par actions simplifiée unipersonnelle (SASU) au capital de 1 000 euros, inscrite au RCS sous le numéro 451 432 228, dont le siège social est localisé au 58 rue de Monceau CS 48756 75380 Paris Cedex 08, France Métropolitaine.\n\nL’hébergeur de l’application mobile est Google Firebase dont le siège social est situé 1600 Amphitheatre Parkway à Mountain View, en Californie, USA.\n\nLa société ROCKPAPER FRANCE peut être contactée par courriel : contact@promotrack.app\n\nL’application Promotrack utilise des images (illustrations, photographies…) dans le cadre d’affichage d’opportunités promotionnelles. Ces images sont mises à disposition par les entreprises partenaires d’un programme d’affiliation. La propriété intellectuelle de ces images reste entièrement celle de leur Auteur.\n\n\n\nArticle 3 : Téléchargement et accès à l’application\n\nL’application Promotrack permet de consulter une sélection d’offres promotionnelles et commerciales. Ces offres sont :\n\nPour partie, collectées et éditées par ROCKPAPER FRANCE dans le cadre d’un programme d’affiliation servant la promotion d’Annonceurs.\n\nPour partie, éditées par ROCKPAPER FRANCE après leur collecte directe auprès d’Annonceurs.\n\nL’application est disponible gratuitement en téléchargement sur l\'App Store (iOS) et Google Play (Android). Tous les frais nécessaires pour l’accès aux services (matériel, connexion Internet…) sont à la charge de l’Utilisateur.\n\nL’application offre la possibilité à l’Utilisateur de créer un compte. L’accès à celui-ci s’effectue à l’aide d’un identifiant et d’un mot de passe.\n\nPour différentes raisons, notamment liées aux opérations de maintenance, l’accès à l’application peut être interrompu ou suspendu sans préavis ni justification.\n\n\n\nArticle 4 : Protection des données personnelles\n\nResponsable de traitement\n\nL’application mobile Promotrack est éditée par ROCKPAPER France. Cette société est inscrite au RCS sous le numéro 451 432 228. Son siège social est localisé au 58 rue de Monceau 75008 Paris, France Métropolitaine.\n\nContact : contact@promotrack.app\n\nFinalités de traitement, bases légales associées, données traitées, durée de conservation\n\nEn sa qualité de Responsable de Traitement, ROCKPAPER FRANCE peut être amené, dans certains cas, à collecter et traiter vos données personnelles.\n\nLes informations suivantes définissent :\n\n- La situation conduisant à la collecte de données\n-La nature des données collectées et traitées\n-La finalité de traitement associée à cette collecte\n-La base légale sur laquelle repose le traitement\n-La durée de conservation des données associées à la finalité de traitement\n\nLors de la création et la gestion de votre compte, nous collectons les données suivantes : identifiant (pseudo), date de naissance, genre, email, centres d’intérêt et offres consultées. \nCes données sont utilisées pour nous permettre de constituer un fichier d’utilisateurs de nos services. \nLa base légale pour ce traitement est l\'intérêt légitime. Les données sont conservées pour la durée nécessaire à la réalisation de l\'objectif visé ou jusqu\'à l\'exercice du droit d\'opposition, à la suppression du compte, ou après 3 ans d’inactivité du compte.\n\n Nous collectons également votre date de naissance afin de nous assurer de la majorité de la personne concernée. La base légale pour ce traitement est l\'intérêt légitime. Toutes les données collectées peuvent être utilisées pour établir des statistiques à des fins de meilleures connaissances des utilisateurs. La base légale pour ce traitement est également l\'intérêt légitime. Les données relatives aux offres consultées sont collectées afin de vous permettre de consulter l’historique des offres visualisées. La base légale pour ce traitement est l\'intérêt légitime. \n\nLors de votre inscription au service de communications commerciales, nous collectons les données suivantes : pseudo, date de naissance, email, centres d’intérêt et offres consultées. Ces données sont utilisées pour vous adresser par voie électronique des offres promotionnelles adaptées à vos centres d’intérêt, notamment à l’approche de votre date anniversaire. \nLa base légale pour ce traitement est votre consentement. Les données sont conservées jusqu\'au retrait de votre consentement ou 3 ans à compter du dernier contact de votre part. En utilisant nos services, vous acceptez la collecte et l\'utilisation de vos données personnelles telles que décrites dans ces conditions générales d\'utilisation.\n\n\n\nDestinataires des données\n\nLes données à caractère personnel sont destinées à ROCKPAPER FRANCE, et ne sont pas communiquées à des tiers, exception faite de la société Google Firebase qui héberge l’application.\n\n\n\nSécurité des données\n\nLa sécurité des données est assurée par notre hébergeur, la société Google Firebase.\n\nLes conditions générales d’utilisation et politique de protection des données de Google Firebase sont disponibles sur ces liens.\n\nConditions Générales d’Utilisation : https://firebase.google.com/terms/\n\nPolitique de protection des données : https://policies.google.com/privacy\n\n\n\nExercice de vos droits\n\nVous disposez d\'un droit d\'accès, de rectification, d’effacement, de limitation de traitement, de portabilité et d’opposition. Ces droits peuvent être exercés en vous adressant à : personaldata@promotrack.app.\n\nVous avez également le droit d’exercer un recours auprès de la Commission Nationale de l’Informatique et des Libertés (CNIL).\n\n\n\nArticle 5 : Propriété intellectuelle\n\nLa marque et le logo Promotrack ainsi que les contenus de l’application Promotrack (illustrations graphiques, textes…) sont protégés par le Code de la propriété intellectuelle et par le droit d’auteur.\n\nRappel : L’application Promotrack utilise des images (illustrations, photographies…) dans le cadre d’affichage d’opportunités promotionnelles. Ces images sont mises à disposition par les entreprises partenaires d’un programme d’affiliation. La propriété intellectuelle de ces images reste entièrement celle de leur Auteur.\n\nConcernant toute donnée protégée par un droit de propriété intellectuelle, l’Utilisateur doit obtenir les autorisations préalables auprès des titulaires de droits, dans le respect du cadre légal, préalablement à toute reproduction, représentation ou communication.\n\n\n\nArticle 6 : Responsabilité\n\nROCKPAPER FRANCE décline toute responsabilité en cas d’inaccessibilité de l’application ou d’interruption des services proposés.\n\nROCKPAPER FRANCE ne peut être tenu pour responsable en cas de force majeure ou du fait imprévisible et insurmontable d’un tiers.\n\nROCKPAPER FRANCE ne peut pas garantir la compatibilité de l’application avec votre système d’exploitation.\n\nROCKPAPER FRANCE ne peut être tenu pour responsable d’éventuels virus qui pourraient infecter le matériel informatique de l’Utilisateur, suite à une utilisation, à l’accès, ou au téléchargement en lien avec l’application.\n\nLa responsabilité de ROCKPAPER FRANCE ne pourra pas être engagée en cas de quelconque dysfonctionnement (difficulté, problème de livraison, produit non conforme, litige, défaillance…) survenu lors de – ou postérieurement à – la transaction entre l’Utilisateur et l’Annonceur.\n\nROCKPAPER FRANCE ne peut garantir à l’Utilisateur la validité des coupons de réduction offerts par ses Annonceurs.\n\nROCKPAPER FRANCE n’est pas responsable du contenu accessible depuis les liens hypertextes présents sur l’application. En cliquant sur ces derniers, l’Utilisateur sortira de la plateforme. Celle-ci n’a pas de contrôle et ne peut pas être tenue responsable du contenu relatif à ces liens.\n\n\n\nArticle 7 : Durée des CGU\n\nLes présentes CGU sont valables pour une durée indéterminée. Elles prennent effet dès votre utilisation de l’application Promotrack.\n\nROCKPAPER FRANCE se réserve le droit de mettre à jour ces CGU à tout moment sans notification préalable des Utilisateurs. Ces évolutions entrent en vigueur dès leur publication sur l’application. Nous conseillons à l’Utilisateur de consulter régulièrement les CGU pour se tenir informé de leurs potentielles évolutions.\n\n\n\nArticle 8 : Droit applicable et juridiction compétente\n\nLes présentes CGU sont soumises à la législation française. L’absence de résolution à l’amiable des cas de litige entre les parties implique le recours aux tribunaux français compétents pour régler le contentieux.\n\n',
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
