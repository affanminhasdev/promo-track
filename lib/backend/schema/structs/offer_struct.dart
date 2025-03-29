// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OfferStruct extends FFFirebaseStruct {
  OfferStruct({
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
    DocumentReference? offerReference,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _endDate = endDate,
        _basePrice = basePrice,
        _discountPrice = discountPrice,
        _description = description,
        _logo = logo,
        _shopTitle = shopTitle,
        _shopAddress = shopAddress,
        _shopAddressString = shopAddressString,
        _shopGeohash = shopGeohash,
        _shopRef = shopRef,
        _type = type,
        _shopCategory = shopCategory,
        _shopCity = shopCity,
        _productImage = productImage,
        _link = link,
        _clickNb = clickNb,
        _codePromo = codePromo,
        _offerReference = offerReference,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? val) => _endDate = val;

  bool hasEndDate() => _endDate != null;

  // "base_price" field.
  double? _basePrice;
  double get basePrice => _basePrice ?? 0.0;
  set basePrice(double? val) => _basePrice = val;

  void incrementBasePrice(double amount) => basePrice = basePrice + amount;

  bool hasBasePrice() => _basePrice != null;

  // "discount_price" field.
  double? _discountPrice;
  double get discountPrice => _discountPrice ?? 0.0;
  set discountPrice(double? val) => _discountPrice = val;

  void incrementDiscountPrice(double amount) =>
      discountPrice = discountPrice + amount;

  bool hasDiscountPrice() => _discountPrice != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  // "shop_title" field.
  String? _shopTitle;
  String get shopTitle => _shopTitle ?? '';
  set shopTitle(String? val) => _shopTitle = val;

  bool hasShopTitle() => _shopTitle != null;

  // "shop_address" field.
  LatLng? _shopAddress;
  LatLng? get shopAddress => _shopAddress;
  set shopAddress(LatLng? val) => _shopAddress = val;

  bool hasShopAddress() => _shopAddress != null;

  // "shop_addressString" field.
  String? _shopAddressString;
  String get shopAddressString => _shopAddressString ?? '';
  set shopAddressString(String? val) => _shopAddressString = val;

  bool hasShopAddressString() => _shopAddressString != null;

  // "shop_geohash" field.
  String? _shopGeohash;
  String get shopGeohash => _shopGeohash ?? '';
  set shopGeohash(String? val) => _shopGeohash = val;

  bool hasShopGeohash() => _shopGeohash != null;

  // "shop_ref" field.
  DocumentReference? _shopRef;
  DocumentReference? get shopRef => _shopRef;
  set shopRef(DocumentReference? val) => _shopRef = val;

  bool hasShopRef() => _shopRef != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "shop_category" field.
  String? _shopCategory;
  String get shopCategory => _shopCategory ?? '';
  set shopCategory(String? val) => _shopCategory = val;

  bool hasShopCategory() => _shopCategory != null;

  // "shop_city" field.
  String? _shopCity;
  String get shopCity => _shopCity ?? '';
  set shopCity(String? val) => _shopCity = val;

  bool hasShopCity() => _shopCity != null;

  // "product_image" field.
  String? _productImage;
  String get productImage => _productImage ?? '';
  set productImage(String? val) => _productImage = val;

  bool hasProductImage() => _productImage != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;

  bool hasLink() => _link != null;

  // "click_nb" field.
  int? _clickNb;
  int get clickNb => _clickNb ?? 0;
  set clickNb(int? val) => _clickNb = val;

  void incrementClickNb(int amount) => clickNb = clickNb + amount;

  bool hasClickNb() => _clickNb != null;

  // "code_promo" field.
  String? _codePromo;
  String get codePromo => _codePromo ?? '';
  set codePromo(String? val) => _codePromo = val;

  bool hasCodePromo() => _codePromo != null;

  // "offer_reference" field.
  DocumentReference? _offerReference;
  DocumentReference? get offerReference => _offerReference;
  set offerReference(DocumentReference? val) => _offerReference = val;

  bool hasOfferReference() => _offerReference != null;

  static OfferStruct fromMap(Map<String, dynamic> data) => OfferStruct(
        title: data['title'] as String?,
        endDate: data['end_date'] as DateTime?,
        basePrice: castToType<double>(data['base_price']),
        discountPrice: castToType<double>(data['discount_price']),
        description: data['description'] as String?,
        logo: data['logo'] as String?,
        shopTitle: data['shop_title'] as String?,
        shopAddress: data['shop_address'] as LatLng?,
        shopAddressString: data['shop_addressString'] as String?,
        shopGeohash: data['shop_geohash'] as String?,
        shopRef: data['shop_ref'] as DocumentReference?,
        type: data['type'] as String?,
        shopCategory: data['shop_category'] as String?,
        shopCity: data['shop_city'] as String?,
        productImage: data['product_image'] as String?,
        link: data['link'] as String?,
        clickNb: castToType<int>(data['click_nb']),
        codePromo: data['code_promo'] as String?,
        offerReference: data['offer_reference'] as DocumentReference?,
      );

  static OfferStruct? maybeFromMap(dynamic data) =>
      data is Map ? OfferStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'end_date': _endDate,
        'base_price': _basePrice,
        'discount_price': _discountPrice,
        'description': _description,
        'logo': _logo,
        'shop_title': _shopTitle,
        'shop_address': _shopAddress,
        'shop_addressString': _shopAddressString,
        'shop_geohash': _shopGeohash,
        'shop_ref': _shopRef,
        'type': _type,
        'shop_category': _shopCategory,
        'shop_city': _shopCity,
        'product_image': _productImage,
        'link': _link,
        'click_nb': _clickNb,
        'code_promo': _codePromo,
        'offer_reference': _offerReference,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'end_date': serializeParam(
          _endDate,
          ParamType.DateTime,
        ),
        'base_price': serializeParam(
          _basePrice,
          ParamType.double,
        ),
        'discount_price': serializeParam(
          _discountPrice,
          ParamType.double,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
        'shop_title': serializeParam(
          _shopTitle,
          ParamType.String,
        ),
        'shop_address': serializeParam(
          _shopAddress,
          ParamType.LatLng,
        ),
        'shop_addressString': serializeParam(
          _shopAddressString,
          ParamType.String,
        ),
        'shop_geohash': serializeParam(
          _shopGeohash,
          ParamType.String,
        ),
        'shop_ref': serializeParam(
          _shopRef,
          ParamType.DocumentReference,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'shop_category': serializeParam(
          _shopCategory,
          ParamType.String,
        ),
        'shop_city': serializeParam(
          _shopCity,
          ParamType.String,
        ),
        'product_image': serializeParam(
          _productImage,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'click_nb': serializeParam(
          _clickNb,
          ParamType.int,
        ),
        'code_promo': serializeParam(
          _codePromo,
          ParamType.String,
        ),
        'offer_reference': serializeParam(
          _offerReference,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static OfferStruct fromSerializableMap(Map<String, dynamic> data) =>
      OfferStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        endDate: deserializeParam(
          data['end_date'],
          ParamType.DateTime,
          false,
        ),
        basePrice: deserializeParam(
          data['base_price'],
          ParamType.double,
          false,
        ),
        discountPrice: deserializeParam(
          data['discount_price'],
          ParamType.double,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
        shopTitle: deserializeParam(
          data['shop_title'],
          ParamType.String,
          false,
        ),
        shopAddress: deserializeParam(
          data['shop_address'],
          ParamType.LatLng,
          false,
        ),
        shopAddressString: deserializeParam(
          data['shop_addressString'],
          ParamType.String,
          false,
        ),
        shopGeohash: deserializeParam(
          data['shop_geohash'],
          ParamType.String,
          false,
        ),
        shopRef: deserializeParam(
          data['shop_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['shop'],
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        shopCategory: deserializeParam(
          data['shop_category'],
          ParamType.String,
          false,
        ),
        shopCity: deserializeParam(
          data['shop_city'],
          ParamType.String,
          false,
        ),
        productImage: deserializeParam(
          data['product_image'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        clickNb: deserializeParam(
          data['click_nb'],
          ParamType.int,
          false,
        ),
        codePromo: deserializeParam(
          data['code_promo'],
          ParamType.String,
          false,
        ),
        offerReference: deserializeParam(
          data['offer_reference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['offer'],
        ),
      );

  static OfferStruct fromAlgoliaData(Map<String, dynamic> data) => OfferStruct(
        title: convertAlgoliaParam(
          data['title'],
          ParamType.String,
          false,
        ),
        endDate: convertAlgoliaParam(
          data['end_date'],
          ParamType.DateTime,
          false,
        ),
        basePrice: convertAlgoliaParam(
          data['base_price'],
          ParamType.double,
          false,
        ),
        discountPrice: convertAlgoliaParam(
          data['discount_price'],
          ParamType.double,
          false,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        logo: convertAlgoliaParam(
          data['logo'],
          ParamType.String,
          false,
        ),
        shopTitle: convertAlgoliaParam(
          data['shop_title'],
          ParamType.String,
          false,
        ),
        shopAddress: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        shopAddressString: convertAlgoliaParam(
          data['shop_addressString'],
          ParamType.String,
          false,
        ),
        shopGeohash: convertAlgoliaParam(
          data['shop_geohash'],
          ParamType.String,
          false,
        ),
        shopRef: convertAlgoliaParam(
          data['shop_ref'],
          ParamType.DocumentReference,
          false,
        ),
        type: convertAlgoliaParam(
          data['type'],
          ParamType.String,
          false,
        ),
        shopCategory: convertAlgoliaParam(
          data['shop_category'],
          ParamType.String,
          false,
        ),
        shopCity: convertAlgoliaParam(
          data['shop_city'],
          ParamType.String,
          false,
        ),
        productImage: convertAlgoliaParam(
          data['product_image'],
          ParamType.String,
          false,
        ),
        link: convertAlgoliaParam(
          data['link'],
          ParamType.String,
          false,
        ),
        clickNb: convertAlgoliaParam(
          data['click_nb'],
          ParamType.int,
          false,
        ),
        codePromo: convertAlgoliaParam(
          data['code_promo'],
          ParamType.String,
          false,
        ),
        offerReference: convertAlgoliaParam(
          data['offer_reference'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'OfferStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OfferStruct &&
        title == other.title &&
        endDate == other.endDate &&
        basePrice == other.basePrice &&
        discountPrice == other.discountPrice &&
        description == other.description &&
        logo == other.logo &&
        shopTitle == other.shopTitle &&
        shopAddress == other.shopAddress &&
        shopAddressString == other.shopAddressString &&
        shopGeohash == other.shopGeohash &&
        shopRef == other.shopRef &&
        type == other.type &&
        shopCategory == other.shopCategory &&
        shopCity == other.shopCity &&
        productImage == other.productImage &&
        link == other.link &&
        clickNb == other.clickNb &&
        codePromo == other.codePromo &&
        offerReference == other.offerReference;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        endDate,
        basePrice,
        discountPrice,
        description,
        logo,
        shopTitle,
        shopAddress,
        shopAddressString,
        shopGeohash,
        shopRef,
        type,
        shopCategory,
        shopCity,
        productImage,
        link,
        clickNb,
        codePromo,
        offerReference
      ]);
}

OfferStruct createOfferStruct({
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
  DocumentReference? offerReference,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OfferStruct(
      title: title,
      endDate: endDate,
      basePrice: basePrice,
      discountPrice: discountPrice,
      description: description,
      logo: logo,
      shopTitle: shopTitle,
      shopAddress: shopAddress,
      shopAddressString: shopAddressString,
      shopGeohash: shopGeohash,
      shopRef: shopRef,
      type: type,
      shopCategory: shopCategory,
      shopCity: shopCity,
      productImage: productImage,
      link: link,
      clickNb: clickNb,
      codePromo: codePromo,
      offerReference: offerReference,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OfferStruct? updateOfferStruct(
  OfferStruct? offer, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    offer
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOfferStructData(
  Map<String, dynamic> firestoreData,
  OfferStruct? offer,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (offer == null) {
    return;
  }
  if (offer.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && offer.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final offerData = getOfferFirestoreData(offer, forFieldValue);
  final nestedData = offerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = offer.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOfferFirestoreData(
  OfferStruct? offer, [
  bool forFieldValue = false,
]) {
  if (offer == null) {
    return {};
  }
  final firestoreData = mapToFirestore(offer.toMap());

  // Add any Firestore field values
  offer.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOfferListFirestoreData(
  List<OfferStruct>? offers,
) =>
    offers?.map((e) => getOfferFirestoreData(e, true)).toList() ?? [];
