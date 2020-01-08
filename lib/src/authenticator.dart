import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'user.dart';

abstract class Authenticator {
  /// Returns a widget builder for action button
  WidgetBuilder get action;

  /// Authenticate and return user if success
  ///
  /// Returns null on failure
  Future<User> authenticate({Map parameters});
}
