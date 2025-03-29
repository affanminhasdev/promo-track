import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/offer_like_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'discover_view_model.dart';
export 'discover_view_model.dart';

class DiscoverViewWidget extends StatefulWidget {
  const DiscoverViewWidget({super.key});

  static String routeName = 'DiscoverView';
  static String routePath = '/discoverView';

  @override
  State<DiscoverViewWidget> createState() => _DiscoverViewWidgetState();
}

class _DiscoverViewWidgetState extends State<DiscoverViewWidget> {
  late DiscoverViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiscoverViewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      _model.allOffersResult = await queryOfferRecordOnce();
      _model.nearbyOffers = await actions.getNearbyOffer(
        _model.allOffersResult!.toList(),
        currentUserLocationValue!,
      );
      _model.allOffers = _model.allOffersResult!.toList().cast<OfferRecord>();
      _model.allNearbyOffers =
          _model.nearbyOffers!.toList().cast<OfferRecord>();
      _model.isLoading = false;
      safeSetState(() {});
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

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
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.search,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 24.0,
                          ),
                          Text(
                            'Promotrack',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.searchEnabled = !_model.searchEnabled;
                              safeSetState(() {});
                            },
                            child: Icon(
                              Icons.search,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 28.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.white,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final categories =
                              FFAppConstants.vendorCategory.toList();

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(categories.length,
                                  (categoriesIndex) {
                                final categoriesItem =
                                    categories[categoriesIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.selectedCategory = categoriesItem;
                                      safeSetState(() {});
                                      if (categoriesItem == 'Tout') {
                                        _model.filterOffersMain =
                                            await queryOfferRecordOnce();
                                        _model.allOffers = _model
                                            .filterOffersMain!
                                            .toList()
                                            .cast<OfferRecord>();
                                        safeSetState(() {});
                                      } else {
                                        _model.filterOffers =
                                            await queryOfferRecordOnce(
                                          queryBuilder: (offerRecord) =>
                                              offerRecord.where(
                                            'shop_category',
                                            isEqualTo: categoriesItem,
                                          ),
                                        );
                                        _model.allOffers = _model.filterOffers!
                                            .toList()
                                            .cast<OfferRecord>();
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: categoriesItem ==
                                                _model.selectedCategory
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : Color(0x00000000),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 5.0),
                                        child: Text(
                                          categoriesItem,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                    if (_model.searchEnabled)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 15.0, 12.0, 0.0),
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
                                        () async {
                                          safeSetState(() => _model
                                              .algoliaSearchResults = null);
                                          await OfferRecord.search(
                                            term: _model.textController.text,
                                          )
                                              .then((r) => _model
                                                  .algoliaSearchResults = r)
                                              .onError((_, __) => _model
                                                  .algoliaSearchResults = [])
                                              .whenComplete(
                                                  () => safeSetState(() {}));
                                        },
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
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (_model.selectedCategory == 'Tout')
                                StreamBuilder<List<AdvertDiscoveryRecord>>(
                                  stream: queryAdvertDiscoveryRecord(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
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
                                    List<AdvertDiscoveryRecord>
                                        containerAdvertDiscoveryRecordList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Builder(
                                        builder: (context) {
                                          final advert =
                                              containerAdvertDiscoveryRecordList
                                                  .toList();

                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: List.generate(
                                                  advert.length, (advertIndex) {
                                                final advertItem =
                                                    advert[advertIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (advertItem.link !=
                                                              null &&
                                                          advertItem.link !=
                                                              '') {
                                                        await launchURL(
                                                            advertItem.link);
                                                      } else {
                                                        context.pushNamed(
                                                          AdvertDiscoveryWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'advertDiscoveryRef':
                                                                serializeParam(
                                                              advertItem
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
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        advertItem.imageUrl,
                                                        width: 350.0,
                                                        height: 219.0,
                                                        fit: BoxFit.cover,
                                                        alignment:
                                                            Alignment(0.0, 0.0),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              if (_model.selectedCategory == 'Tout')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 5.0, 16.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Offres à proximité ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                    AllOfferNearbyViewWidget
                                                        .routeName);
                                              },
                                              child: Container(
                                                width: 100.0,
                                                height: 35.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Tout voir',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyLarge
                                                            .override(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontSize: 13.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 22.0, 0.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final offers = _model
                                                .allNearbyOffers
                                                .sortedList(
                                                    keyOf: (e) =>
                                                        e.shopDistanceKm,
                                                    desc: false)
                                                .toList()
                                                .take(10)
                                                .toList();

                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children:
                                                    List.generate(offers.length,
                                                        (offersIndex) {
                                                  final offersItem =
                                                      offers[offersIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 210.0,
                                                      height: 240.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  20.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  20.0),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              '${offersItem.shopDistanceKm.toStringAsFixed(2)} km',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 210.0,
                                                            height: 210.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF1E2428),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    2.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            3.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              28.0,
                                                                          height:
                                                                              28.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              offersItem.logo,
                                                                              'https://picsum.photos/seed/110/600',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              offersItem.shopTitle,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 11.5,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              3.0,
                                                                              0.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              if (offersItem.type == 'Deal') {
                                                                                return ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                  child: SvgPicture.asset(
                                                                                    'assets/images/megaphone.svg',
                                                                                    width: 20.0,
                                                                                    height: 20.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                );
                                                                              } else if (offersItem.type == 'Coupon') {
                                                                                return ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                  child: SvgPicture.asset(
                                                                                    'assets/images/coupon.svg',
                                                                                    width: 20.0,
                                                                                    height: 20.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                );
                                                                              } else if (offersItem.type == 'Dernière Minute') {
                                                                                return ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                  child: SvgPicture.asset(
                                                                                    'assets/images/hot-sale.svg',
                                                                                    width: 20.0,
                                                                                    height: 20.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                );
                                                                              } else if (offersItem.type == 'Étudiant') {
                                                                                return ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                  child: SvgPicture.asset(
                                                                                    'assets/images/etudiant.svg',
                                                                                    width: 20.0,
                                                                                    height: 20.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                );
                                                                              } else {
                                                                                return ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                  child: SvgPicture.asset(
                                                                                    'assets/images/balloon.svg',
                                                                                    width: 20.0,
                                                                                    height: 20.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                );
                                                                              }
                                                                            },
                                                                          ),
                                                                        ),
                                                                        OfferLikeWidget(
                                                                          key: Key(
                                                                              'Key27r_${offersIndex}_of_${offers.length}'),
                                                                          offer:
                                                                              offersItem.reference,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Stack(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            2.0,
                                                                            5.0,
                                                                            2.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            offersItem.productImage,
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                100.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if ((offersItem.basePrice !=
                                                                                null) &&
                                                                            (offersItem.discountPrice ==
                                                                                null)) {
                                                                          return Text(
                                                                            '\$${offersItem.basePrice.toString()}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          );
                                                                        } else if (((offersItem.basePrice != null) && (offersItem.basePrice > 0.0)) &&
                                                                            ((offersItem.discountPrice != null) &&
                                                                                (offersItem.discountPrice > 0.0))) {
                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                '\$${offersItem.basePrice.toString()}',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      decoration: TextDecoration.lineThrough,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  '\$${offersItem.discountPrice.toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        } else {
                                                                          return Text(
                                                                            'Hello World',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Color(0xFF1E2428),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            7.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      offersItem
                                                                          .title,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      maxLines:
                                                                          1,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            letterSpacing:
                                                                                0.0,
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
                                                }),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Container(
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible: !_model.isLoading,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 20.0, 12.0, 80.0),
                                    child: Builder(
                                      builder: (context) {
                                        final offerList = (_model.textController
                                                                .text !=
                                                            null &&
                                                        _model.textController
                                                                .text !=
                                                            ''
                                                    ? _model
                                                        .algoliaSearchResults
                                                        ?.where((e) =>
                                                            (e.shopCategory ==
                                                                _model
                                                                    .selectedCategory) ||
                                                            (_model.selectedCategory ==
                                                                'Tout'))
                                                        .toList()
                                                    : _model.allOffers)
                                                ?.toList() ??
                                            [];

                                        return GridView.builder(
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                            childAspectRatio: 0.75,
                                          ),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: offerList.length,
                                          itemBuilder:
                                              (context, offerListIndex) {
                                            final offerListItem =
                                                offerList[offerListIndex];
                                            return Container(
                                              height: 240.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    height: 40.0,
                                                    child: custom_widgets
                                                        .DistanceInKM(
                                                      width: double.infinity,
                                                      height: 40.0,
                                                      geoHash: offerListItem
                                                          .shopGeohash,
                                                      currentLocation:
                                                          currentUserLocationValue!,
                                                    ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await launchURL(
                                                          offerListItem.link);
                                                    },
                                                    child: Container(
                                                      width: 200.0,
                                                      height: 200.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF1E2428),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            offerListItem
                                                                .productImage,
                                                            'https://picsum.photos/seed/120/600',
                                                          ),
                                                          width: 200.0,
                                                          height: 200.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              if (_model.isLoading)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Container(
                                    width: 45.0,
                                    height: 45.0,
                                    child: custom_widgets.CustomLoader(
                                      width: 45.0,
                                      height: 45.0,
                                      size: 45.0,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (!(isWeb
                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                  : _isKeyboardVisible))
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.navbarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NavbarWidget(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
