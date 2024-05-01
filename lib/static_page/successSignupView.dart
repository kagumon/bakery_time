import 'package:flutter/material.dart';

class SuccessSignupView extends StatefulWidget {
  const SuccessSignupView({super.key});

  @override
  State<SuccessSignupView> createState() => _SuccessSignupViewState();
}

class _SuccessSignupViewState extends State<SuccessSignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox.shrink()),
            const Text("회원가입을 완료했습니다."),
            const Expanded(child: SizedBox.shrink()),
            GestureDetector(
              onTap: () => {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/login", (route) => false)
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                width: double.infinity,
                height: 50,
                decoration: loginButtonStyle(),
                child: Center(
                    child: Text("로그인하러가기", style: loginButtonTextStyle())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

InputDecoration textInputStyle() {
  return const InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      fillColor: Color.fromRGBO(255, 255, 255, 1),
      filled: true);
}

BoxDecoration loginButtonStyle() {
  return const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    color: Color.fromRGBO(158, 78, 28, 1),
  );
}

TextStyle loginButtonTextStyle() {
  return const TextStyle(
    color: Color.fromRGBO(255, 255, 255, 1),
  );
}

BoxDecoration signupButtonStyle() {
  return const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    color: Color.fromRGBO(255, 233, 220, 1),
  );
}

TextStyle signupButtonTextStyle() {
  return const TextStyle(
    color: Color.fromRGBO(158, 78, 28, 1),
  );
}
