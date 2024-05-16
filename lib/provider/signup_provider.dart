import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupProvider with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  //final SharedPreferences _pref = PreferencesHandler.instance.pref;
  String _explanText = "이름을 입력해주세요.";
  String _verificationId = "";
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _jumin1TextController = TextEditingController();
  final TextEditingController _jumin2TextController = TextEditingController();
  final TextEditingController _hpnoTextController = TextEditingController();
  final TextEditingController _verifyTextController = TextEditingController();
  final FocusNode _jumin2FocusNode = FocusNode();
  bool _visiableJumin = false;
  bool _visiableHpno = false;
  bool _visiableVerify = false;
  bool _allinput = false;

  //SharedPreferences get pref => _pref;
  String get explanText => _explanText;
  TextEditingController get nameTextController => _nameTextController;
  TextEditingController get jumin1TextController => _jumin1TextController;
  TextEditingController get jumin2TextController => _jumin2TextController;
  TextEditingController get hpnoTextController => _hpnoTextController;
  TextEditingController get verifyTextController => _verifyTextController;
  FocusNode get jumin2FocusNode => _jumin2FocusNode;
  bool get visiableJumin => _visiableJumin;
  bool get visiableHpno => _visiableHpno;
  bool get visiableVerify => _visiableVerify;
  bool get allinput => _allinput;

  SignupProvider();

  Future<void> allInputCheck() async {
    if (_nameTextController.text.length >= 2 &&
        _jumin1TextController.text.length >= 6 &&
        _jumin2TextController.text.isNotEmpty &&
        _hpnoTextController.text.length >= 8) {
      _explanText = "인증을 진행해주세요.";
      _allinput = true;
    } else {
      _explanText = "정보를 다시 확인해주세요.";
      _allinput = false;
    }
    notifyListeners();
  }

  Future<void> showJuminnoInput() async {
    if (_visiableJumin) {
      return;
    }
    _visiableJumin = true;
    _explanText = "주민번호를 입력해주세요.";
    notifyListeners();
  }

  Future<void> showHpnoInput() async {
    if (_visiableHpno) {
      return;
    }
    _visiableHpno = true;
    _explanText = "전화번호를 입력해주세요.";
    notifyListeners();
  }

  bool checkPhoneNumber() {
    if (_hpnoTextController.text.substring(0, 3) != "010" &&
        _hpnoTextController.text.substring(0, 3) != "011" &&
        _hpnoTextController.text.substring(0, 3) != "016" &&
        _hpnoTextController.text.substring(0, 3) != "017" &&
        _hpnoTextController.text.substring(0, 3) != "019") {
      _explanText = "전화번호를 다시 확인해주세요.";
      _allinput = false;
      return false;
    } else {
      return true;
    }
  }

  Future<void> sendVrifyNumber() async {
    if (!checkPhoneNumber()) {
      _explanText = "전화번호를 다시 확인해주세요";
      notifyListeners();
      return;
    }
    await auth.verifyPhoneNumber(
        phoneNumber: "+82${_hpnoTextController.text.substring(1)}",
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException error) {
          if (error.code == 'invalid-phone-number') {
            _explanText = "유효하지 않는 전화번호입니다.";
            notifyListeners();
            return;
          } else {
            _explanText = "시스템 오류가 발생했어요.\n관리자에게 문의해주세요.";
            notifyListeners();
            return;
          }
        },
        codeSent: (String verificationId, forceResendingToken) async {
          _explanText = "인증번호를 입력해주세요.";
          _visiableVerify = true;
          _verificationId = verificationId;
          notifyListeners();
          return;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _explanText = "인증 시간이 초과했어요.\n다시 시도해주세요.";
          notifyListeners();
          return;
        });
  }

  Future<void> checkVrifyNumber() async {
    if (_verifyTextController.text.length < 6) {
      _explanText = "인증번호를 다시 입력해주세요.";
      notifyListeners();
    }

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: _verifyTextController.text);

    try {
      await auth.signInWithCredential(credential).then((_) {
        print("인증이 완료되었습니다.");
      });
    } catch (e) {
      print("인증에 실패했습니다.\n다시 시도해주세요.");
    }
  }
}
