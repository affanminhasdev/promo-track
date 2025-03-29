import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_shop/empty_shop_widget.dart';
import '/components/offer_card/offer_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modal/modal_offer_details/modal_offer_details_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_offers_view_model.dart';
export 'all_offers_view_model.dart';

class AllOffersViewWidget extends StatefulWidget {
  const AllOffersViewWidget({
    super.key,
    this.type,
    bool? isFromTrending,
  }) : this.isFromTrending = isFromTrending ?? false;

  final String? type;
  final bool isFromTrending;

  static String routeName = 'AllOffersView';
  static String routePath = '/allOffersView';

  @override
  State<AllOffersViewWidget> createState() => _AllOffersViewWidgetState();
}

class _AllOffersViewWidgetState extends State<AllOffersViewWidget>
    with TickerProviderStateMixin {
  late AllOffersViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllOffersViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.type = widget!.type;
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.8, 0.8),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 20.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Icon(
                          Icons.chevron_left,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 35.0,
                        ),
                      ),
                      Text(
                        widget!.isFromTrending
                            ? 'Offres tendances'
                            : 'Offres du Moment',
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Icon(
                        Icons.arrow_back,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 25.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).tertiary,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 4.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            FFIcons.ksearch,
                            color: Color(0xFFAAAAAA),
                            size: 24.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 10),
                                  () => safeSetState(() {}),
                                ),
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Que cherchez-vous ?',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFFB5B5B5),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 19.0,
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0.0,
                                    ),
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 7.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            HapticFeedback.selectionClick();
                            _model.type = null;
                            safeSetState(() {});
                          },
                          child: Container(
                            height: 32.0,
                            decoration: BoxDecoration(
                              color: _model.type == null || _model.type == ''
                                  ? FlutterFlowTheme.of(context).primary
                                  : Color(0x00000000),
                              borderRadius: BorderRadius.circular(16.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 4.0, 8.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Tout',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: _model.type == null ||
                                                  _model.type == ''
                                              ? Colors.white
                                              : FlutterFlowTheme.of(context)
                                                  .primary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            final offerCategory =
                                FFAppState().offerFilterList.toList();

                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(offerCategory.length,
                                  (offerCategoryIndex) {
                                final offerCategoryItem =
                                    offerCategory[offerCategoryIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    HapticFeedback.selectionClick();
                                    _model.type = offerCategoryItem.label;
                                    safeSetState(() {});
                                  },
                                  child: Container(
                                    height: 32.0,
                                    decoration: BoxDecoration(
                                      color:
                                          _model.type == offerCategoryItem.label
                                              ? offerCategoryItem.color
                                              : Color(0x00000000),
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          offerCategoryItem.color,
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 4.0, 8.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (offerCategoryItem.label == 'Deal')
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/megaphone.svg',
                                                width: 20.0,
                                                height: 20.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          if (offerCategoryItem.label ==
                                              'Coupon')
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/coupon.svg',
                                                width: 20.0,
                                                height: 20.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          if (offerCategoryItem.label ==
                                              'Dernière Minute')
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/hot-sale.svg',
                                                width: 20.0,
                                                height: 20.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          if (offerCategoryItem.label ==
                                              'Étudiant')
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/etudiant.svg',
                                                width: 20.0,
                                                height: 20.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          if (offerCategoryItem.label ==
                                              'Anniversaire')
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/balloon.svg',
                                                width: 20.0,
                                                height: 20.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          Text(
                                            offerCategoryItem.label,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: valueOrDefault<Color>(
                                                    _model.type ==
                                                            offerCategoryItem
                                                                .label
                                                        ? Colors.white
                                                        : offerCategoryItem
                                                            .color,
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                  ),
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ].divide(SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  ),
                                );
                              }).divide(SizedBox(width: 10.0)),
                            );
                          },
                        ),
                      ]
                          .divide(SizedBox(width: 8.0))
                          .addToStart(SizedBox(width: 16.0))
                          .addToEnd(SizedBox(width: 16.0)),
                    ),
                  ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
                ),
                Divider(
                  height: 40.0,
                  thickness: 8.0,
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
                if (_model.textController.text != null &&
                    _model.textController.text != '')
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                      child: FutureBuilder<List<OfferRecord>>(
                        future: OfferRecord.search(
                          term: _model.textController.text == null ||
                                  _model.textController.text == ''
                              ? ' '
                              : _model.textController.text,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<OfferRecord> containerOfferRecordList =
                              snapshot.data!;
                          return Container(
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                if (containerOfferRecordList
                                        .where((e) =>
                                            e.isTrending ==
                                            widget!.isFromTrending)
                                        .toList() ==
                                    null) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final searchedOffers = containerOfferRecordList
                                    .where((e) =>
                                        e.isTrending == widget!.isFromTrending)
                                    .toList();
                                if (searchedOffers.isEmpty) {
                                  return EmptyShopWidget();
                                }

                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children:
                                        List.generate(searchedOffers.length,
                                            (searchedOffersIndex) {
                                      final searchedOffersItem =
                                          searchedOffers[searchedOffersIndex];
                                      return Visibility(
                                        visible: ((searchedOffersItem.type ==
                                                    _model.type) ||
                                                (_model.type == null ||
                                                    _model.type == '')) &&
                                            (widget!.isFromTrending ==
                                                searchedOffersItem.isTrending),
                                        child: OfferCardWidget(
                                          key: Key(
                                              'Keyju3_${searchedOffersIndex}_of_${searchedOffers.length}'),
                                          likeable: true,
                                          offer: searchedOffersItem,
                                          isOwner: false,
                                          callback: () async {
                                            await searchedOffersItem.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'click_nb':
                                                      FieldValue.increment(1),
                                                },
                                              ),
                                            });
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: Container(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.7,
                                                      child:
                                                          ModalOfferDetailsWidget(
                                                        offer:
                                                            searchedOffersItem,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                        ),
                                      );
                                    }).divide(
                                      SizedBox(height: 16.0),
                                      filterFn: (searchedOffersIndex) {
                                        final searchedOffersItem =
                                            searchedOffers[searchedOffersIndex];
                                        return ((searchedOffersItem.type ==
                                                    _model.type) ||
                                                (_model.type == null ||
                                                    _model.type == '')) &&
                                            (widget!.isFromTrending ==
                                                searchedOffersItem.isTrending);
                                      },
                                    ).addToEnd(SizedBox(height: 16.0)),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'columnOnPageLoadAnimation']!);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                if (_model.textController.text == null ||
                    _model.textController.text == '')
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            if (widget!.isFromTrending) {
                              return Container(
                                width: double.infinity,
                                height: 100.0,
                                child: custom_widgets
                                    .ListViewTrendingOffersPaginate(
                                  width: double.infinity,
                                  height: 100.0,
                                  type: _model.type,
                                  onTap: (offer) async {
                                    await offer.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'click_nb': FieldValue.increment(1),
                                        },
                                      ),
                                    });
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: ModalOfferDetailsWidget(
                                              offer: offer,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                ),
                              );
                            } else {
                              return Container(
                                width: double.infinity,
                                height: 100.0,
                                child: custom_widgets.ListViewOffersPaginate(
                                  width: double.infinity,
                                  height: 100.0,
                                  type: _model.type,
                                  onTap: (offer) async {
                                    await offer.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'click_nb': FieldValue.increment(1),
                                        },
                                      ),
                                    });
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: ModalOfferDetailsWidget(
                                              offer: offer,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
