import '/backend/backend.dart';
import '/component/empty_shop/empty_shop_widget.dart';
import '/component/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shops_model.dart';
export 'shops_model.dart';

class ShopsWidget extends StatefulWidget {
  const ShopsWidget({super.key});

  @override
  State<ShopsWidget> createState() => _ShopsWidgetState();
}

class _ShopsWidgetState extends State<ShopsWidget>
    with TickerProviderStateMixin {
  late ShopsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShopsModel());

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
    return StreamBuilder<List<ShopRecord>>(
      stream: queryShopRecord(
        queryBuilder: (shopRecord) => shopRecord
            .where(
              'offerNb',
              isGreaterThan: 0,
            )
            .where(
              'category',
              isEqualTo: _model.category,
            ),
        limit: 100,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
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
        List<ShopRecord> shopsShopRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 56.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          Theme.of(context).brightness == Brightness.dark
                              ? 'assets/images/Promotrack_white.png'
                              : 'assets/images/promotrack_black.png',
                          width: 294.0,
                          height: 54.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 40.0,
                  thickness: 8.0,
                  color: FlutterFlowTheme.of(context).tertiary,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 24.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (_model.isList == true)
                                Text(
                                  'Univers',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation']!),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final botiqueCat = FFAppConstants.vendorCategory
                                  .toList()
                                  .take(6)
                                  .toList();
                              if (botiqueCat.isEmpty) {
                                return Center(
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: EmptyShopWidget(),
                                  ),
                                );
                              }

                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12.0,
                                  mainAxisSpacing: 12.0,
                                  childAspectRatio: 1.0,
                                ),
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: botiqueCat.length,
                                itemBuilder: (context, botiqueCatIndex) {
                                  final botiqueCatItem =
                                      botiqueCat[botiqueCatIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'itemFiltered',
                                        queryParameters: {
                                          'category': serializeParam(
                                            botiqueCatItem,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.network(
                                            functions.stringToImagePath(() {
                                              if (botiqueCatItem == 'Mode') {
                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/pu4f9gmve1ey/1.png';
                                              } else if (botiqueCatItem ==
                                                  'Technologie & Electronique') {
                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/97k3jxicqdi4/2.png';
                                              } else if (botiqueCatItem ==
                                                  'Voyage') {
                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/poxc99xgmmrf/3.png';
                                              } else if (botiqueCatItem ==
                                                  'Beauté & Bien être') {
                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/kg0bwfllyjnv/5.png';
                                              } else if (botiqueCatItem ==
                                                  'Alimentation') {
                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/81hxsqe3awzs/7.png';
                                              } else if (botiqueCatItem ==
                                                  'Sport') {
                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/e51djb1rz140/4.png';
                                              } else if (botiqueCatItem ==
                                                  'Finance  & Education') {
                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/6cif7wk1z3fv/6.png';
                                              } else {
                                                return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/6cif7wk1z3fv/6.png';
                                              }
                                            }()),
                                          ).image,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(
                                      'itemFiltered',
                                      queryParameters: {
                                        'category': serializeParam(
                                          FFAppConstants
                                              .vendorCategory.lastOrNull,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 160.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.network(
                                          functions.stringToImagePath(
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/pnlku1glksbr/Capture_d%E2%80%99e%CC%81cran_2024-12-10_a%CC%80_14.04.14.png'),
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
        );
      },
    );
  }
}
