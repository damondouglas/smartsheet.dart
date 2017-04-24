import 'dart:async';
import 'dart:convert';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf_route/shelf_route.dart' as route;

import 'smartsheet.dart' as smartsheet;

class Smartsheet {
  String apiKey;
  Smartsheet(this.apiKey);

  shelf.Handler get handler => () {
        var router = route.router();
        router..get('smartsheet/users/me', _me);

        return router.handler;
      }();
}

Future<shelf.Response> _me(shelf.Request request) async {
  var headers = request.headers;
  if (!headers.containsKey('Authorization'))
    return new shelf.Response.forbidden("{'error':'forbidden'}");

  var bearerToken = headers['Authorization'];
  var token = bearerToken.replaceAll('Bearer ', '');
  var responseData = await smartsheet.getCurrentUser(token);
  var body = JSON.encode(responseData);
  return new shelf.Response.ok(body);
}
