import 'package:bakery_time/widget/UtilWidgets.dart';
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
          const Text(
            "베이커리 타임",
            style: TextStyle(
                color: colorPrimary900,
                fontWeight: FontWeight.bold,
                fontFamily: "euljiro",
                fontSize: 30),
          ),
          const Text(
            "이제는 시간을 구울 시간",
            style: TextStyle(
                color: colorPrimary600,
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
                    child: const Center(
                        child: Text(
                      "로그인",
                      style: TextStyle(
                          color: colorPrimaryWhite,
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
                color: colorPrimary900,
              ),
            ),
            const Text("   소셜 계정으로 로그인   "),
            Expanded(
              child: Container(
                height: 1,
                color: colorPrimary900,
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
            color: colorPrimary900,
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
  return const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    color: colorPrimary900,
  );
}
