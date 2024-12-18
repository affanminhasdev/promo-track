import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'offer_card_model.dart';
export 'offer_card_model.dart';

class OfferCardWidget extends StatefulWidget {
  const OfferCardWidget({
    super.key,
    bool? likeable,
    required this.offer,
    bool? isOwner,
  })  : this.likeable = likeable ?? true,
        this.isOwner = isOwner ?? false;

  final bool likeable;
  final OfferRecord? offer;
  final bool isOwner;

  @override
  State<OfferCardWidget> createState() => _OfferCardWidgetState();
}

class _OfferCardWidgetState extends State<OfferCardWidget> {
  late OfferCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OfferCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 104.0,
      decoration: BoxDecoration(
        color: widget!.offer?.type == 'À proximité'
            ? Color(0x3252B788)
            : FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Color(0x1A000000),
            offset: Offset(
              0.0,
              4.0,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: () {
                    if (widget!.offer?.type ==
                        FFAppState()
                            .offerFilterList
                            .elementAtOrNull(0)
                            ?.label) {
                      return FFAppState()
                          .offerFilterList
                          .elementAtOrNull(0)
                          ?.color;
                    } else if (widget!.offer?.type ==
                        FFAppState()
                            .offerFilterList
                            .elementAtOrNull(1)
                            ?.label) {
                      return FFAppState()
                          .offerFilterList
                          .elementAtOrNull(1)
                          ?.color;
                    } else if (widget!.offer?.type ==
                        FFAppState()
                            .offerFilterList
                            .elementAtOrNull(2)
                            ?.label) {
                      return valueOrDefault<Color>(
                        FFAppState().offerFilterList.elementAtOrNull(2)?.color,
                        Color(0xFFED1B24),
                      );
                    } else if (widget!.offer?.type ==
                        FFAppState()
                            .offerFilterList
                            .elementAtOrNull(3)
                            ?.label) {
                      return FFAppState()
                          .offerFilterList
                          .elementAtOrNull(3)
                          ?.color;
                    } else if (widget!.offer?.type ==
                        FFAppState()
                            .offerFilterList
                            .elementAtOrNull(4)
                            ?.label) {
                      return FFAppState()
                          .offerFilterList
                          .elementAtOrNull(4)
                          ?.color;
                    } else if (widget!.offer?.type == 'À proximité') {
                      return Color(0xFF2E8B57);
                    } else {
                      return Colors.black;
                    }
                  }(),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Container(
                  width: 20.0,
                  height: double.infinity,
                  child: custom_widgets.VerticalTextWidget(
                    width: 20.0,
                    height: double.infinity,
                    text: widget!.offer!.type,
                    degree: 3,
                    padding: 0.0,
                    textColor: Colors.white,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 12.0, 12.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  widget!.offer!.productImage,
                  width: 68.0,
                  height: 68.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (widget!.offer?.endDate != null)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: Text(
                                        widget!.offer!.endDate! >
                                                getCurrentTimestamp
                                            ? 'exp le ${dateTimeFormat(
                                                "dd/MM/yyyy",
                                                widget!.offer?.endDate,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )}'
                                            : 'cette offre a expiré',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: widget!.offer!.endDate! >
                                                      getCurrentTimestamp
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .accent1,
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 2.0),
                                    child: AutoSizeText(
                                      '${widget!.offer?.title}'
                                          .maybeHandleOverflow(
                                        maxChars: 25,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: AutoSizeText(
                                      widget!.offer!.shopTitle
                                          .maybeHandleOverflow(
                                        maxChars: 25,
                                        replacement: '…',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 10.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (widget!.offer?.type == 'Coupon')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 6.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: SvgPicture.asset(
                                            'assets/images/coupon.svg',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    if (widget!.offer?.type == 'Deal')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 6.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: SvgPicture.asset(
                                            'assets/images/megaphone.svg',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    if (widget!.offer?.type ==
                                        'Dernière Minute')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 6.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: SvgPicture.asset(
                                            'assets/images/hot-sale.svg',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    if (widget!.offer?.type == 'Étudiant')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 6.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: SvgPicture.asset(
                                            'assets/images/etudiant.svg',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    if (widget!.offer?.type == 'Anniversaire')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 6.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: SvgPicture.asset(
                                            'assets/images/balloon.svg',
                                            width: 20.0,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    if (widget!.likeable)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            if ((currentUserDocument?.favorites
                                                            ?.toList() ??
                                                        [])
                                                    .contains(widget!
                                                        .offer?.reference) ==
                                                false)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      HapticFeedback
                                                          .selectionClick();
                                                      if (loggedIn) {
                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'favorites':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                widget!.offer
                                                                    ?.reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        _model.liked = true;
                                                        safeSetState(() {});
                                                      } else {
                                                        context.pushNamed(
                                                            'Signup');
                                                      }
                                                    },
                                                    child: Icon(
                                                      FFIcons.klikeOutline,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if ((currentUserDocument?.favorites
                                                            ?.toList() ??
                                                        [])
                                                    .contains(widget!
                                                        .offer?.reference) ==
                                                true)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: AuthUserStreamWidget(
                                                  builder: (context) => InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      HapticFeedback
                                                          .selectionClick();

                                                      await currentUserReference!
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'favorites':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              widget!.offer
                                                                  ?.reference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                      _model.liked = false;
                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      FFIcons.klikeBold,
                                                      color: Color(0xFFFF4C00),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                  ]
                                      .divide(SizedBox(width: 12.0))
                                      .addToStart(SizedBox(width: 0.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Flexible(
                      child: Align(
                        alignment: AlignmentDirectional(1.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (widget!.offer?.codePromo != null &&
                                widget!.offer?.codePromo != '')
                              Align(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE5E5E5),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 4.0, 4.0),
                                          child: Text(
                                            widget!.offer!.codePromo,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  fontSize: 14.5,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Clipboard.setData(
                                                ClipboardData(
                                                    text: widget!
                                                        .offer!.codePromo));
                                          },
                                          child: Icon(
                                            Icons.content_copy,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (((widget!.offer?.basePrice != null) &&
                                    (widget!.offer!.basePrice > 0.0)) &&
                                ((widget!.offer?.discountPrice != null) &&
                                    (widget!.offer!.discountPrice > 0.0)))
                              Align(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE5E5E5),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (((widget!.offer?.discountPrice !=
                                                    null) &&
                                                (widget!.offer!.discountPrice >
                                                    0.0)) &&
                                            ((widget!.offer?.basePrice !=
                                                    null) &&
                                                (widget!.offer!.basePrice >
                                                    0.0)))
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 4.0, 4.0, 4.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${widget!.offer?.basePrice?.toString()}€',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      ),
                                                ),
                                                Text(
                                                  '${widget!.offer?.discountPrice?.toString()}€',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            Color(0xFFFF0000),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ].divide(SizedBox(width: 4.0)),
                                            ),
                                          ),
                                        if ((widget!.offer?.discountPrice ==
                                                null) &&
                                            ((widget!.offer?.basePrice !=
                                                    null) &&
                                                (widget!.offer!.basePrice >
                                                    0.0)))
                                          Text(
                                            '${widget!.offer?.basePrice?.toString()}€',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (widget!.offer?.link != null &&
                                widget!.offer?.link != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await launchURL(widget!.offer!.link);
                                },
                                child: Icon(
                                  Icons.arrow_circle_right,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 32.0,
                                ),
                              ),
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
