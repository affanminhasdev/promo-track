import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OfferRecord extends FirestoreRecord {
  OfferRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "base_price" field.
  double? _basePrice;
  double get basePrice => _basePrice ?? 0.0;
  bool hasBasePrice() => _basePrice != null;

  // "discount_price" field.
  double? _discountPrice;
  double get discountPrice => _discountPrice ?? 0.0;
  bool hasDiscountPrice() => _discountPrice != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "shop_title" field.
  String? _shopTitle;
  String get shopTitle => _shopTitle ?? '';
  bool hasShopTitle() => _shopTitle != null;

  // "shop_address" field.
  LatLng? _shopAddress;
  LatLng? get shopAddress => _shopAddress;
  bool hasShopAddress() => _shopAddress != null;

  // "shop_addressString" field.
  String? _shopAddressString;
  String get shopAddressString => _shopAddressString ?? '';
  bool hasShopAddressString() => _shopAddressString != null;

  // "shop_geohash" field.
  String? _shopGeohash;
  String get shopGeohash => _shopGeohash ?? '';
  bool hasShopGeohash() => _shopGeohash != null;

  // "shop_ref" field.
  DocumentReference? _shopRef;
  DocumentReference? get shopRef => _shopRef;
  bool hasShopRef() => _shopRef != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "shop_category" field.
  String? _shopCategory;
  String get shopCategory => _shopCategory ?? '';
  bool hasShopCategory() => _shopCategory != null;

  // "shop_city" field.
  String? _shopCity;
  String get shopCity => _shopCity ?? '';
  bool hasShopCity() => _shopCity != null;

  // "product_image" field.
  String? _productImage;
  String get productImage => _productImage ?? '';
  bool hasProductImage() => _productImage != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "click_nb" field.
  int? _clickNb;
  int get clickNb => _clickNb ?? 0;
  bool hasClickNb() => _clickNb != null;

  // "code_promo" field.
  String? _codePromo;
  String get codePromo => _codePromo ?? '';
  bool hasCodePromo() => _codePromo != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _basePrice = castToType<double>(snapshotData['base_price']);
    _discountPrice = castToType<double>(snapshotData['discount_price']);
    _description = snapshotData['description'] as String?;
    _logo = snapshotData['logo'] as String?;
    _shopTitle = snapshotData['shop_title'] as String?;
    _shopAddress = snapshotData['shop_address'] as LatLng?;
    _shopAddressString = snapshotData['shop_addressString'] as String?;
    _shopGeohash = snapshotData['shop_geohash'] as String?;
    _shopRef = snapshotData['shop_ref'] as DocumentReference?;
    _type = snapshotData['type'] as String?;
    _shopCategory = snapshotData['shop_category'] as String?;
    _shopCity = snapshotData['shop_city'] as String?;
    _productImage = snapshotData['product_image'] as String?;
    _link = snapshotData['link'] as String?;
    _clickNb = castToType<int>(snapshotData['click_nb']);
    _codePromo = snapshotData['code_promo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('offer');

  static Stream<OfferRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OfferRecord.fromSnapshot(s));

  static Future<OfferRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OfferRecord.fromSnapshot(s));

  static OfferRecord fromSnapshot(DocumentSnapshot snapshot) => OfferRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OfferRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OfferRecord._(reference, mapFromFirestore(data));

  static OfferRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      OfferRecord.getDocumentFromData(
        {
          'title': snapshot.data['title'],
          'end_date': convertAlgoliaParam(
            snapshot.data['end_date'],
            ParamType.DateTime,
            false,
          ),
          'base_price': convertAlgoliaParam(
            snapshot.data['base_price'],
            ParamType.double,
            false,
          ),
          'discount_price': convertAlgoliaParam(
            snapshot.data['discount_price'],
            ParamType.double,
            false,
          ),
          'description': snapshot.data['description'],
          'logo': snapshot.data['logo'],
          'shop_title': snapshot.data['shop_title'],
          'shop_address': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'shop_addressString': snapshot.data['shop_addressString'],
          'shop_geohash': snapshot.data['shop_geohash'],
          'shop_ref': convertAlgoliaParam(
            snapshot.data['shop_ref'],
            ParamType.DocumentReference,
            false,
          ),
          'type': snapshot.data['type'],
          'shop_category': snapshot.data['shop_category'],
          'shop_city': snapshot.data['shop_city'],
          'product_image': snapshot.data['product_image'],
          'link': snapshot.data['link'],
          'click_nb': convertAlgoliaParam(
            snapshot.data['click_nb'],
            ParamType.int,
            false,
          ),
          'code_promo': snapshot.data['code_promo'],
        },
        OfferRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<OfferRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'offer',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'OfferRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OfferRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOfferRecordData({
  String? title,
  DateTime? endDate,
  double? basePrice,
  double? discountPrice,
  String? description,
  String? logo,
  String? shopTitle,
  LatLng? shopAddress,
  String? shopAddressString,
  String? shopGeohash,
  DocumentReference? shopRef,
  String? type,
  String? shopCategory,
  String? shopCity,
  String? productImage,
  String? link,
  int? clickNb,
  String? codePromo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'end_date': endDate,
      'base_price': basePrice,
      'discount_price': discountPrice,
      'description': description,
      'logo': logo,
      'shop_title': shopTitle,
      'shop_address': shopAddress,
      'shop_addressString': shopAddressString,
      'shop_geohash': shopGeohash,
      'shop_ref': shopRef,
      'type': type,
      'shop_category': shopCategory,
      'shop_city': shopCity,
      'product_image': productImage,
      'link': link,
      'click_nb': clickNb,
      'code_promo': codePromo,
    }.withoutNulls,
  );

  return firestoreData;
}

class OfferRecordDocumentEquality implements Equality<OfferRecord> {
  const OfferRecordDocumentEquality();

  @override
  bool equals(OfferRecord? e1, OfferRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.endDate == e2?.endDate &&
        e1?.basePrice == e2?.basePrice &&
        e1?.discountPrice == e2?.discountPrice &&
        e1?.description == e2?.description &&
        e1?.logo == e2?.logo &&
        e1?.shopTitle == e2?.shopTitle &&
        e1?.shopAddress == e2?.shopAddress &&
        e1?.shopAddressString == e2?.shopAddressString &&
        e1?.shopGeohash == e2?.shopGeohash &&
        e1?.shopRef == e2?.shopRef &&
        e1?.type == e2?.type &&
        e1?.shopCategory == e2?.shopCategory &&
        e1?.shopCity == e2?.shopCity &&
        e1?.productImage == e2?.productImage &&
        e1?.link == e2?.link &&
        e1?.clickNb == e2?.clickNb &&
        e1?.codePromo == e2?.codePromo;
  }

  @override
  int hash(OfferRecord? e) => const ListEquality().hash([
        e?.title,
        e?.endDate,
        e?.basePrice,
        e?.discountPrice,
        e?.description,
        e?.logo,
        e?.shopTitle,
        e?.shopAddress,
        e?.shopAddressString,
        e?.shopGeohash,
        e?.shopRef,
        e?.type,
        e?.shopCategory,
        e?.shopCity,
        e?.productImage,
        e?.link,
        e?.clickNb,
        e?.codePromo
      ]);

  @override
  bool isValidKey(Object? o) => o is OfferRecord;
}
