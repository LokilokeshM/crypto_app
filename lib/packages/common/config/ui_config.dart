// Flutter imports:
import 'package:flutter/material.dart';

class UiConfig {
  static BuildContext? _appContext;

  static BuildContext get appContext {
    final result = _appContext;
    if (result == null) {
      throw StateError(
          'SmukkUIConfig.appContext called before MaterialApp widget configured');
    }
    return result;
  }

  static set appContext(BuildContext context) {
    _appContext = context;
  }
}
