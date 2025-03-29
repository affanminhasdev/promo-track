import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_info_dialog_model.dart';
export 'profile_info_dialog_model.dart';

class ProfileInfoDialogWidget extends StatefulWidget {
  const ProfileInfoDialogWidget({
    super.key,
    String? title,
  }) : this.title = title ?? 'title';

  final String title;

  @override
  State<ProfileInfoDialogWidget> createState() =>
      _ProfileInfoDialogWidgetState();
}

class _ProfileInfoDialogWidgetState extends State<ProfileInfoDialogWidget> {
  late ProfileInfoDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileInfoDialogModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.info,
              color: FlutterFlowTheme.of(context).warning,
              size: 60.0,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
              child: Text(
                widget!.title,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  FFAppState().page = 'profile';
                  safeSetState(() {});

                  context.goNamed(ProfileWidget.routeName);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Go to  profile to manage',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Icon(
                        Icons.arrow_forward,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 22.0,
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
