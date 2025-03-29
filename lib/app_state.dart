import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _location = latLngFromString(prefs.getString('ff_location')) ?? _location;
    });
    _safeInit(() {
      _locationString = prefs.getString('ff_locationString') ?? _locationString;
    });
    _safeInit(() {
      _distanceMax = prefs.getInt('ff_distanceMax') ?? _distanceMax;
    });
    _safeInit(() {
      _commerceTypes =
          prefs.getStringList('ff_commerceTypes') ?? _commerceTypes;
    });
    _safeInit(() {
      _offerFilterList = prefs
              .getStringList('ff_offerFilterList')
              ?.map((x) {
                try {
                  return OfferOptionStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _offerFilterList;
    });
    _safeInit(() {
      _locationAccess = prefs.getBool('ff_locationAccess') ?? _locationAccess;
    });
    _safeInit(() {
      _notificationsEnabled =
          prefs.getBool('ff_notificationsEnabled') ?? _notificationsEnabled;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _page = 'discount';
  String get page => _page;
  set page(String value) {
    _page = value;
  }

  LatLng? _location = LatLng(49.04313, 2.105287);
  LatLng? get location => _location;
  set location(LatLng? value) {
    _location = value;
    value != null
        ? prefs.setString('ff_location', value.serialize())
        : prefs.remove('ff_location');
  }

  String _locationString = '';
  String get locationString => _locationString;
  set locationString(String value) {
    _locationString = value;
    prefs.setString('ff_locationString', value);
  }

  int _distanceMax = 11;
  int get distanceMax => _distanceMax;
  set distanceMax(int value) {
    _distanceMax = value;
    prefs.setInt('ff_distanceMax', value);
  }

  String _userType = '';
  String get userType => _userType;
  set userType(String value) {
    _userType = value;
  }

  List<String> _commerceTypes = ['Mode', 'High'];
  List<String> get commerceTypes => _commerceTypes;
  set commerceTypes(List<String> value) {
    _commerceTypes = value;
    prefs.setStringList('ff_commerceTypes', value);
  }

  void addToCommerceTypes(String value) {
    commerceTypes.add(value);
    prefs.setStringList('ff_commerceTypes', _commerceTypes);
  }

  void removeFromCommerceTypes(String value) {
    commerceTypes.remove(value);
    prefs.setStringList('ff_commerceTypes', _commerceTypes);
  }

  void removeAtIndexFromCommerceTypes(int index) {
    commerceTypes.removeAt(index);
    prefs.setStringList('ff_commerceTypes', _commerceTypes);
  }

  void updateCommerceTypesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    commerceTypes[index] = updateFn(_commerceTypes[index]);
    prefs.setStringList('ff_commerceTypes', _commerceTypes);
  }

  void insertAtIndexInCommerceTypes(int index, String value) {
    commerceTypes.insert(index, value);
    prefs.setStringList('ff_commerceTypes', _commerceTypes);
  }

  List<OfferOptionStruct> _offerFilterList = [
    OfferOptionStruct.fromSerializableMap(jsonDecode(
        '{\"label\":\"Coupon\",\"color\":\"#8338ec\",\"icon\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/bpq09f7c4rxu/voucher.svg\"}')),
    OfferOptionStruct.fromSerializableMap(jsonDecode(
        '{\"label\":\"Deal\",\"color\":\"#318ce7\",\"icon\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/3gc65bld1yyt/megaphone.svg\"}')),
    OfferOptionStruct.fromSerializableMap(jsonDecode(
        '{\"label\":\"Dernière Minute\",\"color\":\"#ed1b24\",\"icon\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/zg5x9x7fiqn1/hot-sale.svg\"}')),
    OfferOptionStruct.fromSerializableMap(jsonDecode(
        '{\"label\":\"Étudiant\",\"color\":\"#ff8c00\",\"icon\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/k8qsgdf3qw66/graduation-cap.svg\"}')),
    OfferOptionStruct.fromSerializableMap(jsonDecode(
        '{\"label\":\"Anniversaire\",\"color\":\"#f20089\",\"icon\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/localeaz-qccdjt/assets/p05d95x2cbc8/balloon.svg\"}'))
  ];
  List<OfferOptionStruct> get offerFilterList => _offerFilterList;
  set offerFilterList(List<OfferOptionStruct> value) {
    _offerFilterList = value;
    prefs.setStringList(
        'ff_offerFilterList', value.map((x) => x.serialize()).toList());
  }

  void addToOfferFilterList(OfferOptionStruct value) {
    offerFilterList.add(value);
    prefs.setStringList('ff_offerFilterList',
        _offerFilterList.map((x) => x.serialize()).toList());
  }

  void removeFromOfferFilterList(OfferOptionStruct value) {
    offerFilterList.remove(value);
    prefs.setStringList('ff_offerFilterList',
        _offerFilterList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromOfferFilterList(int index) {
    offerFilterList.removeAt(index);
    prefs.setStringList('ff_offerFilterList',
        _offerFilterList.map((x) => x.serialize()).toList());
  }

  void updateOfferFilterListAtIndex(
    int index,
    OfferOptionStruct Function(OfferOptionStruct) updateFn,
  ) {
    offerFilterList[index] = updateFn(_offerFilterList[index]);
    prefs.setStringList('ff_offerFilterList',
        _offerFilterList.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInOfferFilterList(int index, OfferOptionStruct value) {
    offerFilterList.insert(index, value);
    prefs.setStringList('ff_offerFilterList',
        _offerFilterList.map((x) => x.serialize()).toList());
  }

  bool _isSwitchOn = false;
  bool get isSwitchOn => _isSwitchOn;
  set isSwitchOn(bool value) {
    _isSwitchOn = value;
  }

  double _offersCount = 0.0;
  double get offersCount => _offersCount;
  set offersCount(double value) {
    _offersCount = value;
  }

  List<OfferStruct> _offers = [];
  List<OfferStruct> get offers => _offers;
  set offers(List<OfferStruct> value) {
    _offers = value;
  }

  void addToOffers(OfferStruct value) {
    offers.add(value);
  }

  void removeFromOffers(OfferStruct value) {
    offers.remove(value);
  }

  void removeAtIndexFromOffers(int index) {
    offers.removeAt(index);
  }

  void updateOffersAtIndex(
    int index,
    OfferStruct Function(OfferStruct) updateFn,
  ) {
    offers[index] = updateFn(_offers[index]);
  }

  void insertAtIndexInOffers(int index, OfferStruct value) {
    offers.insert(index, value);
  }

  /// Store the preference like if user is allowed to get his location
  bool _locationAccess = false;
  bool get locationAccess => _locationAccess;
  set locationAccess(bool value) {
    _locationAccess = value;
    prefs.setBool('ff_locationAccess', value);
  }

  /// store the preference if user allowed the notification preference to send
  /// him a notification.
  bool _notificationsEnabled = true;
  bool get notificationsEnabled => _notificationsEnabled;
  set notificationsEnabled(bool value) {
    _notificationsEnabled = value;
    prefs.setBool('ff_notificationsEnabled', value);
  }

  List<String> _onboardingImages = [
    'https://firebasestorage.googleapis.com/v0/b/localeaz.appspot.com/o/onboarding%2Fonboarding_1.svg?alt=media&token=7e081a7b-60d3-4e20-9484-df0bed0b5d51',
    'https://firebasestorage.googleapis.com/v0/b/localeaz.appspot.com/o/onboarding%2Fonboarding_2.svg?alt=media&token=84cb5db1-3ea1-4388-a7d8-ae788f09e31b',
    'https://firebasestorage.googleapis.com/v0/b/localeaz.appspot.com/o/onboarding%2Fonboarding_3.svg?alt=media&token=07b6a54a-4790-4cf2-8dcf-c22b26b65546',
    'https://firebasestorage.googleapis.com/v0/b/localeaz.appspot.com/o/onboarding%2Fonboarding_4.svg?alt=media&token=40295462-9b6f-4f8e-b1b2-ba6352cc98d3',
    'https://firebasestorage.googleapis.com/v0/b/localeaz.appspot.com/o/onboarding%2Fonboarding_5.svg?alt=media&token=0730fff2-f711-44f6-9555-79dfd57e1568',
    'https://firebasestorage.googleapis.com/v0/b/localeaz.appspot.com/o/onboarding%2Fonboarding_6.svg?alt=media&token=88a7a6b1-cf04-4b19-aecc-f2683c252af5'
  ];
  List<String> get onboardingImages => _onboardingImages;
  set onboardingImages(List<String> value) {
    _onboardingImages = value;
  }

  void addToOnboardingImages(String value) {
    onboardingImages.add(value);
  }

  void removeFromOnboardingImages(String value) {
    onboardingImages.remove(value);
  }

  void removeAtIndexFromOnboardingImages(int index) {
    onboardingImages.removeAt(index);
  }

  void updateOnboardingImagesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    onboardingImages[index] = updateFn(_onboardingImages[index]);
  }

  void insertAtIndexInOnboardingImages(int index, String value) {
    onboardingImages.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
