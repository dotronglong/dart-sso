import 'package:flutter_test/flutter_test.dart';

import 'package:sso/sso.dart';

void main() {
  test('user getter', () {
    User user = User({
      "id": 1001,
      "email": "sample@domain.com",
      "token": "some-token"
    });

    expect(user.id, 1001);
    expect(user.email, "sample@domain.com");
    expect(user.token, "some-token");
  });
}