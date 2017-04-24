library smartsheet.test.client;

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
        responseData = await client.get(path);
      });
      test('should get data on current user.', () {
        expect(responseData['email'], config.email);
      });
    });
    group('get /users?email=<email>', () {
      var path = "/users";
      Map responseData;
      setUpAll(() async {
        responseData =
            await client.get(path, queryParameters: {'email': config.email});
      });
      test('should get data on user', () {
        expect(responseData['email'], config.email);
      });
    }, skip: 'not supported by trial plan');
  });
}
