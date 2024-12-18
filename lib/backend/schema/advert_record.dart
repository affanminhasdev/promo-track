import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdvertRecord extends FirestoreRecord {
  AdvertRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "listOffer" field.
  List<DocumentReference>? _listOffer;
  List<DocumentReference> get listOffer => _listOffer ?? const [];
  bool hasListOffer() => _listOffer != null;

  void _initializeFields() {
    _imageUrl = snapshotData['image_url'] as String?;
    _link = snapshotData['link'] as String?;
    _name = snapshotData['name'] as String?;
    _listOffer = getDataList(snapshotData['listOffer']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('advert');

  static Stream<AdvertRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdvertRecord.fromSnapshot(s));

  static Future<AdvertRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdvertRecord.fromSnapshot(s));

  static AdvertRecord fromSnapshot(DocumentSnapshot snapshot) => AdvertRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdvertRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdvertRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdvertRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdvertRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdvertRecordData({
  String? imageUrl,
  String? link,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image_url': imageUrl,
      'link': link,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdvertRecordDocumentEquality implements Equality<AdvertRecord> {
  const AdvertRecordDocumentEquality();

  @override
  bool equals(AdvertRecord? e1, AdvertRecord? e2) {
    const listEquality = ListEquality();
    return e1?.imageUrl == e2?.imageUrl &&
        e1?.link == e2?.link &&
        e1?.name == e2?.name &&
        listEquality.equals(e1?.listOffer, e2?.listOffer);
  }

  @override
  int hash(AdvertRecord? e) =>
      const ListEquality().hash([e?.imageUrl, e?.link, e?.name, e?.listOffer]);

  @override
  bool isValidKey(Object? o) => o is AdvertRecord;
}
