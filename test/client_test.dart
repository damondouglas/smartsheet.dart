library smartsheet.test.client;

import 'dart:convert';
import 'package:test/test.dart';
import 'package:smartsheet/src/client.dart';
import 'common.dart';

main() {
  group('client', () {
    Config config;
    Client client;
    setUpAll(() async {
      config = await Config.readFromFile('test/config.json');
      client = new Client(config.oauthToken);
    });
    group('get /users/me', () {
      var path = "/users/me";
      Map responseData;
      setUpAll(() async {
        var response = await client.get(path);
        responseData = JSON.decode(response.body);
      });
      test('should get data on current user.', () {
        expect(responseData['email'], config.email);
      });
    }, skip: '');
    group('get /users?email=<email>', () {
      var path = "/users";
      Map responseData;
      setUpAll(() async {
        var response =
            await client.get(path, queryParameters: {'email': config.email});
        responseData = JSON.decode(response.body);
      });
      test('should get data on user', () {
        expect(responseData['email'], config.email);
      });
    }, skip: 'not supported by trial plan');
  });
}
