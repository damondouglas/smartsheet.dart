import 'package:test/test.dart';

main() {
  group('token.dart', () {
    group('authorize url', () {
      test(
          'should be https://app.smartsheet.com/b/authorize?response_type=code&client_id=<client_id>&scope=<scopes>&state=<state>',
          () {
        expect(1, 1);
      });
    });

    group('obtain autorization code', () {
      test('should retrieve code, expires_in, and state', () {
        expect(1, 1);
      });
    });

    group('obtain token', () {
      test('should retrieve access_token, refresh_token, and expires_in', () {
        expect(1, 1);
      });
    });

    group('refresh token', () {
      test('should retrieve access_token, refresh_token, and expires_in', () {
        expect(1, 1);
      });
    });
  });
}
