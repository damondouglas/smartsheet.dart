import 'dart:io';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:smartsheet/smartsheet_shelf.dart' as smartsheet;
import 'package:shelf_cors/shelf_cors.dart' as shelf_cors;
import '../common.dart';

final pathToConfiguration = 'test/config.json';

main() async {
  var port = 9999;
  var config = await Config.readFromFile(pathToConfiguration);
  var s = new smartsheet.Smartsheet(config.oauthToken);
  var handler = const shelf.Pipeline()
      .addMiddleware(shelf_cors.createCorsHeadersMiddleware(corsHeaders: {
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Headers': 'Authorization'
      }))
      .addMiddleware(shelf.logRequests())
      .addHandler(s.handler);
  var server = await io.serve(handler, '0.0.0.0', port);

  server.autoCompress = true;

  print("Serving at ${server.address.address}:$port");
}
