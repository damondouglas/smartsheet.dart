library smartsheet.client;

import 'dart:async';
import 'package:http/http.dart' as http;

final _authority = "api.smartsheet.com";
final _version = "2.0";
final _authorization = "Authorization";
final _bearer = "Bearer ";

class Client {
  http.Client _inner;
  Map commonHeaders;
  Client(String token) {
    commonHeaders = {
      _authorization: _bearer + token,
      'Content-Type': 'application/json'
    };
    _inner = new http.Client();
  }
  Future<http.Response> get(String unencodedPath, {Map queryParameters}) {
    var uri = _buildUri(unencodedPath, queryParameters);
    return _inner.get(uri, headers: commonHeaders);
  }

  Future<http.Response> post(String unencodedPath, Map body,
      {Map queryParameters}) {
    var uri = _buildUri(unencodedPath, queryParameters);
    return _inner.post(uri, headers: commonHeaders, body: body);
  }
}

Uri _buildUri(String unencodedPath, [Map queryParameters]) {
  var path = _version + unencodedPath;
  Uri uri;
  if (queryParameters != null && queryParameters.isNotEmpty)
    uri = new Uri.https(_authority, path, queryParameters);
  else
    uri = new Uri.https(_authority, path);

  return uri;
}
