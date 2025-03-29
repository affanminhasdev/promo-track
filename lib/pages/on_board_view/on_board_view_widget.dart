import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'on_board_view_model.dart';
export 'on_board_view_model.dart';

class OnBoardViewWidget extends StatefulWidget {
  const OnBoardViewWidget({super.key});

  static String routeName = 'OnBoardView';
  static String routePath = '/onBoardView';

  @override
  State<OnBoardViewWidget> createState() => _OnBoardViewWidgetState();
}

class _OnBoardViewWidgetState extends State<OnBoardViewWidget> {
  late OnBoardViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnBoardViewModel());

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
          child: Builder(
            builder: (context) {
              final onboardImage = FFAppState().onboardingImages.toList();

              return Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _model.pageViewController ??= PageController(
                          initialPage: max(0, min(0, onboardImage.length - 1))),
                      scrollDirection: Axis.horizontal,
                      itemCount: onboardImage.length,
                      itemBuilder: (context, onboardImageIndex) {
                        final onboardImageItem =
                            onboardImage[onboardImageIndex];
                        return Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF01BF63),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowMediaDisplay(
                                  path: onboardImageItem,
                                  imageBuilder: (path) => ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      path,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  videoPlayerBuilder: (path) =>
                                      FlutterFlowVideoPlayer(
                                    path: path,
                                    width: 300.0,
                                    autoPlay: false,
                                    looping: false,
                                    showControls: true,
                                    allowFullScreen: true,
                                    allowPlaybackSpeedMenu: false,
                                  ),
                                ),
                              ),
                              if (onboardImageIndex ==
                                  (FFAppState().onboardingImages.length - 1))
                                Align(
                                  alignment: AlignmentDirectional(1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 20.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.goNamed(LoginWidget.routeName);
                                      },
                                      child: Text(
                                        'Skip',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller: _model.pageViewController ??=
                              PageController(
                                  initialPage:
                                      max(0, min(0, onboardImage.length - 1))),
                          count: onboardImage.length,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) async {
                            await _model.pageViewController!.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                            safeSetState(() {});
                          },
                          effect: smooth_page_indicator.ExpandingDotsEffect(
                            expansionFactor: 2.0,
                            spacing: 8.0,
                            radius: 16.0,
                            dotWidth: 16.0,
                            dotHeight: 4.0,
                            dotColor: Colors.white,
                            activeDotColor:
                                FlutterFlowTheme.of(context).warning,
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
