import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

GlobalKey appGlobalKey = GlobalKey();

class Global {
  final SharedPreferences pref;

  static late final Global _instance;

  static Global getInstance() => _instance;

  static Future<void> init(SharedPreferences pref) async {
    _instance = Global._(pref);
  }

  Global._(this.pref);
}
