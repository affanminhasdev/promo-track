import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShopRecord extends FirestoreRecord {
  ShopRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "cover_picture" field.
  String? _coverPicture;
  String get coverPicture => _coverPicture ?? '';
  bool hasCoverPicture() => _coverPicture != null;

  // "address" field.
  LatLng? _address;
  LatLng? get address => _address;
  bool hasAddress() => _address != null;

  // "addressString" field.
  String? _addressString;
  String get addressString => _addressString ?? '';
  bool hasAddressString() => _addressString != null;

  // "geohash" field.
  String? _geohash;
  String get geohash => _geohash ?? '';
  bool hasGeohash() => _geohash != null;

  // "offerNb" field.
  int? _offerNb;
  int get offerNb => _offerNb ?? 0;
  bool hasOfferNb() => _offerNb != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "website_name" field.
  String? _websiteName;
  String get websiteName => _websiteName ?? '';
  bool hasWebsiteName() => _websiteName != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _category = snapshotData['category'] as String?;
    _coverPicture = snapshotData['cover_picture'] as String?;
    _address = snapshotData['address'] as LatLng?;
    _addressString = snapshotData['addressString'] as String?;
    _geohash = snapshotData['geohash'] as String?;
    _offerNb = castToType<int>(snapshotData['offerNb']);
    _city = snapshotData['city'] as String?;
    _link = snapshotData['link'] as String?;
    _websiteName = snapshotData['website_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shop');

  static Stream<ShopRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShopRecord.fromSnapshot(s));

  static Future<ShopRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShopRecord.fromSnapshot(s));

  static ShopRecord fromSnapshot(DocumentSnapshot snapshot) => ShopRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShopRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShopRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShopRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShopRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShopRecordData({
  String? title,
  String? category,
  String? coverPicture,
  LatLng? address,
  String? addressString,
  String? geohash,
  int? offerNb,
  String? city,
  String? link,
  String? websiteName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'category': category,
      'cover_picture': coverPicture,
      'address': address,
      'addressString': addressString,
      'geohash': geohash,
      'offerNb': offerNb,
      'city': city,
      'link': link,
      'website_name': websiteName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShopRecordDocumentEquality implements Equality<ShopRecord> {
  const ShopRecordDocumentEquality();

  @override
  bool equals(ShopRecord? e1, ShopRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.category == e2?.category &&
        e1?.coverPicture == e2?.coverPicture &&
        e1?.address == e2?.address &&
        e1?.addressString == e2?.addressString &&
        e1?.geohash == e2?.geohash &&
        e1?.offerNb == e2?.offerNb &&
        e1?.city == e2?.city &&
        e1?.link == e2?.link &&
        e1?.websiteName == e2?.websiteName;
  }

  @override
  int hash(ShopRecord? e) => const ListEquality().hash([
        e?.title,
        e?.category,
        e?.coverPicture,
        e?.address,
        e?.addressString,
        e?.geohash,
        e?.offerNb,
        e?.city,
        e?.link,
        e?.websiteName
      ]);

  @override
  bool isValidKey(Object? o) => o is ShopRecord;
}
