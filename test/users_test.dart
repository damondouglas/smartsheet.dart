import 'package:test/test.dart';
import 'common.dart';
import 'package:smartsheet/src/users.dart';
import 'package:smartsheet/src/model.dart';

main() {
  group('users.dart', () {
    Config config;
    User user;
    setUpAll(() async {
      config = await Config.readFromFile('test/config.json');
      var responseData = await getCurrentUser(config.oauthToken);
      user = new User.fromJson(responseData);
    });
    group('current', () {
      test('should acquire current loggedin user', () {
        expect(user.email, config.email);
      });
    });
  });
}
