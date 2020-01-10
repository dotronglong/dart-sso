import 'package:flutter/material.dart';

import 'authenticator.dart';
import 'user.dart';

abstract class Provider {
  Widget get header;

  ThemeData get theme;

  final List<Authenticator> _authenticators;

  Provider([this._authenticators = const []]);

  /// Register authenticator
  Provider use(Authenticator authenticator) {
    _authenticators.add(authenticator);
    return this;
  }

  /// Return list of action buttons
  List<Widget> actions(BuildContext context, [Widget divider]) {
    List<Widget> actions = [];
    for (Authenticator authenticator in _authenticators) {
      actions.add(authenticator.action(context));
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

  /// Allow to notify user
  ///
  /// For instance, show an error, message or an email
  void notify(String message, [Map parameters]) => print(message);
}
