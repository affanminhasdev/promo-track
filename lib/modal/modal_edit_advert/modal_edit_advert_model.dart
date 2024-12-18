import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/offer_selector_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import 'modal_edit_advert_widget.dart' show ModalEditAdvertWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalEditAdvertModel extends FlutterFlowModel<ModalEditAdvertWidget> {
  ///  Local state fields for this component.

  List<DocumentReference> listSelectedOffer = [];
  void addToListSelectedOffer(DocumentReference item) =>
      listSelectedOffer.add(item);
  void removeFromListSelectedOffer(DocumentReference item) =>
      listSelectedOffer.remove(item);
  void removeAtIndexFromListSelectedOffer(int index) =>
      listSelectedOffer.removeAt(index);
  void insertAtIndexInListSelectedOffer(int index, DocumentReference item) =>
      listSelectedOffer.insert(index, item);
  void updateListSelectedOfferAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      listSelectedOffer[index] = updateFn(listSelectedOffer[index]);

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Models for OfferSelector dynamic component.
  late FlutterFlowDynamicModels<OfferSelectorModel> offerSelectorModels;

  @override
  void initState(BuildContext context) {
    offerSelectorModels = FlutterFlowDynamicModels(() => OfferSelectorModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    offerSelectorModels.dispose();
  }
}
