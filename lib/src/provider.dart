import 'package:flutter/material.dart';

import 'authenticator.dart';
import 'mixin/will_notify.dart';
import 'notifier.dart';
import 'user.dart';

abstract class Provider {
  Widget get header;

  ThemeData get theme;

  Notifier get notifier => Notifier();

  final List<Authenticator> _authenticators = List();

  /// Construct Provider
  ///
  /// Receives a list of authenticators as argument
  Provider([List<Authenticator> authenticators = const []]) {
    for (Authenticator authenticator in authenticators) {
      this.use(authenticator);
    }
  }

  /// Register authenticator
  Provider use(Authenticator authenticator) {
    if (authenticator is WillNotify) {
      (authenticator as WillNotify).notifier = notifier;
    }
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
}
