import 'package:bakery_time/widget/UtilWidgets.dart';
import 'package:flutter/material.dart';

class EnterView extends StatefulWidget {
  const EnterView({super.key});

  @override
  State<EnterView> createState() => _EnterViewState();
}

class _EnterViewState extends State<EnterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(child: SizedBox.shrink()),
          const Text("베이커리타임", style: TextStyle(fontFamily: "euljiro", color: colorPrimary800, fontSize: 40),),
          const Text("시간을 굽다.", style: TextStyle(fontFamily: "euljiro", color: colorPrimary800, fontSize: 30),),
          const Expanded(child: SizedBox.shrink()),
          Container(
            padding: const EdgeInsets.all(50),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => {Navigator.of(context).pushNamed('/login')},
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: double.infinity,
                    height: 50,
                    decoration: loginButtonStyle(),
                    child: const Center(
                        child: Text("로그인",
                            style: TextStyle(
                              color: colorPrimaryWhite,
                            ))),
                  ),
                ),
                GestureDetector(
                  onTap: () => {Navigator.of(context).pushNamed('/agree')},
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    width: double.infinity,
                    height: 50,
                    decoration: signupButtonStyle(),
                    child: const Center(child: Text("계정이 없으신가요?")),
                  ),
                ),
              ],
            ),
          ),
        ],
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
    color: colorPrimary800,
  );
}

BoxDecoration signupButtonStyle() {
  return const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    color: colorPrimary300,
  );
}

TextStyle signupButtonTextStyle() {
  return const TextStyle(
    color: colorPrimary800,
  );
}
