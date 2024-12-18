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
