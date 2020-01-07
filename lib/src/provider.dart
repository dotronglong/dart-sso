import 'package:flutter/material.dart';

import 'authenticator.dart';
import 'user.dart';

abstract class Provider {
  List<Authenticator> _authenticators = List();

  /// Register authenticator
  void use(Authenticator authenticator) => _authenticators.add(authenticator);

  /// Return list of action buttons
  List<Widget> actions([Widget divider]) {
    List<Widget> actions = [];
    for (Authenticator authenticator in _authenticators) {
      actions.add(authenticator.action());
      if (divider != null) {
        actions.add(divider);
      }
    }

    return actions;
  }

  /// Authenticate and return logged user
  Future<User> start();

  /// Stop session, log user out
  Future<void> stop();
}
