import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final idTextController = TextEditingController();
  final pwTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/login_background.png'),
          const Text("BAKERY TIME"),
          const Text("bake time warmly"),
          Container(
            padding: const EdgeInsets.all(50),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: idTextController,
                  border: Border.all(width: 0),
                  decoration: textInputStyle(Icons.people),
                ),
                const SizedBox(height: 5,),
                TextField(
                  controller: pwTextController,
                  decoration: textInputStyle(Icons.vpn_key),
                ),
                GestureDetector(
                  onTap: ()=>{print("login")},
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: double.infinity,
                    height: 50,
                    decoration: loginButtonStyle(),
                    child: const Center(child: Text("로그인")),
                  ),
                ),
                GestureDetector(
                  onTap: ()=>{print("login kakao")},
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: double.infinity,
                    height: 50,
                    decoration: loginButtonStyle(),
                    child: const Center(child: Text("카카오톡 간편로그인")),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox.shrink()),
        ],
      ),
    );
  }
}

InputDecoration textInputStyle(IconData icon) {
  return InputDecoration(
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    fillColor:  const Color.fromRGBO(231, 212, 200, 1),
    filled: true,
    prefixIcon: Icon(icon),
  );
}

BoxDecoration loginButtonStyle() {
  return const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    color: Color.fromRGBO(165, 161, 160, 1),
  );
}