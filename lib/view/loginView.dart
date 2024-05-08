import 'package:bakery_time/util/UtilWidgets.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _idTextController = TextEditingController();
  final _pwTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          emptyExpanded(),
          Text(
            "베이커리 타임",
            style: TextStyle(
                color: logn0001,
                fontWeight: FontWeight.bold,
                fontFamily: "euljiro",
                fontSize: 30),
          ),
          Text(
            "이제는 시간을 구울 시간",
            style: TextStyle(
                color: logn0002,
                fontWeight: FontWeight.w700,
                fontFamily: "euljiro",
                fontSize: 20),
          ),
          Container(
            padding: const EdgeInsets.all(30),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _idTextController,
                  decoration: textInputStyle("아이디"),
                ),
                heightSizeBox(5),
                TextField(
                  controller: _pwTextController,
                  decoration: textInputStyle("비밀번호"),
                ),
                heightSizeBox(5),
                GestureDetector(
                  onTap: () => {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("/home", (route) => false)
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: loginButtonStyle(),
                    child: Center(
                        child: Text(
                      "로그인",
                      style: TextStyle(
                          color: comm0001,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                heightSizeBox(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        child: const Text("아이디 찾기"),
                        onTap: () => {print("아이디 찾기")}),
                    const Text("|"),
                    GestureDetector(
                        child: const Text("비밀번호 찾기"),
                        onTap: () => {print("아이디 찾기")}),
                    const Text("|"),
                    GestureDetector(
                        child: const Text("회원가입"),
                        onTap: () => {print("아이디 찾기")}),
                  ],
                ),
              ],
            ),
          ),
          heightSizeBox(30),
          Row(children: [
            widthSizeBox(30),
            Expanded(
              child: Container(
                height: 1,
                color: logn0003,
              ),
            ),
            const Text("   소셜 계정으로 로그인   "),
            Expanded(
              child: Container(
                height: 1,
                color: logn0003,
              ),
            ),
            widthSizeBox(30),
          ]),
          heightSizeBox(20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            GestureDetector(
              onTap: () => {print("1")},
              child: Image.asset(
                'assets/images/login_kakao.png',
                width: 40,
                height: 40,
              ),
            ),
            GestureDetector(
              onTap: () => {print("1")},
              child: Image.asset(
                'assets/images/login_google.png',
                width: 40,
                height: 40,
              ),
            ),
            GestureDetector(
              onTap: () => {print("1")},
              child: Image.asset(
                'assets/images/login_naver.png',
                width: 40,
                height: 40,
              ),
            ),
          ]),
          const Expanded(child: SizedBox.shrink()),
          Container(
            height: 10,
            color: logn0004,
          )
        ],
      ),
    );
  }
}

InputDecoration textInputStyle(String hint) {
  return InputDecoration(
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      hintText: hint);
}

BoxDecoration loginButtonStyle() {
  return BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
    color: logn0005,
  );
}
