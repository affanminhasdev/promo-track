// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OfferOptionStruct extends FFFirebaseStruct {
  OfferOptionStruct({
    String? label,
    Color? color,
    String? icon,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _label = label,
        _color = color,
        _icon = icon,
        super(firestoreUtilData);

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  set color(Color? val) => _color = val;

  bool hasColor() => _color != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  static OfferOptionStruct fromMap(Map<String, dynamic> data) =>
      OfferOptionStruct(
        label: data['label'] as String?,
        color: getSchemaColor(data['color']),
        icon: data['icon'] as String?,
      );

  static OfferOptionStruct? maybeFromMap(dynamic data) => data is Map
      ? OfferOptionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'color': _color,
        'icon': _icon,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'color': serializeParam(
          _color,
          ParamType.Color,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
      }.withoutNulls;

  static OfferOptionStruct fromSerializableMap(Map<String, dynamic> data) =>
      OfferOptionStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
      );

  static OfferOptionStruct fromAlgoliaData(Map<String, dynamic> data) =>
      OfferOptionStruct(
        label: convertAlgoliaParam(
          data['label'],
          ParamType.String,
          false,
        ),
        color: convertAlgoliaParam(
          data['color'],
          ParamType.Color,
          false,
        ),
        icon: convertAlgoliaParam(
          data['icon'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'OfferOptionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OfferOptionStruct &&
        label == other.label &&
        color == other.color &&
        icon == other.icon;
  }

  @override
  int get hashCode => const ListEquality().hash([label, color, icon]);
}

OfferOptionStruct createOfferOptionStruct({
  String? label,
  Color? color,
  String? icon,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OfferOptionStruct(
      label: label,
      color: color,
      icon: icon,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OfferOptionStruct? updateOfferOptionStruct(
  OfferOptionStruct? offerOption, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    offerOption
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOfferOptionStructData(
  Map<String, dynamic> firestoreData,
  OfferOptionStruct? offerOption,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (offerOption == null) {
    return;
  }
  if (offerOption.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && offerOption.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final offerOptionData =
      getOfferOptionFirestoreData(offerOption, forFieldValue);
  final nestedData =
      offerOptionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = offerOption.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOfferOptionFirestoreData(
  OfferOptionStruct? offerOption, [
  bool forFieldValue = false,
]) {
  if (offerOption == null) {
    return {};
  }
  final firestoreData = mapToFirestore(offerOption.toMap());

  // Add any Firestore field values
  offerOption.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOfferOptionListFirestoreData(
  List<OfferOptionStruct>? offerOptions,
) =>
    offerOptions?.map((e) => getOfferOptionFirestoreData(e, true)).toList() ??
    [];
