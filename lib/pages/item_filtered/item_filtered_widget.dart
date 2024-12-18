import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/navbar/navbar_widget.dart';
import '/component/offer_card/offer_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modal/modal_offer_details/modal_offer_details_widget.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_filtered_model.dart';
export 'item_filtered_model.dart';

class ItemFilteredWidget extends StatefulWidget {
  const ItemFilteredWidget({
    super.key,
    required this.category,
  });

  final String? category;

  @override
  State<ItemFilteredWidget> createState() => _ItemFilteredWidgetState();
}

class _ItemFilteredWidgetState extends State<ItemFilteredWidget>
    with TickerProviderStateMixin {
  late ItemFilteredModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemFilteredModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
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
      'listViewOnPageLoadAnimation': AnimationInfo(
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Hero(
                                  tag: functions.stringToImagePath(() {
                                    if (widget!.category == 'Mode') {
                                      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/pu4f9gmve1ey/1.png';
                                    } else if (widget!.category ==
                                        'Technologie & Electronique') {
                                      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/97k3jxicqdi4/2.png';
                                    } else if (widget!.category == 'Voyage') {
                                      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/poxc99xgmmrf/3.png';
                                    } else if (widget!.category ==
                                        'Beauté & Bien être') {
                                      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/kg0bwfllyjnv/5.png';
                                    } else if (widget!.category ==
                                        'Alimentation') {
                                      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/81hxsqe3awzs/7.png';
                                    } else if (widget!.category == 'Sport') {
                                      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/e51djb1rz140/4.png';
                                    } else if (widget!.category ==
                                        'Finance & Éducation') {
                                      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/6cif7wk1z3fv/6.png';
                                    } else {
                                      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/oj2apvamr3tg/denim-1866725.jpg';
                                    }
                                  }()),
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0.0),
                                    child: Image.network(
                                      functions.stringToImagePath(() {
                                        if (widget!.category == 'Mode') {
                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/pu4f9gmve1ey/1.png';
                                        } else if (widget!.category ==
                                            'Technologie & Electronique') {
                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/97k3jxicqdi4/2.png';
                                        } else if (widget!.category ==
                                            'Voyage') {
                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/poxc99xgmmrf/3.png';
                                        } else if (widget!.category ==
                                            'Beauté & Bien être') {
                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/kg0bwfllyjnv/5.png';
                                        } else if (widget!.category ==
                                            'Alimentation') {
                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/81hxsqe3awzs/7.png';
                                        } else if (widget!.category ==
                                            'Sport') {
                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/e51djb1rz140/4.png';
                                        } else if (widget!.category ==
                                            'Finance & Éducation') {
                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/6cif7wk1z3fv/6.png';
                                        } else {
                                          return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/oj2apvamr3tg/denim-1866725.jpg';
                                        }
                                      }()),
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.25,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SafeArea(
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 32.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.safePop();
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 30.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        height: 2.0,
                        thickness: 10.0,
                        color: FlutterFlowTheme.of(context).tertiary,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 20.0, 12.0, 32.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Les offres',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation']!),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                          StreamBuilder<List<OfferRecord>>(
                            stream: queryOfferRecord(
                              queryBuilder: (offerRecord) => offerRecord.where(
                                'shop_category',
                                isEqualTo: widget!.category,
                              ),
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
                              List<OfferRecord> listViewOfferRecordList =
                                  snapshot.data!;

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewOfferRecordList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 16.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewOfferRecord =
                                      listViewOfferRecordList[listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await listViewOfferRecord.reference
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
                                          backgroundColor: Colors.transparent,
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
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.5,
                                                  child:
                                                      ModalOfferDetailsWidget(
                                                    offer: listViewOfferRecord,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: OfferCardWidget(
                                        key: Key(
                                            'Keyjcf_${listViewIndex}_of_${listViewOfferRecordList.length}'),
                                        likeable: true,
                                        offer: listViewOfferRecord,
                                        isOwner: false,
                                      ),
                                    ),
                                  );
                                },
                              ).animateOnPageLoad(animationsMap[
                                  'listViewOnPageLoadAnimation']!);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 70.0,
                decoration: BoxDecoration(),
                child: Visibility(
                  visible: !(isWeb
                      ? MediaQuery.viewInsetsOf(context).bottom > 0
                      : _isKeyboardVisible),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navbarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavbarWidget(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
