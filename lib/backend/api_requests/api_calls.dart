import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AppStoreConnectCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'AppStoreConnect',
      apiUrl: 'https://api.appstoreconnect.apple.com/v1/bundleIds',
      callType: ApiCallType.GET,
      headers: {
        'Key':
            'Authorization  Value : Bearer eyJhbGciOiJFUzI1NiIsImtpZCI6IkhURjlMTFJKIiwidHlwIjoiSldUIn0.eyJpc3MiOiI3YzdmNjE2OS02NDgxLTRlMTctODdmNi1lZGU2YmQ1MzU1NTIiLCJpYXQiOjE3MzQ0NzY4ODMsImV4cCI6MTczNDQ3ODA4MywiYXVkIjoiYXBwc3RvcmVjb25uZWN0LXYxIn0.aA4ptvrm7kCSp6Mkd1kWP8LtgLdDPW7FZObX7OwdgDDJ9ugLvwa57XyvUbaXB0SYbRnDXTuJxANSsvcZE-vWGg',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
