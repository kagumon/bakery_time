import 'dart:async';
import 'dart:convert';
import 'package:bakery_time/model/bakery_timer_model.dart';
import 'package:bakery_time/model/cake_model.dart';
import 'package:bakery_time/util/pref_handler.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupProvider with ChangeNotifier {
  //final SharedPreferences _pref = PreferencesHandler.instance.pref;
  String _explanText = "이름을 입력해주세요.";
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _jumin1TextController = TextEditingController();
  final TextEditingController _jumin2TextController = TextEditingController();
  final TextEditingController _hpnoTextController = TextEditingController();
  final FocusNode _jumin2FocusNode = FocusNode();
  bool _visiableJumin = false;
  bool _visiableHpno = false;
  int _step = 0;

  //SharedPreferences get pref => _pref;
  String get explanText => _explanText;
  TextEditingController get nameTextController => _nameTextController;
  TextEditingController get jumin1TextController => _jumin1TextController;
  TextEditingController get jumin2TextController => _jumin2TextController;
  TextEditingController get hpnoTextController => _hpnoTextController;
  FocusNode get jumin2FocusNode => _jumin2FocusNode;
  bool get visiableJumin => _visiableJumin;
  bool get visiableHpno => _visiableHpno;

  SignupProvider();

  Future<void> allInputCheck() async {
    if (_nameTextController.text.isNotEmpty &&
        _jumin1TextController.text.length < 6 &&
        _jumin2TextController.text.isEmpty &&
        _hpnoTextController.text.length < 8) {}
  }
}
