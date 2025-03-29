import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/empty_shop/empty_shop_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/offer_card/offer_card_widget.dart';
import '/components/profile_info_dialog/profile_info_dialog_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modal/dialog_offer_details/dialog_offer_details_widget.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      if (FFAppState().locationAccess) {
      } else {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Container(
                  height: 250.0,
                  width: 250.0,
                  child: ProfileInfoDialogWidget(
                    title:
                        'Location service is diable. Enable it to get better service',
                  ),
                ),
              ),
            );
          },
        );
      }

      _model.offersData = await queryOfferRecordOnce(
        limit: 3,
      );
      _model.trendingOffersData = await queryOfferRecordOnce(
        queryBuilder: (offerRecord) => offerRecord.where(
          'is_trending',
          isEqualTo: true,
        ),
      );
      _model.offers = _model.offersData!.toList().cast<OfferRecord>();
      _model.trendingOffers =
          _model.trendingOffersData!.toList().cast<OfferRecord>();
      safeSetState(() {});
      if (!FFAppState().notificationsEnabled) {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(dialogContext).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Container(
                  height: 250.0,
                  width: 250.0,
                  child: ProfileInfoDialogWidget(
                    title:
                        'Notification service is diable. Enable it to get better service',
                  ),
                ),
              ),
            );
          },
        );
      }
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-20.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
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
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-20.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
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
      'columnOnPageLoadAnimation3': AnimationInfo(
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
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-20.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation4': AnimationInfo(
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
      'columnOnPageLoadAnimation5': AnimationInfo(
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

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 10.0, 0.0, 0.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? 'assets/images/Promotrack_white.png'
                                          : 'assets/images/Promotrack_white.png',
                                      width: 294.0,
                                      height: 54.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['columnOnPageLoadAnimation1']!),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).tertiary,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 4.0, 0.0),
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
                                            fontSize: 15.0,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 7.0),
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
                                  _model.offersResetData =
                                      await queryOfferRecordOnce(
                                    limit: 3,
                                  );
                                  _model.offers = _model.offersResetData!
                                      .toList()
                                      .cast<OfferRecord>();
                                  _model.selectedTab = OfferOptionStruct(
                                    color: FlutterFlowTheme.of(context).primary,
                                  );
                                  safeSetState(() {});

                                  context
                                      .pushNamed(AllOffersViewWidget.routeName);

                                  safeSetState(() {});
                                },
                                child: Container(
                                  height: 32.0,
                                  decoration: BoxDecoration(
                                    color: _model.type == null ||
                                            _model.type == ''
                                        ? FlutterFlowTheme.of(context).primary
                                        : Color(0x00000000),
                                    borderRadius: BorderRadius.circular(16.0),
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                                                    : FlutterFlowTheme.of(
                                                            context)
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
                                    children:
                                        List.generate(offerCategory.length,
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
                                          _model.offersTypeData =
                                              await queryOfferRecordOnce(
                                            queryBuilder: (offerRecord) =>
                                                offerRecord.where(
                                              'type',
                                              isEqualTo:
                                                  offerCategoryItem.label,
                                            ),
                                            limit: 3,
                                          );
                                          _model.offers = _model.offersTypeData!
                                              .toList()
                                              .cast<OfferRecord>();
                                          _model.type = offerCategoryItem.label;
                                          _model.selectedTab =
                                              OfferOptionStruct(
                                            color: valueOrDefault<Color>(
                                              offerCategoryItem.color,
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          );
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                        child: Container(
                                          height: 32.0,
                                          decoration: BoxDecoration(
                                            color: _model.type ==
                                                    offerCategoryItem.label
                                                ? offerCategoryItem.color
                                                : Color(0x00000000),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            border: Border.all(
                                              color: valueOrDefault<Color>(
                                                offerCategoryItem.color,
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 4.0, 8.0, 4.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (offerCategoryItem.label ==
                                                    'Deal')
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
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
                                                        BorderRadius.circular(
                                                            0.0),
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
                                                        BorderRadius.circular(
                                                            0.0),
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
                                                        BorderRadius.circular(
                                                            0.0),
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
                                                        BorderRadius.circular(
                                                            0.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/balloon.svg',
                                                      width: 20.0,
                                                      height: 20.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                Text(
                                                  offerCategoryItem.label,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.type ==
                                                                  offerCategoryItem
                                                                      .label
                                                              ? Colors.white
                                                              : offerCategoryItem
                                                                  .color,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                        ),
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation']!),
                      ),
                      Divider(
                        height: 40.0,
                        thickness: 8.0,
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                      StreamBuilder<List<AdvertRecord>>(
                        stream: queryAdvertRecord(),
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
                          List<AdvertRecord> containerAdvertRecordList =
                              snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(),
                            child: Visibility(
                              visible: containerAdvertRecordList.isNotEmpty,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 16.0),
                                child: Builder(
                                  builder: (context) {
                                    final containerVar =
                                        containerAdvertRecordList.toList();

                                    return Container(
                                      width: double.infinity,
                                      height: 150.0,
                                      child: CarouselSlider.builder(
                                        itemCount: containerVar.length,
                                        itemBuilder:
                                            (context, containerVarIndex, _) {
                                          final containerVarItem =
                                              containerVar[containerVarIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (containerVarItem.link !=
                                                      null &&
                                                  containerVarItem.link != '') {
                                                await launchURL(
                                                    containerVarItem.link);
                                              } else {
                                                context.pushNamed(
                                                  AdvertWidget.routeName,
                                                  queryParameters: {
                                                    'advertRef': serializeParam(
                                                      containerVarItem
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                containerVarItem.imageUrl,
                                                width: 200.0,
                                                height: 219.0,
                                                fit: BoxFit.cover,
                                                alignment: Alignment(0.0, 0.0),
                                              ),
                                            ),
                                          );
                                        },
                                        carouselController:
                                            _model.carouselController ??=
                                                CarouselSliderController(),
                                        options: CarouselOptions(
                                          initialPage: max(0,
                                              min(1, containerVar.length - 1)),
                                          viewportFraction: 1.0,
                                          disableCenter: true,
                                          enlargeCenterPage: true,
                                          enlargeFactor: 0.5,
                                          enableInfiniteScroll: true,
                                          scrollDirection: Axis.horizontal,
                                          autoPlay: false,
                                          onPageChanged: (index, _) => _model
                                              .carouselCurrentIndex = index,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 16.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Promotions \ndu moment',
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation1']!),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  AllOffersViewWidget.routeName,
                                  queryParameters: {
                                    'type': serializeParam(
                                      _model.type,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                width: 100.0,
                                height: 35.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    _model.selectedTab?.color,
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Explorez',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 18.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_model.textController.text != null &&
                          _model.textController.text != '')
                        FutureBuilder<List<OfferRecord>>(
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
                            List<OfferRecord>
                                searchedPromotionOffersOfferRecordList =
                                snapshot.data!;
                            return Container(
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  if (searchedPromotionOffersOfferRecordList
                                          .where((e) =>
                                              (e.type == _model.type) ||
                                              (_model.type == null ||
                                                  _model.type == ''))
                                          .toList() ==
                                      null) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final searchedPromoOffers =
                                      searchedPromotionOffersOfferRecordList
                                          .where((e) =>
                                              (e.type == _model.type) ||
                                              (_model.type == null ||
                                                  _model.type == ''))
                                          .toList();
                                  if (searchedPromoOffers.isEmpty) {
                                    return EmptyShopWidget();
                                  }

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                            searchedPromoOffers.length,
                                            (searchedPromoOffersIndex) {
                                      final searchedPromoOffersItem =
                                          searchedPromoOffers[
                                              searchedPromoOffersIndex];
                                      return Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: OfferCardWidget(
                                            key: Key(
                                                'Keyh95_${searchedPromoOffersIndex}_of_${searchedPromoOffers.length}'),
                                            likeable: true,
                                            offer: searchedPromoOffersItem,
                                            isOwner: false,
                                            callback: () async {
                                              await searchedPromoOffersItem
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'click_nb':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: 350.0,
                                                        width: 350.0,
                                                        child:
                                                            DialogOfferDetailsWidget(
                                                          offer:
                                                              searchedPromoOffersItem,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      );
                                    })
                                        .divide(SizedBox(height: 16.0))
                                        .addToEnd(SizedBox(height: 16.0)),
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation2']!);
                                },
                              ),
                            );
                          },
                        ),
                      if (_model.textController.text == null ||
                          _model.textController.text == '')
                        Container(
                          decoration: BoxDecoration(),
                          child: Builder(
                            builder: (context) {
                              final offerList = _model.offers
                                  .where((e) =>
                                      (e.type == _model.type) ||
                                      (_model.type == null ||
                                          _model.type == ''))
                                  .toList();
                              if (offerList.isEmpty) {
                                return EmptyShopWidget();
                              }

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(offerList.length,
                                        (offerListIndex) {
                                  final offerListItem =
                                      offerList[offerListIndex];
                                  return Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: OfferCardWidget(
                                        key: Key(
                                            'Keypaf_${offerListIndex}_of_${offerList.length}'),
                                        likeable: true,
                                        offer: offerListItem,
                                        isOwner: false,
                                        callback: () async {
                                          await offerListItem.reference.update({
                                            ...mapToFirestore(
                                              {
                                                'click_nb':
                                                    FieldValue.increment(1),
                                              },
                                            ),
                                          });
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Container(
                                                    height: 350.0,
                                                    width: 350.0,
                                                    child:
                                                        DialogOfferDetailsWidget(
                                                      offer: offerListItem,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                })
                                    .divide(SizedBox(height: 16.0))
                                    .addToEnd(SizedBox(height: 16.0)),
                              ).animateOnPageLoad(
                                  animationsMap['columnOnPageLoadAnimation3']!);
                            },
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 10.0),
                              child: Text(
                                'Les Incontournables',
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 0.0,
                                    ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation2']!),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Icon(
                                Icons.star_rounded,
                                color: Color(0xFFFFD700),
                                size: 40.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (_model.textController.text != null &&
                          _model.textController.text != '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
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
                              List<OfferRecord>
                                  searchedTrendingOffersOfferRecordList =
                                  snapshot.data!;
                              return Container(
                                decoration: BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    if (searchedTrendingOffersOfferRecordList
                                            .where((e) =>
                                                ((e.type == _model.type) ||
                                                    (_model.type == null ||
                                                        _model.type == '')) &&
                                                (e.isTrending == true))
                                            .toList() ==
                                        null) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final searchedTrendingOffers =
                                        searchedTrendingOffersOfferRecordList
                                            .where((e) =>
                                                ((e.type == _model.type) ||
                                                    (_model.type == null ||
                                                        _model.type == '')) &&
                                                (e.isTrending == true))
                                            .toList();
                                    if (searchedTrendingOffers.isEmpty) {
                                      return EmptyShopWidget();
                                    }

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                              searchedTrendingOffers.length,
                                              (searchedTrendingOffersIndex) {
                                        final searchedTrendingOffersItem =
                                            searchedTrendingOffers[
                                                searchedTrendingOffersIndex];
                                        return Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: OfferCardWidget(
                                              key: Key(
                                                  'Keyxae_${searchedTrendingOffersIndex}_of_${searchedTrendingOffers.length}'),
                                              likeable: true,
                                              offer: searchedTrendingOffersItem,
                                              isOwner: false,
                                              callback: () async {
                                                await searchedTrendingOffersItem
                                                    .reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'click_nb':
                                                          FieldValue.increment(
                                                              1),
                                                    },
                                                  ),
                                                });
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          FocusScope.of(
                                                                  dialogContext)
                                                              .unfocus();
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        child: Container(
                                                          height: 350.0,
                                                          width: 350.0,
                                                          child:
                                                              DialogOfferDetailsWidget(
                                                            offer:
                                                                searchedTrendingOffersItem,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      })
                                          .divide(SizedBox(height: 16.0))
                                          .addToEnd(SizedBox(height: 16.0)),
                                    ).animateOnPageLoad(animationsMap[
                                        'columnOnPageLoadAnimation4']!);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      if (_model.textController.text == null ||
                          _model.textController.text == '')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final offerList = _model.trendingOffers
                                    .where((e) =>
                                        (e.type == _model.type) ||
                                        (_model.type == null ||
                                            _model.type == ''))
                                    .toList();
                                if (offerList.isEmpty) {
                                  return EmptyShopWidget();
                                }

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(offerList.length,
                                          (offerListIndex) {
                                    final offerListItem =
                                        offerList[offerListIndex];
                                    return Builder(
                                      builder: (context) => Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: OfferCardWidget(
                                          key: Key(
                                              'Key6bg_${offerListIndex}_of_${offerList.length}'),
                                          likeable: true,
                                          offer: offerListItem,
                                          isOwner: false,
                                          callback: () async {
                                            await offerListItem.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'click_nb':
                                                      FieldValue.increment(1),
                                                },
                                              ),
                                            });
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      FocusScope.of(
                                                              dialogContext)
                                                          .unfocus();
                                                      FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus();
                                                    },
                                                    child: Container(
                                                      height: 350.0,
                                                      width: 350.0,
                                                      child:
                                                          DialogOfferDetailsWidget(
                                                        offer: offerListItem,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  })
                                      .divide(SizedBox(height: 16.0))
                                      .addToEnd(SizedBox(height: 16.0)),
                                ).animateOnPageLoad(animationsMap[
                                    'columnOnPageLoadAnimation5']!);
                              },
                            ),
                          ),
                        ),
                    ].addToStart(SizedBox(height: 56.0)),
                  ),
                ),
              ),
              if (!(isWeb
                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                  : _isKeyboardVisible))
                wrapWithModel(
                  model: _model.navbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NavbarWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
